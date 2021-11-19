package com.nhky.route.home;

import com.alibaba.fastjson.JSON;
import com.nhky.emun.CommonCode;
import com.nhky.pojo.User;
import com.nhky.utils.ResultUtil;
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
 * Date: 2021/11/17
 * Time: 10:36
 **/
@Controller
public class HomeNavigation {
    @Resource(name = "navigationServiceImpl")
    NavigationService navigation;
    @RequestMapping("/navTo")
    public String to(HttpServletRequest request,HttpSession session){
        return navigation.seachPage(request,session);
    }

    @ResponseBody
    @RequestMapping("/getNav")
    public String get(HttpServletRequest request, HttpSession session){
        return JSON.toJSONString(ResultUtil.succeed(navigation.navigationList(request,session)));
    }

    @ResponseBody
    @RequestMapping("/getLoginUser")
    public String getUser(HttpServletRequest request,HttpSession session){
        User user = navigation.getLoginUser(request,session);
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
