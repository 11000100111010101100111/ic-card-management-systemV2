package com.nhky.utils;

import com.nhky.annotation.VerifyParam;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.aop.ProxyMethodInvocation;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.HashMap;
import java.util.Map;

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
        Object annotation = (Object) invocation.getMethod().getAnnotation(annotationClz);
        return annotation;
    }

//    //在切面内获取变量上的注解
//    public static Object getLocalParamValue(ProceedingJoinPoint pjp,Class annotationClz)
//            throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
//        MethodInvocationProceedingJoinPoint methodPjp = (MethodInvocationProceedingJoinPoint) pjp;
//        Field field = methodPjp.getClass().getDeclaredField("methodInvocation");
//        field.setAccessible(true);
//        ProxyMethodInvocation invocation = (ProxyMethodInvocation) field.get(methodPjp);
//        Parameter[] f = invocation.getMethod().getParameters();
//
//        Map<Object,Object> result = new HashMap<>();
//
////        f.setAccessible(true);
//
//        for (Parameter p : f) {
////            f.setAccessible(true);
//            try {
//                result.put(p.getAnnotation(annotationClz),p.get);
//            }catch (Exception e){
//
//            }
//        }
//    }
}
