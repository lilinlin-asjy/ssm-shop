package com.asjy.po;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class OrderForPageBean extends PageBean<OrderExt> {
    private Integer uId;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }
}