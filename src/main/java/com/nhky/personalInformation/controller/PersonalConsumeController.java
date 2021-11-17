package com.nhky.personalInformation.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.personalInformation.service.PersoanlConsumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:48
 * 账户消费控制器
 **/
@Controller
@RequestMapping("/personalConsume")
public class PersonalConsumeController {
    @Resource(name = "persoanlConsumeServiceImpl")
    PersoanlConsumeService consumeService;
    @ResponseBody
    @RequestMapping("/getChartData")
    public String getChartData(HttpServletRequest request, HttpSession session){
        List<List<Object>> val = consumeService.getChartData(request,session);
        return JSON.toJSONString(val);
    }
}
