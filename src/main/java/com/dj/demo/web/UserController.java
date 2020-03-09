package com.dj.demo.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.demo.common.ResultModel;

import com.dj.demo.common.SystemConstant;
import com.dj.demo.pojo.User;
import com.dj.demo.service.UserService;
import com.dj.demo.utils.JavaEmailUtils;
import com.dj.demo.utils.MessageVerifyUtils;
import com.dj.demo.utils.PasswordSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
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
        queryWrapper.eq("is_del", com.dj.demo.common.SystemConstant.YES_STATUS);
        User user1 = userService.getOne(queryWrapper);
        // session存放用户信息
        session.setAttribute("user", user1);
        if(user1 == null){
            return new ResultModel<>().error(com.dj.demo.common.SystemConstant.INPUT_ERROR);
        }
        userService.updateById(user1);
        return new ResultModel<>().success(com.dj.demo.common.SystemConstant.SUCCESS);
    }

    /**
     * 忘记密码邮箱登录
     * @author Mr.wang
     */
    @RequestMapping("emailLogin")
    public ResultModel<Object> emailLogin(User user, HttpSession session) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        //用户名/手机号/邮箱+密码登陆
        queryWrapper.or(i -> i.eq("user_name", user.getUserEmail())
                .or().eq("user_email", user.getUserEmail())
                .or().eq("user_phone", user.getUserEmail()));
        queryWrapper.eq("user_pwd", user.getUserPwd());
        queryWrapper.eq("is_del", com.dj.demo.common.SystemConstant.YES_STATUS);
        User user1 = userService.getOne(queryWrapper);
        // session存放用户信息
        session.setAttribute("user", user1);
        if(user1 == null){
            return new ResultModel<>().error(com.dj.demo.common.SystemConstant.INPUT_ERROR);
        }
        userService.updateById(user1);
        return new ResultModel<>().success(com.dj.demo.common.SystemConstant.SUCCESS);
    }


    /**
     * 用户注册
     * @author Mr.wang
     */
    @PostMapping("add")
    public ResultModel<Object> add(User user) throws Exception {
        //注册用户
        String pwd = PasswordSecurityUtil.enCode32(user.getUserPwd());
        user.setUserPwd(pwd);
        user.setIs_del(SystemConstant.IS_NOT_DEL);
        userService.save(user);
        //注册用户角色关联表
        return new ResultModel<>().success(com.dj.demo.common.SystemConstant.SUCCESS);
    }

    /**
     * 验证是否有用户
     * @author Mr.wang
     */
    @RequestMapping("findByName")
    public boolean findByName(User user){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name",user.getUserName())
                .or().eq("user_email",user.getUserEmail())
                .or().eq("user_phone",user.getUserPhone()));
        User user1 = userService.getOne(queryWrapper);
        return user1 == null ? true : false;
    }

    /**
     * 验证是否有邮箱
     * @author Mr.wang
     */
    @RequestMapping("findByEmail")
    public boolean findByEmail(User user){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name",user.getUserName())
                .or().eq("user_email",user.getUserEmail())
                .or().eq("user_phone",user.getUserPhone()));
        User user1 = userService.getOne(queryWrapper);
        return user1 == null ? false : true;
    }

    /**
     * 验证是否有手机号
     * @author Mr.wang
     */
    @RequestMapping("findByPhone")
    public boolean findByPhone(User user){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name",user.getUserName())
                .or().eq("user_email",user.getUserEmail())
                .or().eq("user_phone",user.getUserPhone()));
        User user1 = userService.getOne(queryWrapper);
        return user1 == null ? false : true;
    }


    // 邮箱获取验证码
    @RequestMapping("getEmailCode")
    public ResultModel<Object> getEmailCode(User user) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name",user.getUserName())
                .or().eq("user_email",user.getUserEmail())
                .or().eq("user_phone",user.getUserPhone()));
        User user1 = userService.getOne(queryWrapper);
        JavaEmailUtils.sendEmail(user1.getUserEmail(), "您的验证码",user1.getUserPwd());
        return new ResultModel<Object>().success();
    }


    // 手机号获取验证码
    @RequestMapping("getCode")
    public ResultModel<Object> getCode(User user) throws Exception {
        Integer code = MessageVerifyUtils.getNewcode();
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_phone",user.getUserPhone()));
        User user1 = userService.getOne(queryWrapper);
        user1.setCode(String.valueOf(code));
        userService.updateById(user1);
        MessageVerifyUtils.sendSms(user1.getUserPhone(), String.valueOf(code));
        return new ResultModel<Object>().success();
    }

    /**
     * 忘记密码邮箱登录
     * @author Mr.wang
     */
    @RequestMapping("phoneLogin")
    public ResultModel<Object> phoneLogin(User user, HttpSession session) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        //用户名/手机号/邮箱+密码登陆
        queryWrapper.or(i -> i.eq("user_phone", user.getUserPhone()));
        queryWrapper.eq("code", user.getCode());
        queryWrapper.eq("is_del", com.dj.demo.common.SystemConstant.YES_STATUS);
        User user1 = userService.getOne(queryWrapper);
        // session存放用户信息
        session.setAttribute("user", user1);
        if(user1 == null){
            return new ResultModel<>().error(com.dj.demo.common.SystemConstant.INPUT_ERROR);
        }
        userService.updateById(user1);
        return new ResultModel<>().success(com.dj.demo.common.SystemConstant.SUCCESS);
    }
}
