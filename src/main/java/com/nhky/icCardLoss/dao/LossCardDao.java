package com.nhky.icCardLoss.dao;

import com.nhky.pojo.CardHistory;
import com.sun.corba.se.spi.ior.ObjectKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/27
 * Time: 10:44
 **/
@Repository
public interface LossCardDao {
    //   卡状态： -3失效卡，-2注销，-1已挂失，0恢复，1正常
    List<Map<String,Object>> getUsersCards(@Param("uid") Long uid);

    //获取挂失历史
    List<Map<String,Object>> getLossHistory(@Param("cardId") Long cardId);

    List<Map<String, Object>> getCardList(@Param("start") Integer start,@Param("end") Integer end,@Param("uid")Long uid);
    Integer getCardTotal(@Param("uid")Long uid);

    //挂失卡
    /*
    * 1、添加卡操作记录
    * 2、修改卡状态：-1正在挂失中
    * */
    Integer addLossHistory(CardHistory history);
    Integer modifyCardStatus(@Param("status") String status,@Param("cid") Long cid);

    /*
    * 临界业务：修改邮箱
    *
    * */
    public String getEmail(@Param("uid")Long uid);
    public Integer modifyEmail(@Param("email") String email,@Param("uid")Long uid);
}
