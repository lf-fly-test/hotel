package com.dj.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @ClassName Room
 * @Description: TODO
 * @Date 2020/3/6 12:57
 **/
@Data
@TableName("room_user")
public class RoomUser {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 删除状态
     */
    private Integer isDel;
    /**
     * 性别 1 男 2 女
     */
    private Integer userSex;

    /**
     * 用户姓名
     */
    private String userName;
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
     * @Author: bj-lx
     * @Date: 2020/3/11
     */
    private Double price;

    /***
     * @MethodName: 房间状态
     * @Description: // 0空闲  1：预约中  2：预约成功 ，已入住
     * @Author: bj-lx
     * @Date: 2020/3/6
     */

    private Integer roomStatus;

    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private String roomStatusShow;

    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private List<RoomUser> roomUserList;

    public String getRoomStatusShow() {
        if(roomStatus==0){
            return "退房";
        }
        if(roomStatus==1){
            return "预约中";
        }

        return "已入住";
    }

    public void setRoomStatusShow(String roomStatusShow) {
        this.roomStatusShow = roomStatusShow;
    }

    /**
     * '入住时间'
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 前台接受字符串转成时间类型
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* 只有把这个对象转为Json才生效返回 */
    private Date startTime;
    /**
     * 退房时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 前台接受字符串转成时间类型
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* 只有把这个对象转为Json才生效返回 */
    private Date endTime;
    /*  *//**
     * '入住时间'
     *//*

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 前台接受字符串转成时间类型
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") *//* 只有把这个对象转为Json才生效返回 *//*
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private Date agemin;
    *//**
     * 退房时间
     *//*

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 前台接受字符串转成时间类型
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") *//* 只有把这个对象转为Json才生效返回 *//*
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private Date agemax;*/
}
