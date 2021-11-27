package com.nhky.icCardLoss.service.lossCardServiceimpl;

import com.alibaba.fastjson.JSON;
import com.nhky.emun.CommonCode;
import com.nhky.icCardLoss.dao.LossCardDao;
import com.nhky.icCardLoss.service.LossCardService;
import com.nhky.pojo.CardHistory;
import com.nhky.pojo.UserBalanceLogVO;
import com.nhky.pojo.VO.PageVO;
import com.nhky.utils.LogUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.ResultUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/27
 * Time: 10:45
 **/
@Service("lossCardServiceImpl")
public class LossCardServiceImpl implements LossCardService {
    @Resource(name = "lossCardDao")
    LossCardDao lossCardDao;

    /*获取挂失信息：
     *1 、判断账号是否存在卡正在挂失，存在返回提示信息有卡在挂，不存在进行下一步
     * 2、判断账号是否存在卡正在使用，不存在返回无卡可挂，存在进行下一步
     * 3、查询当前正在使用的卡信息和用户信息返回
     * 卡状态： -4失效卡、-3已挂失，-2正在注销中，-1正在挂失中，0申请恢复中，1正常
     */
    @Override
    public String getLossMsg() {

        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));

        List<Map<String,Object>> cardList = lossCardDao.getUsersCards(Long.parseLong(uid));

        List<Map<String,Object>> lossIngCards = getCardList(cardList,"cardStatus","-1");
        if (lossIngCards.size()>0){
            return JSON.toJSONString(ResultUtil.result(CommonCode.ERROR,"已有卡正在办理挂失，暂时无法操作！"));
        }
        List<Map<String,Object>> normalCards = getCardList(cardList,"cardStatus","1");
        if(normalCards.size()<=0){
            return JSON.toJSONString(ResultUtil.result(CommonCode.ERROR,"您没有使用IC卡，无法操作！"));
        }
        return JSON.toJSONString(ResultUtil.succeed(normalCards));
    }

    @Override
    public List<Map<String,Object>> getLossHistory() {
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        List<Map<String,Object>> history = lossCardDao.getLossHistory(Long.parseLong(cardId));
//        String cardItemId = "";
//
//        List<Map<String,Object>> resultList = new ArrayList<>();
//
//        List<Map<String,Object>> subHistory = null;
//
//        for (int index=0;index<history.size();index++) {
//            String cardId = StringUtil.getPamterString(history.get(index).get("cardId"));
//            if (  ! cardItemId.equals(cardId) || index == history.size()-1){
//                if(index ==history.size()-1){
//                    subHistory.add(history.get(index));
//                }
//
//                if(!cardItemId.equals("")) {
//                    Map<String,Object> resultMap = new HashMap<>();
//                    resultMap.put("cardId", cardItemId);
//                    resultMap.put("cardHistory", subHistory);
//                    resultList.add(resultMap);
//                }
//                if(index ==history.size()-1){
//                    break;
//                }
//
//                cardItemId = cardId;
//                subHistory = new ArrayList<Map<String,Object>>();
//            }
//            subHistory.add(history.get(index));
//        }

        return history;
    }

    @Override
    public PageVO<Map<String, Object>> getCardList() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
       Integer items = Integer.parseInt( StringUtil.getPamterString(RequestUtil.getRequestParam("pageItem")) );
       Integer index = Integer.parseInt( StringUtil.getPamterString(RequestUtil.getRequestParam("indexPage")) );

        PageVO<Map<String, Object>> pageVO = new PageVO(items,index);
        try {
            List<Map<String, Object>> list = lossCardDao.getCardList(pageVO.getOff(),pageVO.getEnd(),Long.parseLong(uid));

            for (Map<String, Object> stringObjectMap : list) {
                switch (StringUtil.getPamterString(stringObjectMap.get("cardStatus"))){
                    case "1":
                        stringObjectMap.put("cardStatus","正在使用");break;
                    case "-1":
                        stringObjectMap.put("cardStatus","已挂失");break;
                    default:stringObjectMap.put("cardStatus","已失效");
                }
            }

            pageVO.setList(list);
            pageVO.setTotal(lossCardDao.getCardTotal(Long.parseLong(uid)));

            //计算总页数
            Integer totalPage = 1;
            if(items!=null && items>0) {
                totalPage = pageVO.getTotal() / items + (pageVO.getTotal() % items >0? 1:0);
            }
            pageVO.setTotalPage(totalPage);
            pageVO.setMsg("succeed");
            pageVO.setIndexPage(index);
            pageVO.setPageItem(items);
            LogUtil.info(uid+",分页查询IC卡");
        }catch (Exception e){
            LogUtil.info(uid+",分页查询IC卡失败");
            pageVO.setMsg("error");
        }
        return pageVO;
    }

    @Override
    public List<Map<String, Object>> getLossStep() {
        return null;
    }

    @Override
    @Transactional
    public Integer lossCard() {
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("card_id"));
        String handleType = "挂失";
        String handleResult = "0";
        String mark = StringUtil.getPamterString(RequestUtil.getRequestParam("mark"));
        String cardStatus ="-1";

        Integer aItem = lossCardDao.addLossHistory(new CardHistory(Long.parseLong(cardId),handleType,handleResult,mark));

        Integer mItem = lossCardDao.modifyCardStatus(cardStatus,Long.parseLong(cardId));

        return aItem>0&& mItem>0?1:-1;
    }

    @Override
    public String getEmail() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return lossCardDao.getEmail(Long.parseLong(uid));
    }

    @Override
    public Integer modifyEmail() {
        String email = StringUtil.getPamterString(RequestUtil.getRequestParam("email"));
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return lossCardDao.modifyCardStatus(email,Long.parseLong(uid));
    }


    List<Map<String,Object>> getCardList(List<Map<String,Object>> allCards,String key,String...val){
        List<Map<String,Object>> gets = new ArrayList<Map<String,Object>>();
        for (Map<String, Object> card : allCards) {
            if (StringUtil.equal(StringUtil.getPamterString(card.get(key)),val)){
                gets.add(card);
            }
        }
        return gets;
    }

}
