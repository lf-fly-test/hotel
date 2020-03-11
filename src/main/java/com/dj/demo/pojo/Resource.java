package com.dj.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("hotel_resource")
public class Resource {

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 资源名称
     */
    private String resourceName;

    /**
     * 资源路径
     */
    private String url;

    /**
     * 父级id
     */
    private Integer pId;

    /**
     * 1为菜单
     */
    private Integer resourceType;

    /**
     * 展示:1展示 -1伪删除
     */
    private Integer isDel;

}
