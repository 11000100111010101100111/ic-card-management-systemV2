package com.nhky.personalInformation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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


    //根据用户id获取用户信息
    //return JSON 字符串
    @RequestMapping("/get")
    @ResponseBody
    public String getPersonalInformation(@RequestParam("uid") String uid){
        return "";
    }

    //根据用户id修改信息
    //return JSON 字符串
    @RequestMapping("/update")
    @ResponseBody
    public String updatePersonalInformation(@RequestParam("uid") String uid){
        return "";
    }
}
