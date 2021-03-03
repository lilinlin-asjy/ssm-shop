package com.asjy.dao;

import com.asjy.po.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/24
 * @Description: com.asjy.dao
 * @version: 1.0
 */
@Repository
public interface UserMapper {

    List<User> findAllUser();

    Integer checkUserName(String userName);

    void add(User user);

    User checkUser(User user);

    int updateUser(User user);
}