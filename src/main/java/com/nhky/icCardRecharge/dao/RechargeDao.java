package com.nhky.icCardRecharge.dao;

import com.nhky.pojo.CardRechargeVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 17:08
 **/
@Repository
public interface RechargeDao {
    //查看当前正在使用的卡
    public List<Map<String,Object>> usingCard(@Param("uid")Long uid);

    //查看卡内余额
    public Map<String,Object> cardMsg(@Param("cid")Long cid);


    //给卡充值
    public Integer chrageMoneyForCard(@Param("money") String money,@Param("cid")Long cid);
    //添加充值记录信息
    public Integer addRechargeHistory(CardRechargeVO rechargeVO);
    //添加充值记录子表信息(充值记录id、用户id、ic卡id)
    public Integer addSubHistory(@Param("rid")Long rid,@Param("uid")Long uid,@Param("cid")Long cid);
}
