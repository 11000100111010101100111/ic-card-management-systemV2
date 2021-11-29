package com.nhky.icCardLogout.service;

import com.nhky.pojo.CardOfUser;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 9:11
 * 注销卡业务接口层
 **/
public interface CardLogoutService {
    public List<CardOfUser> getCards();
    public Map<String,Object> findCardMsg();
    public Boolean logoutCard();
}
