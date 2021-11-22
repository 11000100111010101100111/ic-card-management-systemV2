package com.nhky.icCardCreate.dao;

import com.nhky.pojo.CardOfUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 13:52
 **/
@Repository
public interface CreateCardDao {
    //查询当前登录用户有多少张卡，-3失效卡，-2正在注销中，-1正在挂失中，0申请恢复中，1正常
    List<CardOfUser> getUsersCards(@Param("uid") Long uid);

    //创建卡
    public Integer create(@Param("cardType") String cardType, @Param("uid") Long uid);
}
