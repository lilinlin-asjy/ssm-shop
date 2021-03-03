package com.asjy.service.impl;

import com.asjy.dao.UserMapper;
import com.asjy.po.User;
import com.asjy.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/24
 * @Description: com.asjy.service.impl
 * @version: 1.0
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public List<User> findAllUser() {
       return userMapper.findAllUser();
    }

    @Override
    public Integer checkUserName(String userName) {
        return userMapper.checkUserName(userName);
    }

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public User checkUser(User user) {
        return userMapper.checkUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }
}