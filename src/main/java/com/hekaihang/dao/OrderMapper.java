package com.hekaihang.dao;

import com.hekaihang.pojo.Orders;

public interface OrderMapper {
    int addOrder(Orders orders);

    int deleteOrderById(int id);


    Orders queryAllOrders();

    Orders queryOrdersById(int id);
}
