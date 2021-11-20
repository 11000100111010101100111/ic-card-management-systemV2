package com.nhky.personalInformation.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.emun.CommonCode;
import com.nhky.personalInformation.dao.FundDao;
import com.nhky.personalInformation.service.FundService;
import com.nhky.pojo.UserBalanceLogVO;
import com.nhky.pojo.VO.PageVO;
import com.nhky.utils.AccessUtil;
import com.nhky.utils.LogUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.ResultUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:57
 **/
@Service("fundServiceImpl")
public class FundServiceImpl implements FundService {
    @Resource(name = "fundDao")
    FundDao fundDao;

    @Override
    public String getBalance(String uid) {
        try {
            String balance = fundDao.getAccountBlance(Long.parseLong(uid));
            LogUtil.info(uid+",获取了账户余额");
            return JSON.toJSONString(ResultUtil.succeed(balance));
        }catch (Exception e){
            LogUtil.error(uid+",获取账户余额失败");
            return JSON.toJSONString(ResultUtil.error(CommonCode.SELECT_ERROR));
        }
    }

    @Override
    @Transactional
    public String getPage(Integer index, Integer items, String uid) {
        PageVO<UserBalanceLogVO> pageVO = new PageVO(items,index);
        try {
//            List<FundVO> list = fundDao.getPageInfo(pageVO.getOff(),pageVO.getEnd(),uid);
//            Collections.sort(list, Comparator.comparing(FundVO::getTime));
//            pageVO.setData(list);
//            pageVO.setTotal(fundDao.selectAllInfoCount(uid));
            List<UserBalanceLogVO> list = fundDao.getBalanceLogs(pageVO.getOff(),pageVO.getEnd(),Long.parseLong(uid));
            pageVO.setList(list);
            pageVO.setTotal(fundDao.getBalanceLogsTotal(Long.parseLong(uid)));

            //计算总页数
            Integer totalPage = 1;
            if(items!=null && items>0) {
                totalPage = pageVO.getTotal() / items + (pageVO.getTotal() % items >0? 1:0);
            }
            pageVO.setTotalPage(totalPage);
            pageVO.setMsg("succeed");
            pageVO.setIndexPage(index);
            pageVO.setPageItem(items);
            LogUtil.info(uid+",分页查询账户余额记录");
        }catch (Exception e){
            LogUtil.info(uid+",分页查询账户余额记录失败");
            pageVO.setMsg("error");
        }
        return JSON.toJSONString(pageVO);
    }



    @Override
    @Transactional
    public String daily(String uid, String money) {
        UserBalanceLogVO userBalanceLogVO = new UserBalanceLogVO(
                Long.parseLong(uid),
                money,
                "签到",
                uid,
                AccessUtil.getRemoteHost(RequestUtil.getRequest()),//"192.168.102.1"
                1,
                "日常签到");
            Integer result = fundDao.addBalanceLog(userBalanceLogVO);
            Integer integer = fundDao.updateUserBalance(uid);

            LogUtil.info(uid+(result>0&&integer>0?",日常签到":",日常签到失败") );
            return JSON.toJSONString(ResultUtil.succeed(result>0&&integer>0?CommonCode.INSERT_SUCCEED:CommonCode.INSERT_ERROR));
//        return JSON.toJSONString(
//                fundDao.addBalance(
//                        Long.parseLong(uid),money)>0?
//                        ResultUtil.succeed("succeed")
//                        :ResultUtil.error(CommonCode.UPDATE_ERROR));
    }

    @Override
    public String add(String uid, Float money) {
        return null;
    }

    @Override
    public String getAccountBlance(Long uid) {
        return null;
    }

    @Override
    public String getCardBlance(Long uid) {
        return null;
    }
}
