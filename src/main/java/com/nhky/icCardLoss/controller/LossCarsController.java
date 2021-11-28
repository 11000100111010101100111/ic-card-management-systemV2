package com.nhky.icCardLoss.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.emun.CommonCode;
import com.nhky.icCardLoss.service.LossCardService;
import com.nhky.pojo.VO.PageVO;
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
 * Date: 2021/11/27
 * Time: 10:38
 **/
@Controller
@RequestMapping("/lossCard")
public class LossCarsController {
    @Resource(name = "lossCardServiceImpl")
    LossCardService lossCardService;

    /*获取挂失信息：
     *1 、判断账号是否存在卡正在挂失，存在返回提示信息有卡在挂，不存在进行下一步
     * 2、判断账号是否存在卡正在使用，不存在返回无卡可挂，存在进行下一步
     * 3、查询当前正在使用的卡信息和用户信息返回
     */
    @RequestMapping("/getCards")
    @ResponseBody
    @AjaxConnect
    public String getLossMsg(String cardType){
        return lossCardService.getLossMsg();
    }

    /*
     * 查询用户挂失记录列表
     * 包含正在挂失，已挂失
     *
     * */
    @RequestMapping("/getCardList")
    @ResponseBody
    @AjaxConnect
    public  String getCardList(){
        PageVO<Map<String, Object>> cardList = lossCardService.getCardList();
        return JSON.toJSONString(cardList);
    }

    @RequestMapping("/getHistory")
    @ResponseBody
    @AjaxConnect
    public  String getLossHistory(){
        List<Map<String,Object>> history = lossCardService.getLossHistory();
        return JSON.toJSONString(ResultUtil.succeed(history));
    }

    @RequestMapping("/lossBack")
    @ResponseBody
    @AjaxConnect
    public  String lossBack(){
        return JSON.toJSONString(
                lossCardService.lossBack()>0?
                        ResultUtil.succeed("撤回成功！"):
                        ResultUtil.result(CommonCode.ERROR,"撤回失败！")
        );
    }
    /*
     * 查询当前正在挂失卡的挂失进度
     *
     * */
//    @RequestMapping("/getstep")
//    @ResponseBody
//    public List<Map<String,Object>> getLossStep(){
//
//    }

    /*
     * 确认挂失
     * 提交信息：用户验证通过的邮箱+用户挂失备注+挂失卡id
     * */
    @RequestMapping("/loss")
    @ResponseBody
    @AjaxConnect
    public String lossCard(){
        Integer result = lossCardService.lossCard();
        return JSON.toJSONString(result>0?ResultUtil.succeed("挂失成功"):ResultUtil.result(CommonCode.ERROR,"挂失失败"));
    }

    /*
     * 临界业务：修改邮箱
     *
     * */
    @RequestMapping("/setEmail")
    @ResponseBody
    @AjaxConnect
    public String modifyEmail(){
        Integer result = lossCardService.modifyEmail();
        return JSON.toJSONString(result>0?ResultUtil.succeed("邮箱绑定成功"):ResultUtil.result(CommonCode.ERROR,"邮箱绑定失败"));
    }
    @RequestMapping("/getEmail")
    @ResponseBody
    @AjaxConnect
    public String getEmail(){
        return JSON.toJSONString(ResultUtil.succeed(lossCardService.getEmail()));
    }
}
