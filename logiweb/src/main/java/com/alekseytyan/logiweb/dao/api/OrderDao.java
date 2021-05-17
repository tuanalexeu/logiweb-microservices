package com.alekseytyan.logiweb.dao.api;

import com.alekseytyan.logiweb.entity.Order;

import java.util.List;

public interface OrderDao extends AbstractDao<Order, Long> {
    List<Order> findVerified(int size, int page);
}
