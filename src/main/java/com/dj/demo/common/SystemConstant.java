package com.dj.demo.common;

public class SystemConstant {

    /**
     * 验证码时间20秒
     */
    public static final Integer TIME_300000 = 300000;

    /**
     * uuid下标0
     */
    public static final Integer UU_ID_0 = 0;

    /**
     * 0
     */
    public static final Integer ZERO = 0;

    /**
     * 1
     */
    public static final Integer ONE = 1;

    /**
     * 4
     */
    public static final Integer FOUR = 4;

    /**
     * uuid_6位结束
     */
    public static final Integer UU_ID_6 = 6;

    /**
     * 分页页数3
     */
    public static final Integer PAGING_THREE = 3;

    /**
     * 激活状态 1激活
     */
    public static final Integer YES_STATUS = 1;
    /**
     * 激活状态 -1未激活
     */
    public static final Integer NO_STATUS = -1;

    /**
     * 删除状态 1未删除
     */
    public static final Integer IS_NOT_DEL = 1;

    /**
     * 删除状态 0已删除
     */
    public static final Integer IS_DEL = 0;

    /**
     * 职位2普通员工
     */
    public static final Integer LEVEL_EMPLOYEE = 2;

    /**
     * 职位3经理
     */
    public static final Integer LEVEL_MANAGER = 3;

    /**
     * 职位4管理员
     */
    public static final Integer LEVEL_ADMINISTRATOR = 4;


    /**
     * 查询pid 为12的收支项目
     */
    public static final Integer PARENTID_PROJECT = 12;

    /**
     * 查询pid 为24的支付方式
     */
    public static final Integer PARENTID_EXPEND = 24;

    /**
     * 处理状态pid为5
     */
    public static final Integer STATE_PROCESS_STATE = 5;

    /**
     * 收支项目pid为12
     */
    public static final Integer STATE_BALANCE_OF_PROJECT = 12;

    /**
     * 处理状态6待审批
     */
    public static final Integer STATE_APPROVE = 6;

    /**
     * 处理状态7待支付、
     */
    public static final Integer STATE_UNPAID = 7;

    /**
     * 处理状态8已支付
     */
    public static final Integer STATE_PAID = 8;


    /**
     * 系统处理异常,请稍后重试
     */
    public static final String ERROR = "系统处理异常,请稍后重试";

    /**
     * 操作成功
     */
    public static final String SUCCESS = "操作成功";

    /**
     * 信息不能为空
     */
    public static final String NOT_NULL = "信息不能为空";

    /**
     * 输入有误
     */
    public static final String INPUT_ERROR  = "输入有误或健康证未尚未通过审核";

    /**
     * 登录成功
     */
    public static final String LOGIN_SUCCESS  = "登录成功";

    /**
     * 已经存在信息
     */
    public static final String CAN_NOT_REPEAT   = "已经存在信息";

    /**
     * 请先注册
     */
    public static final String REGISTER  = "请先注册";

    /**
     * 验证码已过期,请重新获取
     */
    public static final String PAST_DUE  = "验证码已过期,请重新获取";

}
