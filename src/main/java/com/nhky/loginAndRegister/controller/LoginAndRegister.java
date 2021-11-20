package com.nhky.loginAndRegister.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.loginAndRegister.service.LoginAndRegisterService;
import com.nhky.utils.LogUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/10
 * Time: 15:33
 **/
@Controller
@RequestMapping("/go")
public class LoginAndRegister {
    @Resource(name = "loginAndRegisterImpl")
    LoginAndRegisterService loginAndRegisterService;
    //去主页
    @RequestMapping(value = "/home",method = {RequestMethod.POST,RequestMethod.GET})
    public String home(){
        LogUtil.info("--去登录");
        return "main";
    }
    //去登录
    @RequestMapping("/toLogin")
    public String toLogin(){
        LogUtil.info("--去登录");
        return "loginAndRegister/login";
    }


    //去注册
    @RequestMapping( "/toRegister")
    public String toRegister(){
        LogUtil.info("--去注册");
        return "loginAndRegister/register";
    }

    @AjaxConnect()
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Model model){
        LogUtil.info("--登录");
        return loginAndRegisterService.login(model);
    }

    @AjaxConnect(time = 2000)
    @ResponseBody
    @RequestMapping(value = "/register",method = {RequestMethod.POST})
    public String register(){

        //模拟真实网络环境，给用户一种细致的等待体验，满足用户需求
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        LogUtil.info("--注册");
        return loginAndRegisterService.register();
    }

    @ResponseBody
    @RequestMapping("/getCode")
    @AjaxConnect(time = 500)
    public String getCode(HttpSession session){
        Map<String ,Object> data = new HashMap<String,Object>();
        String code = loginAndRegisterService.getCode(6);
        data.put("val",code);
        data.put("msg","succeed");
        session.setAttribute("code",code);
        LogUtil.info("--获取到验证码："+code);
        return JSON.toJSONString(data);
    }
}
