package com.nhky.personalInformation.service;

import com.nhky.pojo.User;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:57
 **/
public interface PersonalInformationService {
    //查询用户信息
    public String findUserById(String uid);

    //修改用户信息
    public String modifyUser(User user);
}
