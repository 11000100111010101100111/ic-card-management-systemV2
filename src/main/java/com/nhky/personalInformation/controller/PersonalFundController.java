package com.nhky.personalInformation.controller;

import com.nhky.annotation.AjaxConnect;
import com.nhky.personalInformation.service.FundService;
import com.nhky.personalInformation.service.serviceImpl.FundServiceImpl;
import com.nhky.pojo.VO.ICommonCode;
import com.nhky.utils.ResultUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @RequestMapping("/go")
    public String go(){
        return "/personalInformation/minePage";
    }


    //根据UID获取此人对应账户余额
    @RequestMapping("/getBalance")
    @ResponseBody
    public String getBalance(HttpSession session){
        String uid = StringUtil.getPamterString(session.getAttribute("userId"));
        return fundService.getBalance(uid);
    }

    //分页查询余额明细列表
    //index:第几页
    //items:每页多少条
    @RequestMapping("/page")
    @ResponseBody
    @AjaxConnect(time = 2000)
    public String getPage(
            @RequestParam("pageItem")Integer pageitems,
            @RequestParam("indexPage")Integer indexPage,
            HttpServletRequest request){
        String uid= StringUtil.getPamterString(request.getSession().getAttribute("userId"));

        if (!StringUtil.isLong(uid)){
           return null;
        }
        String val = fundService.getPage(indexPage,pageitems,uid);
        return val;
    }

    //每日签到
    @RequestMapping("/daily")
    @ResponseBody
    public String daily(HttpSession session, HttpServletRequest request){
        String uid = StringUtil.getPamterString(session.getAttribute("userId"));

        //操作异常阻塞一段时间，避免过度签到导致数据异常
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return fundService.daily(uid,"0.01",request);
    }

    //充值
    //uid : 充值人id
    //money : 充值金额
    //return : 充值时间、充值人名称、充值金额、充值类型、充值卡id
    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestParam("uid") String uid,@RequestParam("money") Float money){

        return "";
    }
}
