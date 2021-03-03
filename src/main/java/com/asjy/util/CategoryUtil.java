package com.asjy.util;

import com.asjy.controller.IndexNav;
import com.asjy.po.CategoryExt;
import com.asjy.service.CategoryService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/26
 * @Description: com.asjy.util
 * @version: 1.0
 */
@Component
public class CategoryUtil {
    @Resource
    private CategoryService categoryService;
    @Resource
    private ServletContext application;

    @PostConstruct
    public void getIndexNav(){
        System.out.println("///////////////////////////////////////");
        List<CategoryExt> indexNav = categoryService.getIndexNav();
        application.setAttribute("indexNav",indexNav);
     }
}