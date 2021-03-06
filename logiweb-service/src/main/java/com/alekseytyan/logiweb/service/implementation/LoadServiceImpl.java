package com.alekseytyan.logiweb.service.implementation;

import com.alekseytyan.logiweb.dto.ClientLoadDTO;
import com.alekseytyan.logiweb.dto.LoadDTO;
import com.alekseytyan.logiweb.dto.OrderDTO;
import com.alekseytyan.logiweb.dao.api.LoadDao;
import com.alekseytyan.logiweb.entity.City;
import com.alekseytyan.logiweb.entity.Load;
import com.alekseytyan.logiweb.entity.enums.LoadStatus;
import com.alekseytyan.logiweb.service.api.LoadService;
import com.alekseytyan.logiweb.service.api.OrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LoadServiceImpl extends AbstractServiceImpl<Load, LoadDao, LoadDTO, Long> implements LoadService {

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public LoadServiceImpl(LoadDao dao,
                           ModelMapper mapper) {
        super(dao, mapper, LoadDTO.class, Load.class);
    }

    @Override
    @Transactional(readOnly = true)
    public Long findOrderId(Long loadId) {
        return getDao().findById(loadId).getOrder().getId();
    }

    @Override
    @Transactional(readOnly = true)
    public LoadDTO findByToken(String token) {
        return convertToDTO(getDao().findByToken(token));
    }

    @Override
    @Transactional(readOnly = true)
    public List<LoadDTO> findAllByClientId(String clientId) {
        return convertToDTO(getDao().findAllByClientId(clientId));
    }

    @Override
    @Transactional
    public LoadDTO saveClientLoad(ClientLoadDTO clientLoadDTO) {

        Load load = new Load();
        load.setClientId(clientLoadDTO.getClientId());
        load.setCityLoad(new City(clientLoadDTO.getCityLoad()));
        load.setCityUnload(new City(clientLoadDTO.getCityUnload()));
        load.setStatus(clientLoadDTO.getStatus());
        load.setName(clientLoadDTO.getName());
        load.setWeight(clientLoadDTO.getWeight());
        load.setToken(clientLoadDTO.getToken());

        return convertToDTO(getDao().save(load));
    }

    @Override
    @Transactional
    public LoadDTO update(LoadDTO loadDTO) {

        loadDTO = super.update(loadDTO);
        OrderDTO orderDTO = loadDTO.getOrder();

        boolean isOrderFinished = orderDTO.getLoads().stream().allMatch(l -> l.getStatus() == LoadStatus.DELIVERED);
        orderDTO.setFinished(isOrderFinished);
        orderService.update(orderDTO);

        return loadDTO;
    }

    @Override
    @Transactional
    public LoadDTO delete(LoadDTO loadDTO) {

        OrderDTO orderDTO = loadDTO.getOrder();
        orderDTO.getLoads().remove(loadDTO);

        loadDTO.setOrder(orderService.update(orderDTO));

        LoadDTO refreshedLoadDTO = update(loadDTO);

        return super.delete(refreshedLoadDTO);
    }

    @Override
    @Transactional
    public LoadDTO deleteById(Long entityId) {

        LoadDTO loadDTO = findById(entityId);

        return delete(loadDTO);
    }
}
