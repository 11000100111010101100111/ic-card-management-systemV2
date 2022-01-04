package com.nhky.icCardRecharge.service.serviceImpl;

import com.nhky.icCardRecharge.dao.RechargeDao;
import com.nhky.icCardRecharge.service.RechargeService;
import com.nhky.pojo.CardRechargeVO;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 17:09
 **/
@Service("rechargeServiceImpl")
public class RechargeServiceImpl implements RechargeService {
    @Resource(name = "rechargeDao")
    RechargeDao rechargeDao;

    @Override
    public Long usingCard() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        List<Map<String,Object>> ids = rechargeDao.usingCard(Long.parseLong(uid));
        return ids.size()==1?Long.parseLong(StringUtil.getPamterString(ids.get(0).get("id"))):
                    (ids.size()==0?0l:-1l);
    }

    @Override
    public Map<String, Object> cardMsg() {
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        Map<String, Object> result = rechargeDao.cardMsg(Long.parseLong(cardId));
        result.put("cBalance",String.format("%.2f",Double.parseDouble(StringUtil.getPamterString(result.get("cBalance")))) );
        return result;
    }

    @Override
    @Transactional
    public Boolean chrageMoneyForCard() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        String money = StringUtil.getPamterString(RequestUtil.getRequestParam("money"));
        String mark = StringUtil.getPamterString(RequestUtil.getRequestParam("mark"));

        rechargeDao.chrageMoneyForCard(money, Long.parseLong(cardId));

        CardRechargeVO recharge = new CardRechargeVO(money, mark, Long.parseLong(cardId));
        rechargeDao.addRechargeHistory(recharge);

        Integer flag = rechargeDao.addSubHistory(recharge.getId(), Long.parseLong(uid), Long.parseLong(cardId));

        return flag>0;
    }

    public void succeed(Model model,String money,String cardId){
//        String uid = StringUtil.getPamterString( RequestUtil.getRequestSessionAttr("userId") );
//        String money =  StringUtil.getPamterString(RequestUtil.getRequestParam("money"));
////        money = String.format("%.2f", "".equals(money)?"0":money);
//        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        Map<String, Object> result = rechargeDao.cardMsg(Long.parseLong(cardId));
        result.put("cBalance",String.format("%.2f",Double.parseDouble(StringUtil.getPamterString(result.get("cBalance")))) );
        model.addAttribute("title","充值成功");
        model.addAttribute("detil","亲爱的用户："+ result.get("uName")+
                ",您本次卡号为["+result.get("cId")+"]的IC卡充值："+money+
                "元，当前余额："+result.get("cBalance")+"元。");
        model.addAttribute("icon","/pic/login/success.png");
    }
}
