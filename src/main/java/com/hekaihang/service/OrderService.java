package com.hekaihang.service;

import com.hekaihang.pojo.Orders;

public interface OrderService {

    int addOrder(Orders orders);

    int deleteOrderById(int id);


    Orders queryAllOrders();

    Orders queryOrdersById(int id);
}
