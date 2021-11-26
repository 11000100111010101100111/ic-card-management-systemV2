package com.nhky.utils;

import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/26
 * Time: 21:12
 **/
public class VeryificationCodeUtil {
    public static String getCode(int size) {
        StringBuilder sb = new StringBuilder();
//        48-57:0-9
//        65-90:A-Z
//        97-122:a-z
//        while ((sb.append((new Random()).nextInt(90)+65)).length()<size){}
        int item = 0;
        while (sb.length()<size)
        {
            while(( (item =(new Random()).nextInt(74)+48)>57 && item<65)
                    || (item>90&&item<97) ){}
//            System.out.println(item + ":" + (char) (item));
            sb.append((""+(char) (item)).toUpperCase());
        }
        return sb.toString();
    }
}
