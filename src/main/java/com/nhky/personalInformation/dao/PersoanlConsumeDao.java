package com.nhky.personalInformation.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:56
 **/
@Repository
public interface PersoanlConsumeDao {
    public List<String> getConsumeTypes(@Param("uid") Long uid);
    public List<String> getConsumeDataByConsumeType(@Param("uid") Long uid, @Param("consumeType") String consumeType);
}
