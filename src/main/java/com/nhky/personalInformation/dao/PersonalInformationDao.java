package com.nhky.personalInformation.dao;

import com.nhky.pojo.User;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:57
 **/
//用户信息dao
@Repository
public interface PersonalInformationDao {

    //查询用户信息
    public User findUserById(Long uid);

    //修改用户信息
    public Integer modifyUser(User user);
}
