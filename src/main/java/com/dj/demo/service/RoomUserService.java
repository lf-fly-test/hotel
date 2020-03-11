package com.dj.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.demo.pojo.Room;
import com.dj.demo.pojo.RoomUser;

import java.util.List;

/**
 * @ClassName RoomService
 * @Description: TODO
 * @Author LHF
 * @Date 2020/3/6 13:09
 **/
public interface RoomUserService extends IService<RoomUser> {

    RoomUser findSumPrice() throws Exception;
}
