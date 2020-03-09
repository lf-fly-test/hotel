package com.dj.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.demo.pojo.Room;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @ClassName RoomMapper
 * @Description: TODO
 * @Author LHF
 * @Date 2020/3/6 13:17
 **/
public interface RoomMapper extends BaseMapper<Room> {
    List<Room> findRoomAll(Room room) throws DataAccessException;



    void update(Room room) throws DataAccessException;

    void updateStatus(Room room) throws DataAccessException;

}
