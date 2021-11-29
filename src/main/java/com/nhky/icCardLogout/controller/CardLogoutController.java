package com.nhky.icCardLogout.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.emun.CommonCode;
import com.nhky.icCardLogout.service.CardLogoutService;
import com.nhky.pojo.CardOfUser;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 9:09
 **/
@Controller
@RequestMapping("/cardLg")
public class CardLogoutController {
    @Resource(name = "cardLogoutServiceImpl")
    CardLogoutService logoutService;


    @ResponseBody
    @RequestMapping("/get")
    @AjaxConnect
    public String getCards(){
        try {
            List<CardOfUser> cards = logoutService.getCards();
            return JSON.toJSONString(ResultUtil.succeed(cards));
        }catch (Exception e){
            return JSON.toJSONString(ResultUtil.error(CommonCode.ERROR));
        }
    }


    @ResponseBody
    @RequestMapping("/getMsg")
    @AjaxConnect
    public String getCardMsgByCardId(){
        try {
            Map<String, Object> card = logoutService.findCardMsg();
            return JSON.toJSONString(ResultUtil.succeed(card));
        }catch (Exception e){
            return JSON.toJSONString(ResultUtil.error(CommonCode.ERROR));
        }
    }


    @ResponseBody
    @RequestMapping("/logout")
    @AjaxConnect
    public String logout(){
        Boolean logoutFlag = logoutService.logoutCard();
        return JSON.toJSONString(
                logoutFlag?
                        ResultUtil.succeed("挂失成功！"):
                        ResultUtil.error(CommonCode.ERROR)
        );

    }
}
