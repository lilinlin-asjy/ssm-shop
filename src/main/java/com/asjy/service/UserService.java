package com.asjy.service;

import com.asjy.po.User;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/24
 * @Description: com.asjy.service.impl
 * @version: 1.0
 */
public interface UserService {
     List<User> findAllUser();

    Integer checkUserName(String userName);

    void add(User user);

    User checkUser(User user);

    int updateUser(User user);
}
