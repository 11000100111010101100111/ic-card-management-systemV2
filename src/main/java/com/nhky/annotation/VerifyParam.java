package com.nhky.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 11:16
 * 根据正则表达式验证局部变量的注解(默认验证数字)
 **/
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.LOCAL_VARIABLE)
public @interface VerifyParam {
    String reg() default "^[0-9]*$";
}
