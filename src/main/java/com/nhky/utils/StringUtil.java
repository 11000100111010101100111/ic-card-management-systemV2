package com.nhky.utils;

import java.io.UnsupportedEncodingException;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/17
 * Time: 8:23
 **/
public class StringUtil {

    //判断字符串是否为空，或空串
    public static boolean isBank(Object val){
        if(null != val){
            if(val.toString().equals("")) return true;
            return false;
        }
        return true;
    }

    //判断字符串是否不为空，或不为空串
    public static boolean isNotBank(Object val){
        return !isBank(val);
    }

    public static String getPamterString(Object val){
        if(isBank(val)){
            return "";
        }
        return val.toString();
    }

    //字符串转码
    public static String convertEncodingFormat(String str, String formatFrom, String FormatTo) {
        String result = null;
        if (!(str == null || str.length() == 0)) {
            try {
                result = new String(str.getBytes(formatFrom), FormatTo);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
