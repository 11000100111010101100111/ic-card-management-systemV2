package com.nhky.icCardCreate.controller;

import com.nhky.annotation.AjaxConnect;
import com.nhky.annotation.NeedSecurity;
import com.nhky.emun.Security;
import com.nhky.icCardCreate.service.CreateCardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/30
 * Time: 18:47
 **/
@Controller
@RequestMapping("/createCard")
public class CreateCardController {

    @Resource(name = "createCardServiceImpl")
    CreateCardService createCardService;

    @RequestMapping("/toCreateCard")
    public String toCreateCard(){
        return "/icCardCreate/createCard";
    }

    @ResponseBody
    @RequestMapping("/hasCard")
    @NeedSecurity(security = Security.ADMIN)
    @AjaxConnect(time = 2000)
    public String hasCard(@RequestParam("cardType")String cardType, HttpSession session){
        return createCardService.getUsersCards(cardType);
    }

    @ResponseBody
    @RequestMapping("/create")
    @NeedSecurity(security = Security.ADMIN)
    @AjaxConnect(time = 2000)
    public String create(@RequestParam("cardType")String cardType, HttpSession session){
        return createCardService.create(cardType);
    }
}
