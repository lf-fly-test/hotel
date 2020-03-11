package com.dj.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.demo.mapper.ResourceMapper;
import com.dj.demo.pojo.Resource;
import com.dj.demo.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    @Autowired
    private  ResourceMapper resourceMapper;

    @Override
    public List<Resource> getUserResourceList(Integer roleId) {
        return resourceMapper.getUserResourceList(roleId);
    }
}
