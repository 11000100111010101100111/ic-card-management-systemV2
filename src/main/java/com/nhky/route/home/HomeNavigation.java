package com.nhky.route.home;

import com.alibaba.fastjson.JSON;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/17
 * Time: 10:36
 **/
@Controller
public class HomeNavigation {
    @Resource(name = "navigationServiceImpl")
    NavigationService navigation;
    @RequestMapping("/navTo")
    public String to(HttpServletRequest request){
        return navigation.seachPage(request);
    }

    @ResponseBody
    @RequestMapping("/getNav")
    public String get(HttpServletRequest request, HttpSession session){
        return JSON.toJSONString(ResultUtil.succeed(navigation.navigationList(request,session)));
    }
}
