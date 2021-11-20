package com.nhky.icCardCreate.service;

import com.nhky.pojo.CardOfUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 13:53
 **/
public interface CreateCardService {

    //查看名下全部卡
    String getUsersCards(String cardType);

    //创建卡
    String create(String cardType);
}
