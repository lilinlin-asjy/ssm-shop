package com.asjy.dao;

import com.asjy.po.CategoryExt;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.dao
 * @version: 1.0
 */
public interface CategoryMapper {
    List<CategoryExt> getIndexNav();
}
