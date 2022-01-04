package com.nhky.annotation;

import com.nhky.config.safe.XssValidator;
import org.apache.logging.log4j.core.config.plugins.validation.Constraint;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义xss校验注解
 * 
 * @author ruoyi
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(value = { ElementType.METHOD, ElementType.FIELD, ElementType.CONSTRUCTOR, ElementType.PARAMETER })
public @interface Xss
{
    String message()

    default "不允许任何脚本运行";

    Class<?>[] groups() default {};

}