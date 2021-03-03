package com.asjy.po;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class OrderItemExt extends  OrderItem {
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}