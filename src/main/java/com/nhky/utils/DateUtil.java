package com.nhky.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/4
 * Time: 10:20
 * 时间操作
 **/
public class DateUtil {
    static final SimpleDateFormat DATA_FORMAT = new SimpleDateFormat("yyyy年mm月dd日 HH时MM分ss秒");
    static final SimpleDateFormat DATA_FORMAT_ = new SimpleDateFormat("yyyy-mm-dd HH:MM:ss");

    public static String nowDateTime(){
        return DATA_FORMAT.format(new Date());
    }

    public static String simpleDataString(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_mm_dd_HH_MM_ss");
        return sdf.format(new Date());
    }


    public static boolean isBefore(String data1,String data2) {
        try {
            return DATA_FORMAT.parse(data1).before(DATA_FORMAT.parse(data2));
        } catch (ParseException e) {
            System.out.println("data pase error");
            return false;
        }
    }
    public static boolean isTimeOut(String data1,int seconds) {
        try {
            Date now = new Date();
            Calendar timeEnd=Calendar.getInstance();
            timeEnd.setTime(DATA_FORMAT.parse(data1));
            timeEnd.add(Calendar.SECOND,seconds);
            return timeEnd.getTime().before(now);
        } catch (Exception e) {
            System.out.println("data pase error");
            return false;
        }
    }

    public static void main(String[] args) {
        System.out.println(isTimeOut("2021年11月27日 11时10分11秒",600));
    }
}
