package com.nhky.loginAndRegister.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.loginAndRegister.service.LoginAndRegisterService;
import com.nhky.utils.LogUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    //去登录
    @RequestMapping("/toLogin")
    public String toLogin(){
        LogUtil.logInfo("去登录");
        return "loginAndRegister/login";
    }


    //去注册
    @RequestMapping( "/toRegister")
    public String toRegister(){
        LogUtil.logInfo("去注册");
        return "loginAndRegister/register";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model,HttpSession session){
        return loginAndRegisterService.login(request,model,session);
    }
//    phone:phone,
//    identify:identify,
//    name:name,
//    sex:sex,
//    birthday:data,
//    email:email,
//    single:single,
//    headImg:headImg,
//    pwd:pwd
//    @ResponseBody
//    @RequestMapping("/register")
//    public String register(
//            @RequestParam("phone") String phone,
//            @RequestParam("identify") String identify,
//            @RequestParam("name") String name,
//            @RequestParam("sex") String sex,
//            @RequestParam("birthday") String birthday,
//            @RequestParam("email") String email,
//            @RequestParam("single") String single,
//            @RequestParam("headImg") String headImg,
//            @RequestParam("pwd") String pwd){
//
////        Map<String,Object> date = (HashMap<String,Object>)msg;
//
//
////        String val = loginAndRegisterService.register(request,model);
//        String msga = "succeed";
////        date.put("msg",msga);
//        return JSON.toJSONString("");
//    }
    @ResponseBody
    @RequestMapping(value = "/register",method = {RequestMethod.POST,RequestMethod.PUT})
    public String register(HttpServletRequest request, Model model){

//        Map<String,Object> date = (HashMap<String,Object>)msg;

        String val = loginAndRegisterService.register(request);
//        String msga = "succeed";
//        date.put("msg",msga);
        return val;
    }

    @ResponseBody
    @RequestMapping("/getCode")
    public String getCode(HttpSession session){
        Map<String ,Object> data = new HashMap<String,Object>();
        String code = loginAndRegisterService.getCode(6);
        data.put("val",code);
        data.put("msg","succeed");
        session.setAttribute("code",code);
        return JSON.toJSONString(data);
    }
}
