package com.nhky.config.aop;

import com.nhky.annotation.AjaxConnect;
import com.nhky.utils.AnnotationUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 15:36
 **/
@Component
@Aspect
public class AjaxAop {

//此切面插入到所有被AjaxConnect标记的方法，作用执行方法前等待一定时间，时间问注解值time
//    @Pointcut("@target(com.nhky.annotation.AjaxConnect)")
//    public void pointCut(){}

//    private AjaxConnect getMethodAnnotation(ProceedingJoinPoint pjp)
//            throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
//
//        MethodInvocationProceedingJoinPoint methodPjp = (MethodInvocationProceedingJoinPoint) pjp;
//        Field field = methodPjp.getClass().getDeclaredField("methodInvocation");
//        field.setAccessible(true);
//        ProxyMethodInvocation invocation = (ProxyMethodInvocation) field.get(methodPjp);
//        AjaxConnect media = invocation.getMethod().getAnnotation(AjaxConnect.class);
//        return media;
//    }
//    @Before("@target(AjaxConnect)")
//    public void doBefore(JoinPoint joinPoint){
//        Signature signature = pjp.getSignature();
//        MethodSignature methodSignature = (MethodSignature) signature;
//        Method targetMethod = methodSignature.getMethod();
//    }


//execution(* *.*(..)) &&
    @Around(value = " @annotation(com.nhky.annotation.AjaxConnect)")
//    @Around("pointCut()")
    public Object trackInfo(ProceedingJoinPoint pjp) throws Throwable {
        //获取方法注解的值
        int time = ( (AjaxConnect) AnnotationUtil.getMethodAnnotation(pjp,AjaxConnect.class) ).time();
        try {
            Thread.sleep(time);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return pjp.proceed();
    }
}
