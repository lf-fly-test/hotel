package com.dj.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName Pay
 * @Description: TODO
 * @Date 2020/3/6 12:52
 **/

@Data
@TableName("pay")
public class Pay {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /***
     * @MethodName: 用户名
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private String userName;

    /***
     * @MethodName: 消费金额
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Double monetary;

    /***
     * @MethodName:消费时间
     * @Author: bj-lx
     * @Date: 2020/3/6
     */
    private Date payTime;
}
