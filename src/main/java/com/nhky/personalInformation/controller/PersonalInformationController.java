package com.nhky.personalInformation.controller;

import com.nhky.personalInformation.service.PersonalInformationService;
import com.nhky.personalInformation.service.serviceImpl.PersonalInformationServiceImpl;
import com.nhky.pojo.User;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:46
 * 账户信息控制器
 **/
@Controller
@RequestMapping("/personalInformation")
public class PersonalInformationController {

    @Resource(name = "personalInformationServiceImpl")
    PersonalInformationService personalInformationService;

    //根据用户id获取用户信息
    //return JSON 字符串
    @RequestMapping(value = "/get")
    @ResponseBody
    public String getPersonalInformation(){
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return personalInformationService.findUserById(uid);
    }

    //根据用户id修改信息
    //return JSON 字符串
    @RequestMapping(value = "/update")
    @ResponseBody
    public String updatePersonalInformation(HttpServletRequest request){
//        System.out.println("-----send---a--love----package-------mmd..."+user.toString());
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return personalInformationService.modifyUser(uid);
    }
}
