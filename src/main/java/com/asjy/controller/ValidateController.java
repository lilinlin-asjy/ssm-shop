package com.asjy.controller;



import cn.dsna.util.images.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.io.IOException;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@Controller
@RequestMapping("/validate")
public class ValidateController {
    @RequestMapping("/getImg")
    public void getImg(HttpServletResponse response, HttpSession session){
        //设置网页不缓存
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragrma", "no-cache");
        response.setDateHeader("Expires", 0);

        try {
            ValidateCode validateCode = new ValidateCode(163,64,4,4);
            System.out.println(validateCode.getCode());
            session.setAttribute("syscode",validateCode.getCode());
            validateCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/checkValidate")
    @ResponseBody
    public String checkValidate(String userCode,HttpSession session){
        String syscode =  (String)session.getAttribute("syscode");
        System.out.println(syscode+"/////"+userCode);
         if(userCode.equalsIgnoreCase(syscode)){
             System.out.println("ok");
             return "ok";
         }else{
             System.out.println("no");
             return "no";
         }
    }
}