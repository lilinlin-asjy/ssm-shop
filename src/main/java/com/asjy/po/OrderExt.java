package com.asjy.po;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class OrderExt extends Order {
    private List<OrderItemExt> orderItemExtList;

    public List<OrderItemExt> getOrderItemExtList() {
        return orderItemExtList;
    }

    public void setOrderItemExtList(List<OrderItemExt> orderItemExtList) {
        this.orderItemExtList = orderItemExtList;
    }
}