package com.nhky.loginAndRegister.dao;

import com.nhky.pojo.EasyUser;
import com.nhky.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/23
 * Time: 17:32
 **/
public interface LoginAndRegisterDao {

//    根据id获取登录账号信息
    public EasyUser getLoginUserById(String id);

//    判断当账号是否存在登录信息
    public int hasID(@Param("easy_id") String easyId);
//    注册普通用户信息到登录信息表
    public int registerLoginUser(EasyUser easyUser);

    //根据手机号后身份证号查询用户是否注册
    public int hasUser(@Param("phone") String phone,@Param("identify_card") String identifyCard);

    //注册用户信息
    public int registerUser(User user);
}
