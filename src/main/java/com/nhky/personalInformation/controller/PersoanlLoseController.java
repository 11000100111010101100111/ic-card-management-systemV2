package com.nhky.personalInformation.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.personalInformation.service.PersonalCardLoseService;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:48
 * 账户卡挂失信息控制器
 **/
@Controller
@RequestMapping("/personalLoss")
public class PersoanlLoseController {
    @Resource(name = "personalCardLoseServiceImpl")
    PersonalCardLoseService personalCardLoseService;

    @RequestMapping("/getLoss")
    @ResponseBody
    @AjaxConnect
    public String getLossCard(){
        return JSON.toJSONString(ResultUtil.succeed(personalCardLoseService.getCards()));
    }

    @RequestMapping("/getLossPage")
    @ResponseBody
    @AjaxConnect
    public String getLossCardHistory(){
        return JSON.toJSONString(personalCardLoseService.getLossMsgOfCard());
    }
}
