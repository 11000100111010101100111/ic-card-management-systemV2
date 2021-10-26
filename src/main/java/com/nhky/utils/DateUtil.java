package com.nhky.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/4
 * Time: 10:20
 * 时间操作
 **/
public class DateUtil {
    public static String nowDateTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日 HH时MM分ss秒");
        return sdf.format(new Date());
    }
}
