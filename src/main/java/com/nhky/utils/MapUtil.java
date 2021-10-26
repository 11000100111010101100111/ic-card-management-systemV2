package com.nhky.utils;

import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/24
 * Time: 21:08
 **/
public class MapUtil {
    public static String getValue(Map<String,Object> map,String key){
        if(null!= map.get(key)){
            return map.get(key).toString().trim();
        }
        return "";
    }
}
