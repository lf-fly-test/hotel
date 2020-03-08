package com.dj.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @ClassName Room
 * @Description: TODO
 * @Date 2020/3/6 12:57
 **/
@Data
@TableName("room")
public class Room {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /***
     * @MethodName:房间
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String room;
    
    /***
     * @MethodName: 房间类型
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String roomType;
    
    /***
     * @MethodName: 房间状态
     * @Description: // 0空闲  1：预约中  2：预约成功 ，已入住
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer roomStatus;


    /**
     * 房间价格
     */
    private Double roomPrice;
    
    /***
     * @MethodName: 用户名
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userName;
}
