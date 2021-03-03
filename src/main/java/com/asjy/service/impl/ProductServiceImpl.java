package com.asjy.service.impl;

import com.asjy.controller.IndexNav;
import com.asjy.dao.ProductMapper;
import com.asjy.po.CategoryExt;
import com.asjy.po.CategorySecond;
import com.asjy.po.Product;
import com.asjy.po.ProductForPageBean;
import com.asjy.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.service.impl
 * @version: 1.0
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductMapper productMapper;

    @Override
    public Map<Integer,List<Product>> getFloor(List<CategoryExt> indexNav) {
        Map<Integer,List<Product>> productMap = new HashMap<>();
        //遍历一级类目
        for (CategoryExt categoryExt : indexNav) {
            //遍历二级类目
            List<CategorySecond> categorySecondList = categoryExt.getCategorySecondList();
            for (CategorySecond categorySecond : categorySecondList) {
                //根据二级类目id查询商品
                List<Product> productList = productMapper.getProductByCsId(categorySecond.getCsId());
                //封装到map
                productMap.put(categorySecond.getCsId(),productList);
            }
        }
        return productMap;
    }

    @Override
    public ProductForPageBean getProducts(ProductForPageBean productForPageBean) {
       //1.封装请求参数
        int rowCount = productMapper.getRowCount(productForPageBean);
        productForPageBean.setTotal(rowCount);
        List<Product> products = productMapper.getProducts(productForPageBean);
        productForPageBean.setList(products);
        return productForPageBean;
    }

    @Override
    public List<Product> getIsHotProducts(ProductForPageBean productForPageBean) {
        return productMapper.getIsHotProducts(productForPageBean);
    }

    @Override
    public Product getProductById(Integer pId) {
        return productMapper.getProductById(pId);
    }


}