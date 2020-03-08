package com.dj.demo.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.demo.common.ResultModel;

import com.dj.demo.pojo.User;
import com.dj.demo.service.UserService;
import com.dj.demo.utils.PasswordSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @ClassName UserController
 * @Description: TODO
 * @Date 2020/3/6 13:22
 **/
@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;



    /**
     * 员工老板登录
     * @author Mr.wang
     */
    @RequestMapping("login")
    public ResultModel<Object> login(User user, HttpSession session) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        //用户名/手机号/邮箱+密码登陆
        queryWrapper.or(i -> i.eq("user_name", user.getUserName())
                .or().eq("user_email", user.getUserName())
                .or().eq("user_phone", user.getUserName()));
        queryWrapper.eq("user_pwd", PasswordSecurityUtil.enCode32(user.getUserPwd()));
        queryWrapper.eq("is_del", com.dj.restaurant.common.SystemConstant.YES_STATUS);
        User user1 = userService.getOne(queryWrapper);
        // session存放用户信息
        session.setAttribute("user", user1);
        if(user1 == null){
            return new ResultModel<>().error(com.dj.restaurant.common.SystemConstant.INPUT_ERROR);
        }
        userService.updateById(user1);
        return new ResultModel<>().success(com.dj.restaurant.common.SystemConstant.SUCCESS);
    }






}
