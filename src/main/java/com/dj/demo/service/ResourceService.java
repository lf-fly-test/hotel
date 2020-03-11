package com.dj.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.demo.pojo.Resource;

import java.util.List;

public interface ResourceService extends IService<Resource> {


    List<Resource> getUserResourceList(Integer roleId) throws Exception;
}
