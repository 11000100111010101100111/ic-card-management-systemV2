package com.nhky.utils;

import com.nhky.annotation.AjaxConnect;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.aop.ProxyMethodInvocation;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 16:02
 **/
public class AnnotationUtil {

    //在切面内获取方法上的注解
    //Class annotationClz 待获取注解的class
    public static Object getMethodAnnotation(ProceedingJoinPoint pjp,Class annotationClz)
            throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {

        MethodInvocationProceedingJoinPoint methodPjp = (MethodInvocationProceedingJoinPoint) pjp;
        Field field = methodPjp.getClass().getDeclaredField("methodInvocation");
        field.setAccessible(true);
        ProxyMethodInvocation invocation = (ProxyMethodInvocation) field.get(methodPjp);
        Annotation media = (Annotation) invocation.getMethod().getAnnotation(annotationClz);
        return media;
    }
}
