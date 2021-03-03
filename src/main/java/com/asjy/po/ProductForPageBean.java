package com.asjy.po;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/26
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class ProductForPageBean extends PageBean<Product>{
    private Integer csId;
    private Integer cId;
    private String searchName;

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public Integer getCsId() {
        return csId;
    }

    public void setCsId(Integer csId) {
        this.csId = csId;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }


}