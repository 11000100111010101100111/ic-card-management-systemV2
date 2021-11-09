package com.nhky.personalInformation.controller;

import com.nhky.personalInformation.service.FundService;
import com.nhky.personalInformation.service.serviceImpl.FundServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:46
 * 账户余额控制器
 **/
@Controller
@RequestMapping("/balance")
public class PersonalFundController {
    @Resource(name = "fundServiceImpl")
    FundService fundService;

    //根据UID获取此人对应账户余额
    @RequestMapping("/getBalance")
    @ResponseBody
    public String getBalance(@RequestParam("uid") String uid){

        return "";
    }

    //分页查询余额明细列表
    //index:第几页
    //items:每页多少条
    @RequestMapping("page")
    @ResponseBody
    public String getPage(
            @RequestParam("index") Integer index,
            @RequestParam("items") Integer items,
            @RequestParam("uid"  ) String  uid){
        String val = fundService.getPage(index,items,uid);
        return val;
    }

    //每日签到
    @RequestMapping("page")
    @ResponseBody
    public String daily(@RequestParam("uid") String uid){

        return "";
    }

    //充值
    //uid : 充值人id
    //money : 充值金额
    //return : 充值时间、充值人名称、充值金额、充值类型、充值卡id
    @RequestMapping("add")
    @ResponseBody
    public String add(@RequestParam("uid") String uid,@RequestParam("money") Float money){

        return "";
    }
}
