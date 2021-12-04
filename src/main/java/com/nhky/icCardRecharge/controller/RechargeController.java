package com.nhky.icCardRecharge.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.icCardRecharge.service.RechargeService;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 17:07
 * IC卡充值
 **/
@Controller
@RequestMapping("/charge")
public class RechargeController {
    @Resource(name = "rechargeServiceImpl")
    RechargeService rechargeService;

    @RequestMapping("/get")
    @ResponseBody
    public String get(){
        Long getResult = rechargeService.usingCard();
        return JSON.toJSONString(
                getResult>0? ResultUtil.succeed(getResult):(
                        getResult==0?ResultUtil.error("没有IC卡正在使用！"):ResultUtil.error("Ic卡获取失败！")));
    }
    @RequestMapping("/msg")
    @ResponseBody
    public String msg(){
        Map<String,Object> msgResult = rechargeService.cardMsg();
        return JSON.toJSONString(
                null==msgResult? ResultUtil.error("信息获取失败"):ResultUtil.succeed(msgResult));
    }
    @RequestMapping("/recharge")
    @ResponseBody
    public String recharge(){
        Boolean rechargeResult = rechargeService.chrageMoneyForCard();
        return JSON.toJSONString(
                rechargeResult?ResultUtil.succeed("充值成功！"):ResultUtil.error("充值失败！"));
    }
}
