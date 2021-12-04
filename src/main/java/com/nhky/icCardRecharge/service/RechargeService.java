package com.nhky.icCardRecharge.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 17:09
 **/
public interface RechargeService {
    //查看当前正在使用的卡
    public Long usingCard();

    //查看卡内余额
    public Map<String,Object> cardMsg();

    //给卡充值
    public Boolean chrageMoneyForCard();
}
