package com.nhky.icCardLogout.service.cardLogoutServiceImpl;

import com.nhky.icCardLogout.dao.CardLogoutDao;
import com.nhky.icCardLogout.service.CardLogoutService;
import com.nhky.pojo.CardHistory;
import com.nhky.pojo.CardOfUser;
import com.nhky.utils.AccessUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 9:12
 * 注销卡业务实现层
 **/
@Service("cardLogoutServiceImpl")
public class CardLogoutServiceImpl implements CardLogoutService {
    @Resource(name = "cardLogoutDao")
    CardLogoutDao cardLogoutDao;

    @Resource(name = "transactionTemplate")
    TransactionTemplate transactionTemplate;

    @Override
    public List<CardOfUser> getCards() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return cardLogoutDao.findMyCards(Long.parseLong(uid));
    }

    @Override
    public Map<String, Object> findCardMsg() {
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        Map<String,Object> card =  cardLogoutDao.findCardById(Long.parseLong(cardId));
        if (StringUtil.isNotBank(card.get("cStatus"))){
            String cardStatus =  StringUtil.getPamterString(card.get("cStatus"));
//            -4失效卡、-3已挂失，-2正在注销中，-1正在挂失中，0申请恢复中，1正常
            switch (cardStatus){
                case "0":
                    cardStatus="申请恢复中";break;
                case  "1":
                    cardStatus="正在使用";break;
                case "-1":
                case  "-2":
                    cardStatus="已挂失";break;
                case "-3":
                case "-4":
                    cardStatus="已失效";break;
                default:cardStatus="未知状态";
            }
            card.put("cStatus",cardStatus);
        }
        return card;
    }


    /*
    * 使用编程式事务处理多次sql执行，防止长事务造成数据库连接出现死锁
    * */
    @Override
    public Boolean logoutCard() {
        Boolean executeResult = transactionTemplate.execute(transactionStatus->{
            String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
            String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));

            //注销卡前卡内余额需全部转到账户余额
            Integer changeAccountBalanceFlag = cardLogoutDao.changeAccountBalance(Long.parseLong(cardId),Long.parseLong(uid));

            //添加账户余额变更记录
            String host = StringUtil.getPamterString(AccessUtil.getRemoteHost(RequestUtil.getRequest()));
            Integer addAccountHistoryFlag = cardLogoutDao.addAccountBalanceHistory(Long.parseLong(cardId),Long.parseLong(uid),host);

            //修改卡的状态为：-3,修改卡余额为0,修改卡状态为0//注销为永久不可逆
            Integer logoutCardFlag = cardLogoutDao.logoutCard(Long.parseLong(cardId));

            //添加注销卡业务历史
            CardHistory logoutHistory = new CardHistory();
            //(#{card_id},'IC卡注销',NOW(),'注销成功','注销',1)
            logoutHistory.setCard_id(Long.parseLong(cardId));
            logoutHistory.setMark("注销");
            logoutHistory.setHandle_result("注销成功");
            logoutHistory.setHandle_type("IC卡注销");
            Integer addLogoutHistoryFlag = cardLogoutDao.addLogoutHistory(logoutHistory);

            boolean result = changeAccountBalanceFlag>0 &&
                    addAccountHistoryFlag>0 &&
                    logoutCardFlag>0 &&
                    addLogoutHistoryFlag>0;

            if(!result) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); //事务回滚
            }
            return result;
        });
        return executeResult;
    }
}
