package com.nhky.icCardConsume.dao;

import com.nhky.pojo.GoodsVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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
            @Param("endPrice") Float beginPrice,
            @Param("beginPrice") Float endPrice,
            @Param("key") String key,
            @Param("off") Integer off,
            @Param("end") Integer end,
            @Param("order") String order);
}
