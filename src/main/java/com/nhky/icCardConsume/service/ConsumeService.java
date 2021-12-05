package com.nhky.icCardConsume.service;

import com.nhky.pojo.GoodsVO;

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
}
