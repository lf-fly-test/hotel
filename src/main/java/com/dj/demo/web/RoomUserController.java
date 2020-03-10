package com.dj.demo.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.demo.common.ResultModel;
import com.dj.demo.common.SystemConstant;
import com.dj.demo.pojo.Room;
import com.dj.demo.pojo.RoomUser;
import com.dj.demo.pojo.User;
import com.dj.demo.service.RoomService;
import com.dj.demo.service.RoomUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/roomUser/")
public class RoomUserController {

    @Autowired
    private RoomUserService roomUserService;

    @Autowired
    private RoomService roomService;

    /**
     * 展示
     */
    @RequestMapping("show")
    public ResultModel<Object> show(String room, RoomUser roomUser, Integer agemin, Integer agemax, Integer pageNo, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            HashMap<String, Object> map = new HashMap<>();
            QueryWrapper<RoomUser> queryWrapper = new QueryWrapper<>();
            if (StringUtils.hasText(roomUser.getUserName())) {
                queryWrapper.like("user_name", roomUser.getUserName());
            }
            if (StringUtils.hasText(roomUser.getRoom())) {
                queryWrapper.like("room", roomUser.getRoom());
            }
            if (agemin != null) {
                queryWrapper.gt("start_time", agemin);

            }
            if (agemax != null) {
                queryWrapper.lt("end_time", agemax);
            }
            if (user.getUserLevel() == 1) {
                queryWrapper.eq("user_name", user.getUserName());

            }
            if (room != null && room != "") {
                queryWrapper.eq("room", room);
                queryWrapper.eq("is_del", 1);
            }

            if (pageNo != null) {
                PageHelper.startPage(pageNo, 4);
            }
            List<RoomUser> userList = roomUserService.list(queryWrapper);

            PageInfo<RoomUser> pageinfo = new PageInfo<>(userList);

            map.put("totalNum", pageinfo.getPages());

            map.put("data", userList);


            return new ResultModel<>().success(map);


        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    //退房
    @RequestMapping("update")
    public ResultModel<Object> update(RoomUser roomUser, Room room) {
        try {


            //批量修改
            QueryWrapper<RoomUser> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("room", roomUser.getRoom());
            List<RoomUser> userList = roomUserService.list(queryWrapper);
            List<RoomUser> userlist = new ArrayList<>();
            for (RoomUser roomUser1 : userList) {
                roomUser.setId(roomUser1.getId());
                roomUser.setIsDel(2);
                roomUser.setRoomStatus(0);
                roomUser.setEndTime(new Date());
                roomUserService.updateById(roomUser);
            }
            room.setRoomStatus(SystemConstant.ZERO);
            room.setUserName(SystemConstant.isNull);
            roomService.updateById(room);

            return new ResultModel<>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }

    }

    //批量添加
    @RequestMapping("adds")
    public ResultModel<Object> adds(RoomUser roomUser, Room room) {
        try {
            List<RoomUser> RoomUserList = new ArrayList<>();
            Room room1 = roomService.getById(room.getId());
            for (RoomUser roomUser2 : roomUser.getRoomUserList()) {
                if (StringUtils.isEmpty(roomUser2.getUserName()) || StringUtils.isEmpty(roomUser2.getUserSex())) {
                    return new ResultModel<>().error(SystemConstant.NOT_NULL);
                }
                roomUser2.setRoom(room1.getRoom());
                roomUser2.setRoomType(room1.getRoomType());
                roomUser2.setStartTime(new Date());
                roomUser2.setEndTime(null);
                roomUser2.setRoomStatus(2);
                roomUser2.setIsDel(1);
                RoomUserList.add(roomUser2);

            }

            roomUserService.saveBatch(RoomUserList);
            return new ResultModel<>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }
}