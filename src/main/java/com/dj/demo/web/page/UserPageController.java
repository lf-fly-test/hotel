package com.dj.demo.web.page;

import com.dj.demo.pojo.User;
import com.dj.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
     *  去邮箱登录页面
     */
    @RequestMapping("toforget")
    public String toforget(){
        return "user/forget";
    }


    /**
     *  去手机号登录页面
     */
    @RequestMapping("tophone")
    public String tophone(){
        return "user/phone";
    }

    /***
     * 去用户展示页
     */
    @RequestMapping("toAdminShow")
    public String toAdminShow(){
        return "user/show";
    }

    /***
     * 去添加管理员页面
     */
    @RequestMapping("toAdminAdd")
    public String toAdminAdd(){
        return "user/add_admin";
    }

    @RequestMapping("exitLoginUser")
    public String exitLoginUser (HttpSession session){
        session.invalidate();
        return "user/login";
    }

    @RequestMapping("toShow")
    public String toShow(){
        return "user/show_user";
    }

    @RequestMapping("toApplyForMembership")
    public String toApplyForMembership(Integer id, Model model) throws Exception {

        User user = userService.findById(id);
        model.addAttribute("user", user);

        return  "user/applyForMembership";
    }


}
