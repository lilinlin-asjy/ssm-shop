package com.asjy.controller;

import com.asjy.po.Cart;
import com.asjy.po.CartItem;
import com.asjy.po.Product;
import com.asjy.po.User;
import com.asjy.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/27
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    @Resource
    private HttpSession session;
    @Resource
    private ProductService productService;
    @RequestMapping("/toCart")
    public String toCart(){
        return "cart";
    }

    @RequestMapping("/addCart")
    @ResponseBody
    public String addCartItem(Integer pId,Integer count){
        //创建购物项
        CartItem cartItem = new CartItem();
        Product product = productService.getProductById(pId);
        cartItem.setCount(count);
        cartItem.setProduct(product);
        //读取购物车
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart!=null){
            cart.addCartItem(cartItem);
        }else{
            cart = new Cart();
            System.out.println("cart="+cart+"////////////");
            cart.addCartItem(cartItem);
            session.setAttribute("cart",cart);
        }
        return "ok";
    }

    @RequestMapping("/changeCount")
    @ResponseBody
    public String changeCount(Integer count,Integer pId){
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart!=null){
            cart.changeCount(count,pId);
        }
        return cart.getTotal().toString();
    }

    @RequestMapping("/delCartItem")
    @ResponseBody
    public String delCartItem(Integer pId){
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart!=null){
            cart.delCartItem(pId);
        }
        return cart.getTotal().toString();
    }

    @RequestMapping("/clearCartItem")
    @ResponseBody
    public String clearCartItem(){
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart!=null){
            cart.clearCartItem();
        }
        return cart.getTotal().toString();
    }
    @RequestMapping(value = "/query/{name}/{age}")
    @ResponseBody
    public User getUser(@PathVariable("name") String name,@PathVariable("age") String age){
        User user = new User();
        user.setName("a");
        user.setPhone("123456");
        System.out.println(user);
        System.out.println(name);
        System.out.println(age);
        return user;
    }

}

