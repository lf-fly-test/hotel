package com.dj.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.demo.mapper.RoomMapper;
import com.dj.demo.pojo.Room;
import com.dj.demo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName RoomServiceImpl
 * @Description: TODO
 * @Date 2020/3/6 13:11
 **/
@Service
@Transactional(rollbackFor = Exception.class)
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public List<Room> findRoomAll(Room room) throws Exception {
        return roomMapper.findRoomAll(room);
    }



    @Override
    public void update(Room room) throws Exception {
        roomMapper.update(room);
    }
}
