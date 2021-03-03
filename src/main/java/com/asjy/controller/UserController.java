package com.asjy.controller;

import com.asjy.po.User;
import com.asjy.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;


/**
 * @Auther: lilinlin
 * @Date: 2021/2/24
 * @Description: com.asjy.controller
 * @version: 1.0
 */
@RequestMapping("/user")
@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private HttpSession session;

    @RequestMapping("/index")
    public String toIndex(User user){
        return "index";
    }

    @RequestMapping("/userlist")
    public String userlist(Model model,ModelAndView modelAndView){
       List<User> users = userService.findAllUser();
       model.addAttribute("users",users);
       return "user";
    }

    /**
     * 跳转注册页面
     * @return
     */
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    /**
     * 验证用户
     * @return
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String userName){
        Integer res = userService.checkUserName(userName);
        if(res>0){
            return "no";
        }
        return "ok";
    }

    @RequestMapping("/doRegister")
    public String doRegister(User user, String rePassword, Model model, HttpSession session,String validate){
        Map<String,String> errorMap = new HashMap<String,String>();
        String phoneRegex="1[3-9][\\d]{9}";
        String passwordRegex="(?=.*[a-zA-z])(?=.*[\\d])(?=.*[\\W])[a-zA-Z\\d\\W]{6,16}";

        if(user.getUsername()==null || "".equals(user.getUsername().trim()) || "no".equals(checkUserName(user.getUsername()))){
            errorMap.put("username","用户名未填或已存在");
        }

        if(user.getPassword()==null || "".equals(user.getPassword().trim()) || !user.getPassword().matches(passwordRegex)){
            errorMap.put("password","密码未填，或未有6-16的字母、数字、符号组成");
        }
        if(!rePassword.equals(user.getPassword())){
            errorMap.put("rePassword","确认密码错误");
        }
        if(user.getPhone()==null || "".equals(user.getPhone().trim()) || !user.getPhone().matches(phoneRegex)){
            errorMap.put("phone","电话号码必填，或格式不正确");
        }

        String syscode =  (String)session.getAttribute("syscode");
        if(!validate.equalsIgnoreCase(syscode)){
            errorMap.put("validate","验证码错误");
        }

        if(errorMap.size()>0){
             model.addAttribute("errorMap",errorMap);
            model.addAttribute("username",user.getUsername());
            model.addAttribute("password",user.getPassword());
            model.addAttribute("rePassword",rePassword);
            model.addAttribute("phone",user.getPhone());

            return "register";
        }else{
            userService.add(user);
            return "login";
        }


    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/dologin")
    public String doLogin(User user, String remember, HttpServletResponse response,Model model){
        User u = userService.checkUser(user);
        System.out.println(u);
        if(u==null){
            //清除cookie
            Cookie cookie1 = new Cookie("username","");
            Cookie cookie2 = new Cookie("password","");
            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie1.setPath("/");
            cookie2.setPath("/");
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            model.addAttribute("msg","用户名或密码错误");
            return "login";
        }else{
            session.setAttribute("user",u);
            Cookie cookie1 = new Cookie("username",u.getUsername());
            Cookie cookie2 = new Cookie("password",u.getPassword());
            if(remember!=null){
                cookie1.setMaxAge(60*60*24*7);
                cookie2.setMaxAge(60*60*24*7);
            }else{
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
            }
            cookie1.setPath("/");
            cookie2.setPath("/");
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            return "index";
        }
    }

    @RequestMapping("/toPersonal")
    public String toPersonal(){
        return "personal";
    }

    @RequestMapping("/doPersonal")
    public String doPersonal(User user,HttpServletResponse response){
        int res = userService.updateUser(user);
        if(res>0){
            User u = (User)session.getAttribute("user");
            u.setAddr(user.getAddr());
            u.setEmail(user.getEmail());
            u.setName(user.getName());
            u.setPhone(user.getPhone());
            //信息修改成功，需要清除cookie
            Cookie cookie2 = new Cookie("password","");
             cookie2.setMaxAge(0);
            cookie2.setPath("/");
            response.addCookie(cookie2);
            return "login";
        }else{
            return "personal";
        }

    }

    @RequestMapping("/logout")
    public String logout(){
        session.invalidate();
        return "login";
    }
}