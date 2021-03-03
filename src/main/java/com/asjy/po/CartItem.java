package com.asjy.po;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/27
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class CartItem {
    private Product product;
    private Integer count=1;
    private Double subTotal=0.0;

    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", count=" + count +
                ", subTotal=" + subTotal +
                '}';
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubTotal() {
        subTotal = count*product.getShopPrice();
        return subTotal;
    }


}