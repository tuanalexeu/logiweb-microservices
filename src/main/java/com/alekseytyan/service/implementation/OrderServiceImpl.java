package com.alekseytyan.service.implementation;

import com.alekseytyan.dao.api.OrderDao;
import com.alekseytyan.dto.DriverDTO;
import com.alekseytyan.dto.OrderDTO;
import com.alekseytyan.entity.City;
import com.alekseytyan.entity.DistanceMap;
import com.alekseytyan.entity.Load;
import com.alekseytyan.entity.Order;
import com.alekseytyan.service.api.OrderService;
import com.alekseytyan.util.Route;
import com.alekseytyan.util.RouteChecker;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl extends AbstractServiceImpl<Order, OrderDao, OrderDTO, Long> implements OrderService {


    @Autowired
    public OrderServiceImpl(OrderDao dao, ModelMapper mapper) {
        super(dao, mapper, OrderDTO.class, Order.class);
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
    public Route calculateRoute(Order order, List<DistanceMap> distanceMaps) {

        List<Load> loads = order.getLoads();

        City cityStart = order.getLorry().getCity();

        RouteChecker routeChecker = new RouteChecker(loads, distanceMaps, cityStart);
        
        return routeChecker.calculateRoute();
    }

    @Override
    public int calculateWeight(Order order) {
        List<Load> loads = order.getLoads();

        RouteChecker routeChecker = new RouteChecker(loads, null, null);
        return routeChecker.calculateMaxWeight();
    }
}
