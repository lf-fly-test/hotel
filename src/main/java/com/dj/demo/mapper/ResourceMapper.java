package com.dj.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.demo.pojo.Resource;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ResourceMapper extends BaseMapper<Resource> {
    List<Resource> getUserResourceList(Integer roleId) throws DataAccessException;
}
