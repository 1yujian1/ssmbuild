package com.hekaihang.controller;
import com.hekaihang.dao.OrderMapper;
import com.hekaihang.pojo.Orders;
import com.hekaihang.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    @Qualifier("OrderServiceImpl")
    OrderService orderService;

    @RequestMapping("/toaddorder")
    public String toOrder(){
        return "/add_order";
    }

    @RequestMapping("/addorder")
    public String toOrder(String[] product,String order_id,String[] product_1){
        Orders order=new Orders();
        order.setSorder(Integer.valueOf(order_id));
        int k=0;
        for(int i=0;i<product.length;i++){
            while (product_1[k].equals("")){
                k++;
            }
            order.setProduct_id(Integer.valueOf(product[i]));
            order.setProduct_num(Integer.valueOf(product_1[k]));
            k++;
            orderService.addOrder(order);
        }

        return "/add_order";
    }

}
