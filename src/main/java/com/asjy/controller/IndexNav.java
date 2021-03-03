package com.asjy.controller;

import com.asjy.po.CategoryExt;
import com.asjy.po.CategorySecond;
import com.asjy.po.Product;
import com.asjy.service.CategoryService;
import com.asjy.service.ProductService;
import com.asjy.util.CategoryUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@Controller
public class IndexNav {
    @Resource
    private CategoryService categoryService;
    @Resource
    private ProductService productService;
    @Resource
    private ServletContext application;

    @RequestMapping("/index")
    public String toIndex(Model model){
        List<CategoryExt> indexNav = (List<CategoryExt>)application.getAttribute("indexNav");
        Map<Integer, List<Product>> products = productService.getFloor(indexNav);
        model.addAttribute("productMap",products);
        return "index";
    }
}