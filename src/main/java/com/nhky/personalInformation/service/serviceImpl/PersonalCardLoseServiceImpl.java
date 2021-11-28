package com.nhky.personalInformation.service.serviceImpl;

import com.nhky.personalInformation.dao.PersonalCardLoseDao;
import com.nhky.personalInformation.service.PersonalCardLoseService;
import com.nhky.pojo.VO.PageVO;
import com.nhky.utils.LogUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:55
 **/
@Service("personalCardLoseServiceImpl")
public class PersonalCardLoseServiceImpl implements PersonalCardLoseService {
    @Resource(name = "personalCardLoseDao")
    PersonalCardLoseDao personalCardLoseDao;


    @Override
    public List<Map<String, Object>> getCards() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        return personalCardLoseDao.getCards(Long.parseLong(uid));
    }

    @Override
    public PageVO<Map<String, Object>> getLossMsgOfCard() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        String cardId = StringUtil.getPamterString(RequestUtil.getRequestParam("cardId"));
        Integer items = Integer.parseInt( StringUtil.getPamterString(RequestUtil.getRequestParam("pageItem")) );
        Integer index = Integer.parseInt( StringUtil.getPamterString(RequestUtil.getRequestParam("indexPage")) );

        PageVO<Map<String, Object>> pageVO = new PageVO(items,index);
        try {
            List<Map<String, Object>> list = personalCardLoseDao.getLossMsgOfCard(Long.parseLong(cardId),pageVO.getOff(),pageVO.getEnd());
            pageVO.setList(list);
            pageVO.setTotal(personalCardLoseDao.getCardTotal(Long.parseLong(cardId)));

            //计算总页数
            Integer totalPage = 1;
            if(items!=null && items>0) {
                totalPage = pageVO.getTotal() / items + (pageVO.getTotal() % items >0? 1:0);
            }
            pageVO.setTotalPage(totalPage);
            pageVO.setMsg("succeed");
            pageVO.setIndexPage(index);
            pageVO.setPageItem(items);
            LogUtil.info(uid+",分页查询IC卡挂失记录");
        }catch (Exception e){
            LogUtil.info(uid+",分页查询IC卡挂失记录失败");
            pageVO.setMsg("error");
        }
        return pageVO;
    }
}
