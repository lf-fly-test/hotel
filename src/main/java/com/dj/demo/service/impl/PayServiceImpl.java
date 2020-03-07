package com.dj.demo.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.demo.mapper.PayMapper;
import com.dj.demo.pojo.Pay;
import com.dj.demo.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @ClassName PayServiceImpl
 * @Description: TODO
 * @Date 2020/3/6 13:11
 **/
@Service
@Transactional(rollbackFor = Exception.class)
public class PayServiceImpl extends ServiceImpl<PayMapper, Pay> implements PayService {

    @Autowired
    private PayMapper payMapper;

}
