package com.asjy.po;

import java.util.*;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/27
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class Cart {
    private Map<Integer,CartItem> cartItemMap = Collections.synchronizedMap(new LinkedHashMap<Integer,CartItem>());
    private Double total=0.0;

    public Collection<CartItem> getCartItemMap() {
        return cartItemMap.values();
    }

    public void setCartItemMap(Map<Integer, CartItem> cartItemMap) {
        this.cartItemMap = cartItemMap;
    }

    public Double getTotal() {
        return total;
    }


    public void addCartItem(CartItem cartItem) {
        //获取pId
        Integer pId = cartItem.getProduct().getpId();
        //添加购物项
        if(cartItemMap.containsKey(pId)){
            CartItem oldCartItem = cartItemMap.get(pId);
            Integer count = oldCartItem.getCount();
            oldCartItem.setCount(count+cartItem.getCount());
        }else{
            cartItemMap.put(pId,cartItem);
        }
        //计算总计金额
        total = total+cartItem.getSubTotal();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartItemMap=" + cartItemMap +
                ", total=" + total +
                '}';
    }

    public void changeCount(Integer count, Integer pId) {
        CartItem cartItem = cartItemMap.get(pId);
        total = total - cartItem.getSubTotal();
        cartItem.setCount(count);
        total = total + cartItem.getSubTotal();
    }

    public void delCartItem(Integer pId) {
        CartItem remove = cartItemMap.remove(pId);
        total = total - remove.getSubTotal();
    }

    public void clearCartItem() {
        cartItemMap.clear();
        total = 0.0;
    }
}