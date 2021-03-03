package com.asjy.po;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class OrderItem {
    private Integer itemId;
    private Integer count;
    private Double subTotal;
    private Integer pId;
    private Integer oId;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }
}