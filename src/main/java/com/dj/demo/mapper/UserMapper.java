package com.dj.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.demo.pojo.User;
import org.springframework.dao.DataAccessException;

/**
 * @ClassName UserMapper
 * @Description: TODO
 * @Author LHF
 * @Date 2020/3/6 13:15
 **/
public interface UserMapper extends BaseMapper<User> {

    /**
     * 办理会员
     * @throws DataAccessException
     */
    void applyForMembership(User user) throws DataAccessException;


}
