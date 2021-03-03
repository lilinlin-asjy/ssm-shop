package com.asjy.controller;

import com.asjy.po.*;
import com.asjy.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Set;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/28
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private HttpSession session;

    @Resource
    private OrderService orderService;

    @RequestMapping("/orderConfirm")
    public String orderConfirm() {
        User user = (User) session.getAttribute("user");
        return "orderConfirm";
    }

    @RequestMapping("/toPay")
    public String toPay(Order order, Model model) {
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        Integer oId = orderService.CreateOrder(order, cart, user);
        //清空购物车中的信息
        cart.clearCartItem();
        model.addAttribute("oId", oId);
        return "pay";
    }

    @RequestMapping("/doPay")
    public String doPay(Order order, Model model) {
        //1.修改订单状态，为已付款
        order.setState(1);
        orderService.changeState(order);
        //2.查询订单信息
        OrderExt orderExt = orderService.getOrderDetail(order);
        model.addAttribute("orderExt", orderExt);
        return "paySuccess";
    }

    @RequestMapping("/toOrder")
    public String toOrder(OrderForPageBean orderForPageBean, Model model) {
        //准备order数据
        User user = (User) session.getAttribute("user");

        orderForPageBean.setPageSize(3);
        orderForPageBean.setuId(user.getuId());
        OrderForPageBean userOrder = orderService.getOrderByUserId(orderForPageBean);
        model.addAttribute("orderForPageBean", userOrder);
        Map<String, Integer> orderStateNum = orderService.getOrderNumByState(user.getuId());
        model.addAttribute("orderStateNum", orderStateNum);
        return "order_view";


    }

    @RequestMapping("/delOrder")
    public String delOrder(Integer pageNow, Order order, Model model) {
        User user = (User) session.getAttribute("user");
        order.setState(-1);
        orderService.delOrder(order);
        return "redirect:/order/toOrder?pageNow=" + pageNow;

    }

    @RequestMapping("/toReceipt")
    public String toReceipt(Order order, Model model) {
        OrderExt orderExt = orderService.getOrderDetail(order);
        model.addAttribute("orderExt", orderExt);
        return "receipt";
    }


    @RequestMapping("/doReceipt")
    public String doReceipt(Order order) {
        order.setState(3);
        orderService.changeState(order);
        return "redirect:/order/toOrder";
    }


}