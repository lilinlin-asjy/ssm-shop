package com.asjy.dao;

import com.asjy.po.Product;
import com.asjy.po.ProductForPageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.dao
 * @version: 1.0
 */
public interface ProductMapper {


    List<Product> getProductByCsId(Integer csId);

    List<Product> getProducts(ProductForPageBean productForPageBean);

    int getRowCount(ProductForPageBean productForPageBean);

    List<Product> getIsHotProducts(ProductForPageBean productForPageBean);

    Product getProductById(Integer pId);
}