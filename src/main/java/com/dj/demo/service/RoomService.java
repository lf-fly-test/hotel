package com.dj.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.demo.pojo.Room;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @ClassName RoomService
 * @Description: TODO
 * @Author LHF
 * @Date 2020/3/6 13:09
 **/
public interface RoomService extends IService<Room> {
    List<Room> findRoomAll(Room room) throws Exception;

    void update(Room room) throws Exception;

}
