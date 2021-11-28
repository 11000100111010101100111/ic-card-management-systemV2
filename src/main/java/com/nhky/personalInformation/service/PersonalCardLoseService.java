package com.nhky.personalInformation.service;

import com.nhky.pojo.VO.PageVO;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:55
 **/
public interface PersonalCardLoseService {
    public List<Map<String,Object>> getCards();
    public PageVO<Map<String,Object>> getLossMsgOfCard();
}
