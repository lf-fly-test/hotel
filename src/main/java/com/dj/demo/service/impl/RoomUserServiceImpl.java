package com.dj.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.demo.mapper.RoomMapper;
import com.dj.demo.mapper.RoomUserMapper;
import com.dj.demo.pojo.Room;
import com.dj.demo.pojo.RoomUser;
import com.dj.demo.service.RoomService;
import com.dj.demo.service.RoomUserService;
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
public class RoomUserServiceImpl extends ServiceImpl<RoomUserMapper, RoomUser> implements RoomUserService {


}
