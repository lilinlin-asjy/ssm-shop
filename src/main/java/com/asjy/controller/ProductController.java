package com.asjy.controller;

import com.asjy.po.Product;
import com.asjy.po.ProductForPageBean;
import com.asjy.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.websocket.server.ServerEndpoint;
import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/26
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;

    @RequestMapping("/products")
    public String products(ProductForPageBean ProductForPageBean,Model model){
        ProductForPageBean productForPageBean = productService.getProducts(ProductForPageBean);
        List<Product> isHotProducts = productService.getIsHotProducts(ProductForPageBean);
        model.addAttribute("productForPageBean",productForPageBean);
        model.addAttribute("isHotProducts",isHotProducts);
        return "products";
    }

    @RequestMapping("/product_view")
    public String productView(Integer pId,Model model){
        Product product = productService.getProductById(pId);
        model.addAttribute("product",product);
        return "product_view";
    }
}