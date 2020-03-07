package com.dj.demo.web;

import com.dj.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
