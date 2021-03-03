package com.asjy.dao;

import com.asjy.po.Order;
import com.asjy.po.OrderExt;
import com.asjy.po.OrderForPageBean;
import com.asjy.po.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.dao
 * @version: 1.0
 */
public interface OrderMapper {
    void addOrder(Order order);

    void addOrderItem(OrderItem orderItem);

    void changeState(Order order);

    OrderExt getOrderDetail(Order order);

    List<OrderExt> getOrderByUserId(OrderForPageBean orderForPageBean);

    Integer getRowCount(OrderForPageBean orderForPageBean);

    Integer getOrderNumBystate(@Param("uId") Integer uId,@Param("state") Integer state);


}