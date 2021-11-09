package com.nhky.personalInformation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:43
 * 个人信息管理控制器
 **/
@Controller
@RequestMapping("/personal")
public class PersonalController {
    //进入-我的-页面
    @RequestMapping("/mine")
    public String toMinePage(Model model){
        return "/personalInformation/minePage";
    }

    //返回主页
    @RequestMapping("/exit")
    public String exit(){
        return "redirect:main";
    }
}
