package com.alekseytyan.service.implementation;

import com.alekseytyan.dao.api.OrderDao;
import com.alekseytyan.dto.DriverDTO;
import com.alekseytyan.dto.LoadDTO;
import com.alekseytyan.dto.OrderDTO;
import com.alekseytyan.entity.City;
import com.alekseytyan.entity.DistanceMap;
import com.alekseytyan.entity.Load;
import com.alekseytyan.entity.Order;
import com.alekseytyan.entity.enums.LoadStatus;
import com.alekseytyan.service.api.MapService;
import com.alekseytyan.service.api.OrderService;
import com.alekseytyan.util.pathfinding.Route;
import com.alekseytyan.util.pathfinding.RouteChecker;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl extends AbstractServiceImpl<Order, OrderDao, OrderDTO, Long> implements OrderService {

    private final MapService mapService;


    @Autowired
    public OrderServiceImpl(OrderDao dao, ModelMapper mapper, MapService mapService) {
        super(dao, mapper, OrderDTO.class, Order.class);

        this.mapService = mapService;
    }

    @Override
    @Transactional
    public OrderDTO delete(OrderDTO orderDTO) {

        if(orderDTO.getDrivers() != null) {
            // Set order as null in dependencies
            for (DriverDTO d: orderDTO.getDrivers()) {
                d.setOrder(null);
            }
        }

        if(orderDTO.getLorry() != null) {
            orderDTO.getLorry().setOrder(null);
        }

        OrderDTO refreshedOrderDTO = update(orderDTO);

        return super.delete(refreshedOrderDTO);
    }

    @Override
    @Transactional
    public OrderDTO deleteById(Long entityId) {

        OrderDTO orderDTO = findById(entityId);

        return delete(orderDTO);
    }

    @Override
    public List<OrderDTO> findVerified() {
        return convertToDTO(getDao().findVerified());
    }

    @Override
    public Route calculateRoute(OrderDTO orderDTO) {

        List<DistanceMap> distanceMaps = mapService.convertToEntity(mapService.findAll());

        Order order = convertToEntity(orderDTO);

        List<Load> loads = order.getLoads();
        City cityStart = order.getLorry().getCity();
        
        return RouteChecker.calculateRoute(distanceMaps, loads, cityStart);
    }

    @Override
    public List<Route> calculateRoute(List<OrderDTO> orderDTOList) {


        List<DistanceMap> distanceMaps = mapService.convertToEntity(mapService.findAll());
        List<Route> routes = new ArrayList<>();


        List<Order> orders = convertToEntity(orderDTOList);

        for (Order o: orders) {
            List<Load> loads = o.getLoads();
            City cityStart = o.getLorry().getCity();

            routes.add(RouteChecker.calculateRoute(distanceMaps, loads, cityStart));
        }

        return routes;
    }

    @Override
    public Map<Long, String> convertLoadsToMap(OrderDTO orderDTO) {

        Map<Long, String> loads = new HashMap<>();

        for (LoadDTO l: orderDTO.getLoads()) {
            loads.put(l.getId(), l.getStatus().toString());
        }

        return loads;
    }

    @Override
    public List<LoadDTO> convertLoadsToList(Map<Long, String> loads, DriverDTO driverDTO) {

        List<LoadDTO> list = driverDTO.getOrder().getLoads();

        for (LoadDTO l: list) {
            l.setStatus(LoadStatus.valueOf(loads.get(l.getId())));
        }

        return list;
    }

    @Override
    public int calculateWeight(Order order) {
        List<Load> loads = order.getLoads();

        return RouteChecker.calculateMaxWeight(loads);
    }


}