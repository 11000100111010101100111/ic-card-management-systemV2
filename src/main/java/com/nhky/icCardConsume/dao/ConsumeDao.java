package com.nhky.icCardConsume.dao;

import com.nhky.pojo.GoodsVO;
import com.nhky.pojo.HotGoodsVO;
import com.nhky.pojo.ShoppingHistory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 22:22
 **/
@Repository
public interface ConsumeDao {

    public List<GoodsVO> getGoods(
            @Param("typeName") String typeName,
            @Param("beginPrice") Float beginPrice,
            @Param("endPrice") Float endPrice,
            @Param("key") String key,
            @Param("off") Integer off,
            @Param("end") Integer end,
            @Param("order") String order);
    public List<HotGoodsVO> getHotGoods(@Param("off") Integer off,@Param("end") Integer end);

    public List<Map<String,Object>> getTypeNameList();

    //根据商品id获取商品信息，用于下单页
    public GoodsVO getGoodsById(@Param("gid") Long gid);

    //获取用户卡内余额以及账户余额，以及相关信息
    public Map<String,Object> getBalance(@Param("uid")Long uid);




    //下单
    //（1）验证密码
    public Integer verifyPaymentPassword(@Param("uid")Long uid,@Param("pwd")String pwd);


    // (2)确认订单库存足够时修改商品表现存
    // Param: buyNum-->购买数量
    public Integer modifyGoodsExtent(@Param("buyNum")Integer buyNum,//购买数量
                                        @Param("gid") Long gid,//商品id
                                        @Param("uid") Long uid);//用户id


    //(3)添加商品购买记录
    public Integer addPaymentHistory(ShoppingHistory history);


    //(4))修改IC卡余额
    public Integer updateBalance();

    //添加ic卡余额变更记录
    public Integer addICBalanceHistory();
}
