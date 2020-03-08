package com.dj.demo.web;

import com.dj.demo.common.ResultModel;
import com.dj.demo.pojo.Room;
import com.dj.demo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName RoomController
 * @Description: TODO
 * @Date 2020/3/6 13:22
 **/
@RestController
@RequestMapping("/room/")
public class RoomController {

    @Autowired
    private RoomService roomService;


    @RequestMapping("show")
    public ResultModel show(Room room){
             Map map = new HashMap();
        try {
            List<Room> list = roomService.findRoomAll(room);
            map.put("list",list);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常"+e.getMessage());
        }
    }
      @RequestMapping("update")
    public ResultModel update(Room room){
        try {
            roomService.update(room);
            return new ResultModel().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常"+e.getMessage());
        }
    }



}
