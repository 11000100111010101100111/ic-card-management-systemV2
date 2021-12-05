package com.nhky.utils;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/17
 * Time: 8:23
 **/
public class StringUtil {

    final static String FLOAT_REGEX = "(^[1-9]\\d*\\.\\d+$|^0\\.\\d+$|^[1-9]\\d*$|^0$)";
    final static String LONG_REGEX = "[0-9]*";
    final static String NULL_STR = "";

    //判断字符串是否为空，或空串
    public static boolean isBank(Object val){
        if(null != val){
            if(NULL_STR.equals(val.toString())) return true;
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
            return NULL_STR;
        }
        return val.toString().trim();
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

    public static boolean isLong(Object str){
//        2147483648～2147483647
//        if ((Pattern.compile("[0-9]*")).matcher(getPamterString(str)).matches()){
//            return
//        }
//        return false;
        return matcher(LONG_REGEX,getPamterString(str));
    }

    public static boolean isFloat(Object str){
        return matcher(FLOAT_REGEX,getPamterString(str));
    }
    //正则表达式验证字符串
    public static boolean matcher(String reg,String obj){
        if(NULL_STR.equals(getPamterString(obj))){
            return false;
        }
        return Pattern.compile(reg).matcher(obj).matches();
    }

    public static boolean equal(String key,String ...val){
        for (String s : val) {
            if (key.equals(s)) return true;
        }
        return false;
    }
}
