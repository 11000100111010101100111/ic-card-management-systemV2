package com.nhky.personalInformation.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:55
 **/
@Repository
public interface PersonalCardLoseDao {
    //获取挂失卡列表：卡id+用户姓名+卡图表+卡余额
    public List<Map<String,Object>> getCards(@Param("uid") Long uid);

    //根据卡id获取挂失总记录条数
    public Integer getCardTotal(@Param("cardId") Long cardId);

    //根据卡id查看挂失历史信息
    public List<Map<String,Object>> getLossMsgOfCard(@Param("cardId") Long cardId ,@Param("off") Integer off,@Param("end") Integer end);
}
