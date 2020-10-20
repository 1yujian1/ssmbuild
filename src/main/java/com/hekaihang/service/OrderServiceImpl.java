package com.hekaihang.service;

import com.hekaihang.dao.OrderMapper;
import com.hekaihang.pojo.Orders;

public class OrderServiceImpl implements OrderService {

    OrderMapper orderMapper;

    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public int addOrder(Orders orders) {
        return orderMapper.addOrder(orders);
    }

    @Override
    public int deleteOrderById(int id) {
        return orderMapper.deleteOrderById(id);
    }

    @Override
    public Orders queryAllOrders() {
        return orderMapper.queryAllOrders();
    }

    @Override
    public Orders queryOrdersById(int id) {
        return orderMapper.queryOrdersById(id);
    }
}
