package com.alekseytyan.service.api;

import com.alekseytyan.dto.OrderDTO;
import com.alekseytyan.entity.Order;
import com.alekseytyan.util.pathfinding.Route;

import java.util.List;

public interface OrderService extends AbstractService<Order, OrderDTO, Long> {

    List<OrderDTO> findVerified();

    Route calculateRoute(OrderDTO orderDTO);

    List<Route> calculateRoute(List<OrderDTO> orderDTOList);

    int calculateWeight(Order order);

}