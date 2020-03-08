package com.dj.demo.web.page;

import com.dj.demo.pojo.Room;
import com.dj.demo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName RoomPageController
 * @Description: TODO
 * @Date 2020/3/6 13:23
 **/
@Controller
@RequestMapping("/room/")
public class RoomPageController {
    @Autowired
    private RoomService roomService;

    @RequestMapping("toShow")
    public String toShow(){
        return "room/show";
    }


}
