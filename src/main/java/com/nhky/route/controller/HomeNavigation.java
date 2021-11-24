package com.nhky.route.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.annotation.NeedSecurity;
import com.nhky.emun.CommonCode;
import com.nhky.emun.Security;
import com.nhky.pojo.User;
import com.nhky.route.home.NavigationService;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    @NeedSecurity(security = Security.NOMAL)
    @AjaxConnect()
    @RequestMapping("/navTo")
    public String to(){
        return navigation.seachPage();
    }

    @ResponseBody
    @RequestMapping("/getNav")
    public String get(){
        return JSON.toJSONString(ResultUtil.succeed(navigation.navigationList()));
    }

    @ResponseBody
    @RequestMapping("/getLoginUser")
    public String getUser(){
        User user = navigation.getLoginUser();
        return JSON.toJSONString(
                null==user.getId()||user.getId()<=0?
                        ResultUtil.result(CommonCode.NO_LOGIN,user)
                        :ResultUtil.succeed(user)
        );
    }
    @ResponseBody
    @RequestMapping("/getAuthors")
    public String getAuthors(){
        List<User> authors = navigation.getAuthors();
        return JSON.toJSONString(ResultUtil.succeed(authors));
    }
}
