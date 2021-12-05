package com.nhky.icCardConsume.controller;

import com.nhky.icCardConsume.service.ConsumeService;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 22:23
 **/
@Controller
@RequestMapping("/consume")
public class ConsumeController {
    @Resource(name = "consumeServiceImpl")
    ConsumeService consumeService;


    @RequestMapping("/toFind")
//    @ResponseBody
    public String toSerachGoods(Model model){
        String key = StringUtil.getPamterString(RequestUtil.getRequestParam("key"));
        model.addAttribute("key",key);
        return "/icCardConsume/mainPageOfConsume";
    }
    @RequestMapping("/toOrder")
//    @ResponseBody
    public String toGetOrder(){
        return "/icCardConsume/getOder";
    }
}
