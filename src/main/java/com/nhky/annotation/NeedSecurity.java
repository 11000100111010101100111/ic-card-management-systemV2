package com.nhky.annotation;


import com.nhky.emun.Security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 16:16
 * 此注解标记得执行方法需要安全验证，安全级别为枚举参数所示
 **/

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface NeedSecurity {
    Security security() default Security.NOMAL;
}
