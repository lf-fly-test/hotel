package com.dj.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.swing.*;

/**
 * @ClassName User
 * @Description: 用户实体类
 * @Date 2020/3/6 12:41
 **/

@Data
@TableName("hotel_user")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /***
     * @MethodName: 用户名
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userName;

    /***
     * @MethodName:用户密码
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userPwd;

    /***
     * @MethodName: 用户等级
     * @Description: //1是普通住户， 2是管理员 ， 3是老板
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer userLevel;

    /***
     * @MethodName: 用户手机号
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userPhone;

    /***
     * @MethodName: 用户邮箱
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userEmail;

    /***
     * @MethodName: 用户性别
     * @Description: //1是男，2是女
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer userSex;

    /***
     * @MethodName:用户会员
     * @Description: //1是会员，2不是会员
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer isVip;

    /***
     * @MethodName: 会员等级
     * @Description: //会员等级  1是黄金  2是白金 3是黑金
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer vipLevel;
    
    /***
     * @MethodName: 会员积分
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Integer vipPoints;


    /**
     * @MethodName: 状态 1存在  0伪删除
     * @author Mr.wang
     * @date 2020/3/7--20:08
     */
    private Integer is_del;

    /**
     * @MethodName: code验证码
     * @author Mr.wang
     * @date 2020/3/7--20:8
     */
    private String code;

    /***
     * @Description: //1:任命,2:撤职
     * @Author: bj-lx
     * @Date: 2020/3/8
     */
    private Integer status;

}
