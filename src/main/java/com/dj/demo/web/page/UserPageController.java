package com.dj.demo.web.page;

import com.dj.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName UserPageController
 * @Description: TODO
 * @Date 2020/3/6 13:23
 **/
@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    /**
     * 去登录
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "user/login";
    }


    /**
     *  去注册
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "user/add";
    }


    /**
     *  去找回密码页面
     */
    @RequestMapping("toforget")
    public String toforget(){
        return "user/forget";
    }

    /***
     * @MethodName:
     * @Description: //去管理员展示页面
     * @Author: bj-lx
     * @Date: 2020/3/8
     */
    @RequestMapping("toAdminShow")
    public String toAdminShow(){
        return "user/admin_show";
    }

    /***
     * @MethodName:
     * @Description: //去管理员添加页面
     * @Author: bj-lx
     * @Date: 2020/3/8
     */
    @RequestMapping("toAdminAdd")
    public String toAdminAdd (){
        return "user/add_admin";
    }



}
