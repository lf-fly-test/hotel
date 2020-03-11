package com.dj.demo.web;

import com.dj.demo.common.ResultModel;
import com.dj.demo.common.SystemConstant;
import com.dj.demo.pojo.Resource;
import com.dj.demo.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/resource/")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    /**
     * 左侧菜单展示
     * @param session
     * @return
     */
    @RequestMapping("list")
    public ResultModel<Object> list(HttpSession session) {
        try {
            List<Resource> list = resourceService.list();
            return new ResultModel<>().success(list);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }
}
