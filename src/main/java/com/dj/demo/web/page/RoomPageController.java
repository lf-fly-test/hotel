package com.dj.demo.web.page;

import com.dj.demo.pojo.Room;
import com.dj.demo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping("toRoomUserShow")
    public String toRoomUserShow(){
        return "room/room_user_show";
    }

    @RequestMapping("toShow")
    public String toShow(){
        return "room/show";
    }

    @RequestMapping("toUserShow/{room}")
    public String toUserShow(@PathVariable("room") String room, Model model){
        model.addAttribute("room",room);
        return "room/user_show";
    }

    @RequestMapping("toAdd/{id}")
    public String toAdd(@PathVariable("id") Integer id, Model model){
        model.addAttribute("id",id);
        return "room/add";
    }
}
