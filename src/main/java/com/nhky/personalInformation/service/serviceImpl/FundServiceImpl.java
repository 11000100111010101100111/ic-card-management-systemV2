package com.nhky.personalInformation.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.personalInformation.dao.FundDao;
import com.nhky.personalInformation.pojo.FundVO;
import com.nhky.personalInformation.service.FundService;
import com.nhky.pojo.VO.PageVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
        return null;
    }

    @Override
    public String getPage(Integer index, Integer items, String uid) {
        PageVO<FundVO> pageVO = new PageVO(items,index);
        pageVO.setData(fundDao.getPageInfo(pageVO.getOff(),pageVO.getEnd(),Long.parseLong(uid)));
        return JSON.toJSONString(pageVO);
    }

    @Override
    public String daily(String uid) {
        return null;
    }

    @Override
    public String add(String uid, Float money) {
        return null;
    }
}
