package com.nhky.icCardRecharge.service.serviceImpl;

import com.nhky.icCardRecharge.dao.RechargeDao;
import com.nhky.icCardRecharge.service.RechargeService;
import com.nhky.pojo.CardRechargeVO;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
