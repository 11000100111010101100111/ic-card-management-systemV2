package com.nhky.icCardLogout.dao;

import com.nhky.pojo.CardHistory;
import com.nhky.pojo.CardOfUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 9:10
 * 注销卡数据访问层
 *
 * 注销流程：根据id查询需要注销卡的信息，包括余额等-->
 *          -->将卡余额加到账户余额中-->添加账户余额变更记录-->
 *          -->修改卡余额为0-->添加ic卡余额支出记录(支出到账户余额)-->
 *          -->修改卡状态为-3
 **/
@Repository
public interface CardLogoutDao {


    /*
    * 根据用户id查找用户所有卡
    * */
    public List<CardOfUser> findMyCards(@Param("uid") Long uid);


    /*
    * 根据卡id查找卡的基本信息
    * */
    public Map<String,Object> findCardById(@Param("cardId")Long cardId);




    /*
    * 因为注销卡为永久不可逆，
    * 所以注销卡前卡内余额需全部转到账户余额，
    * */
    public Integer changeAccountBalance(@Param("cardId")Long cId,@Param("uid") Long uId);
    /*
    * 添加账户余额变更记录
    * */
    public Integer addAccountBalanceHistory(@Param("cardId")Long cId,@Param("uid") Long uId,@Param("host")String host);
    /*
     * 根据卡的id注销这张卡:
     * 修改卡的状态为：-3,修改卡余额为0,修改卡状态为0//注销为永久不可逆
     * */
    public Integer logoutCard(@Param("cardId") Long cardId);
    /*
    * 添加注销卡业务历史
    * */
    public Integer addLogoutHistory(CardHistory logoutHistory);
}
