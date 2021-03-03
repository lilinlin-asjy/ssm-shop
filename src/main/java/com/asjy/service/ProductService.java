package com.asjy.service;

import com.asjy.controller.IndexNav;
import com.asjy.po.CategoryExt;
import com.asjy.po.Product;
import com.asjy.po.ProductForPageBean;

import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.service
 * @version: 1.0
 */
public interface ProductService {
    Map<Integer,List<Product>> getFloor(List<CategoryExt> indexNav);

    ProductForPageBean getProducts(ProductForPageBean productForPageBean);

    List<Product> getIsHotProducts(ProductForPageBean productForPageBean);

    Product getProductById(Integer pId);
}
