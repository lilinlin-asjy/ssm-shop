package com.asjy.service.impl;

import com.asjy.dao.OrderMapper;
import com.asjy.po.*;
import com.asjy.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.service.impl
 * @version: 1.0
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Override
    public Integer CreateOrder(Order order, Cart cart, User user) {
        //1.创建订单
        order.setOrderTime(new Date());
        order.setState(0);
        order.setTotal(cart.getTotal());
        order.setuId(user.getuId());
        orderMapper.addOrder(order);
        //2.创建订单项
        for(CartItem cartItem:cart.getCartItemMap()){
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getCount());
            orderItem.setoId(order.getoId());
            orderItem.setpId(cartItem.getProduct().getpId());
            orderItem.setSubTotal(cartItem.getSubTotal());
            orderMapper.addOrderItem(orderItem);
        }

        //3.返回pId
        return order.getoId();
    }

    @Override
    public void changeState(Order order) {
        orderMapper.changeState(order);
    }

    @Override
    public OrderExt getOrderDetail(Order order) {
        return orderMapper.getOrderDetail(order);
    }

    @Override
    public OrderForPageBean getOrderByUserId(OrderForPageBean orderForPageBean) {
        Integer rowCount = orderMapper.getRowCount(orderForPageBean);
        orderForPageBean.setTotal(rowCount);
        List<OrderExt> orderExts = orderMapper.getOrderByUserId(orderForPageBean);
        orderForPageBean.setList(orderExts);

        return orderForPageBean;
    }

    @Override
    public Map<String, Integer> getOrderNumByState(Integer uId) {
        Map<String,Integer> map = new HashMap<>();
        for (int i = 0; i < 4; i++) {
            Integer number = orderMapper.getOrderNumBystate(uId,i);
            map.put(i+"",number);
        }
        return map;
    }

    @Override
    public void delOrder(Order order) {
        orderMapper.changeState(order);
    }
}