package com.nhky.icCardCreate.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.icCardCreate.dao.CreateCardDao;
import com.nhky.icCardCreate.service.CreateCardService;
import com.nhky.pojo.CardOfUser;
import com.nhky.utils.UserVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 13:53
 **/
@Service("createCardServiceImpl")
public class CreateCardServiceImpl implements CreateCardService {

    @Resource(name = "createCardDao")
    CreateCardDao createCard;

    @Override
    public String getUsersCards() {

        Map<String,Object> result = new HashMap<>();

        Long uid = UserVO.getUID();
        if(null==uid){
            //session失效了
            result.put("single","404");
            return JSON.toJSONString(result);
        }


        try {
            List<CardOfUser> cardList = createCard.getUsersCards(uid);

            int guashi = 0;
            int zuxiao = 0;
            int zhengchang = 0;
            for (CardOfUser cardOfUser : cardList) {

                //   卡状态： -3失效卡，-2正在注销中，-1正在挂失中，0申请恢复中，1正常
                switch (cardOfUser.getStatus()){
                    case 1: zhengchang++;break;
                    case -1: guashi++;break;
                    case -2: zuxiao++;break;
                }
            }
            StringBuffer msg = new StringBuffer();

            msg.append(guashi>0||zuxiao>0||zhengchang>0?"用户您好！经检测，您名下有Ic卡":"200");
            if(guashi>0){
                result.put("挂失卡",guashi);
                msg.append("<font style='color:;font-size='14px';font-weiht:400;'>"+guashi+"</font>正处于挂失状态。");
            }
            if(zuxiao>0){
                result.put("注销卡",zuxiao);
                msg.append("<font style='color:;font-size='14px';font-weiht:400;'>"+zuxiao+"</font>正处于注销状态。");
            }
            if(zhengchang>0){
                result.put("正常卡",zhengchang);
                msg.append("<font style='color:;font-size='14px';font-weiht:400;'>"+zhengchang+"</font>正处于使用状态。");
            }
            msg.append(guashi>0||zuxiao>0||zhengchang>0?"<font style='color:var(--sub__color);font-weight:600;'>暂时不能申请</font>":"");

            result.put("single",msg);
        }catch (Exception e){
            //数据库访问异常
            result.put("single","数据库访问异常");
            return JSON.toJSONString(result);
        }

//        result.put("single","succeed");
        return "cardList";
    }
}
