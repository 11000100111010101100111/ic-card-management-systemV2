package com.nhky.personalInformation.dao;

import com.nhky.personalInformation.pojo.FundVO;
import com.nhky.pojo.UserBalanceLogVO;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:57
 **/
@Repository("fundDao")
public interface FundDao {

//    <!--添加账号充值记录，充值成功后修改余额-->
    public Integer addBalanceLog(UserBalanceLogVO userBalanceLogVO);
    public Integer updateUserBalance(@Param("userId") String userId);


    //获取当前用户的账户余额记录
    public List<UserBalanceLogVO> getBalanceLogs(@Param("off") Integer off, @Param("end") Integer end, @Param("uid") Long uid);
    public Integer getBalanceLogsTotal(@Param("uid") Long uid);

    //分页查询余额明细列表
    //index:第几页
    //items:每页多少条
    public List<FundVO> getPageInfo(@Param("start") Integer start, @Param("end") Integer end, @Param("uid") String uid);
    public Integer selectAllInfoCount(@Param("uid") String uid);
    //签到、充值
    public Integer addBalance(@Param("uid") Long uid, @Param("money") String money);
    //获取余额 =账户余额+卡余额
    public String getBalance(@Param("uid") Long uid);
    //获取账户余额
    public String getAccountBlance(@Param("uid") Long uid);
    //获取卡余额
    public String getCardBlance(@Param("uid") Long uid);
}
