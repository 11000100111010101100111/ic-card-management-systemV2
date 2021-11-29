package com.nhky.config.aop;

import com.nhky.annotation.AjaxConnect;
import com.nhky.annotation.VerifyParam;
import com.nhky.utils.AnnotationUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/29
 * Time: 12:36
 **/
@Component
@Aspect
public class ParamVerifyAop {
    @Around(value = " @annotation(com.nhky.annotation.VerifyParam)")
//    @Around("pointCut()")
    public Object trackInfo(ProceedingJoinPoint pjp) throws Throwable {
        //获取方法注解的值
        String reg = ( (VerifyParam) AnnotationUtil.getMethodAnnotation(pjp,VerifyParam.class) ).reg();

        return pjp.proceed();
    }
}
