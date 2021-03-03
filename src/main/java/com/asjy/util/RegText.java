package com.asjy.util;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/24
 * @Description: com.asjy.util
 * @version: 1.0
 */
public class RegText {
    public static void main(String[] args) {
        Integer pageNow=10;
        int page=1;
        System.out.println(pageNow==10);

        String regex="1[3-9][\\d]{9}";
        String regex1= "(?=.*[a-zA-z])(?=.*[\\d])(?=.*[\\W])[a-zA-Z\\d\\W]{6,16}";
        System.out.println("111aa!!".matches(regex1));


    }
}