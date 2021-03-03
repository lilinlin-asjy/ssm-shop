package com.asjy.service;

import com.asjy.po.*;

import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.service
 * @version: 1.0
 */
public interface OrderService {
    Integer CreateOrder(Order order, Cart cart, User user);

    void changeState(Order order);

    OrderExt getOrderDetail(Order order);

    OrderForPageBean getOrderByUserId(OrderForPageBean orderForPageBean);

    Map<String, Integer> getOrderNumByState(Integer uId);

    void delOrder(Order order);
}
