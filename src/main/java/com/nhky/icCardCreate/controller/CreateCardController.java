package com.nhky.icCardCreate.controller;

import com.nhky.icCardCreate.service.CreateCardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

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
    public String hasCard(){
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return createCardService.getUsersCards();
    }
}
