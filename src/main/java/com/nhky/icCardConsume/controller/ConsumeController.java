package com.nhky.icCardConsume.controller;

import com.nhky.annotation.AjaxConnect;
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
    @AjaxConnect(time = 2000)
    public String toSerachGoods(Model model){
        String key = StringUtil.getPamterString(RequestUtil.getRequestParam("key"));
        model.addAttribute("key",key);
        return "/icCardConsume/mainPageOfConsume";
    }
    @RequestMapping("/toOrder")
    @AjaxConnect
//    @ResponseBody
    public String toGetOrder(){
        return "/icCardConsume/getOder";
    }

    @RequestMapping("/getGoods")
    @ResponseBody
    @AjaxConnect(time = 100)
    public String getGoods(){
        return consumeService.findGoods();
    }

    @RequestMapping("/hot")
    @ResponseBody
    @AjaxConnect(time = 200)
    public String hot(){
        return consumeService.hotGoods();
    }

    @RequestMapping("/types")
    @ResponseBody
    public String getTypes(){
        return consumeService.getTypeNameList();
    }


    //根据商品id获取商品信息
    @RequestMapping("/get")
    @ResponseBody
    public String getGoodsById(){
        return consumeService.getGoodsById();
    }

    //获取用户卡内余额以及账户余额，以及相关信息
    @RequestMapping("/getBalance")
    @ResponseBody
    public String getCardBalance(){
        return consumeService.getBalance();
    }

    //用户下单：
    //   【】验证密码->确认订单->下单->修改商品表库存->添加商品购买记录->修改IC卡余额->下单成功
    @RequestMapping("/order")
    @ResponseBody
    public String order(){
        return consumeService.order();
    }
}
