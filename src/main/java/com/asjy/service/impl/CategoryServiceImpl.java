package com.asjy.service.impl;

import com.asjy.dao.CategoryMapper;
import com.asjy.po.CategoryExt;
import com.asjy.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/25
 * @Description: com.asjy.service.impl
 * @version: 1.0
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;
    @Override
    public List<CategoryExt> getIndexNav() {
        return categoryMapper.getIndexNav();
    }
}