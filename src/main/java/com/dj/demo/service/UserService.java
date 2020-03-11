package com.dj.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.demo.pojo.User;

/**
 * @ClassName UserService
 * @Description: TODO
 * @Author LHF
 * @Date 2020/3/6 13:08
 **/
public interface UserService extends IService<User> {

    /**
     * 办理会员
     * @throws Exception
     */
    void applyForMembership(User user) throws Exception;

    User findById(Integer id) throws Exception;
}
