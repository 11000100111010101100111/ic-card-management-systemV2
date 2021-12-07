package com.nhky.icCardConsume.service;

import com.nhky.pojo.GoodsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 22:22
 **/
public interface ConsumeService {

    //查找商品
    public String findGoods();

    //获取热卖商品
    public String hotGoods();

    //获取商品类型
    public String getTypeNameList();

    //根据商品id获取商品信息，用于下单页
    public String getGoodsById();

    //获取用户卡内余额以及账户余额，以及相关信息
    String getBalance();

    //用户下单：
    //   【】验证密码->确认订单->下单->修改商品表库存->添加商品购买记录->修改IC卡余额->下单成功
    String order();
}
