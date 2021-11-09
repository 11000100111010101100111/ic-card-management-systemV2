package com.nhky.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 15:43
 * ajax连接，模拟等待时间，参数time默认1000ms
 **/

//@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface AjaxConnect{
    int time() default 1000;
}
