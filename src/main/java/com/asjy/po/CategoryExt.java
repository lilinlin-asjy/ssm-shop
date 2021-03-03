package com.asjy.po;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class CategoryExt extends Category {
    private List<CategorySecond> categorySecondList;

    public List<CategorySecond> getCategorySecondList() {
        return categorySecondList;
    }

    public void setCategorySecondList(List<CategorySecond> categorySecondList) {
        this.categorySecondList = categorySecondList;
    }
}