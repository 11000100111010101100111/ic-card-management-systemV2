package com.nhky.utils;

import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 14:13
 **/
public class UserVO {
    private static Long uid;
    UserVO(){

    }
    public static void setUID(Long UID){
        UserVO.uid = UID;
    }
    public static Long getUID(HttpServletRequest servletRequest){

        return UserVO.uid;
    }

}
