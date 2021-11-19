package com.nhky.config.aop;

import com.nhky.annotation.NeedSecurity;
import com.nhky.emun.Security;
import com.nhky.loginAndRegister.dao.LoginAndRegisterDao;
import com.nhky.utils.AnnotationUtil;
import com.nhky.utils.LogUtil;
import com.nhky.utils.StringUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 16:13
 **/
@Component
@Aspect
public class SessionAop {
    @Resource
    LoginAndRegisterDao loginAndRegisterDao;

    @Pointcut("@annotation(com.nhky.annotation.NeedSecurity)")
    public void pointCut(){}

    //execution(* com.nhky.*.controller.*(..)) &&
//    @Around(value = "@annotation(com.nhky.annotation.NeedSecurity)")
    @Around("pointCut()")
    public Object trackInfo(ProceedingJoinPoint pjp) throws Throwable {
        Long userId = null;
        String userIdentify = null;
        try {
            //获取当前Session,并判断当前访问是否处于登录状态，若位处于登录状态，则立刻跳转去登录
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            HttpSession session=attr.getRequest().getSession(true);
            userId = (Long) session.getAttribute("userId");
            userIdentify = (String) session.getAttribute("userIdentify");

            if(null == userId || userId.equals("")){
                LogUtil.info("用户未登录...拦截成功...");
                return "/loginAndRegister/login";
            }
//            if(loginAndRegisterDao.hasID(userId) <= 0){
//                LogUtil.info("用户账号失效...拦截成功...");
//                return "/loginAndRegister/login";
//            }

            //获取用户权限级别
            int userGrade = 0;
            for (Security item : Security.values()) {
                if (userIdentify.equals(item.getCode())){
                    userGrade = item.getGrade();
                    userGrade = userGrade;
                }
            }

            //获取方法可访问级别
            Security security = ((NeedSecurity)AnnotationUtil.getMethodAnnotation(pjp,NeedSecurity.class)).security();

            //判断用户权限级别是否大于方法的访问级别
            if(userGrade < security.getGrade()){
                LogUtil.info("用户操作未获得权限...级别低于"+security.getCode()+"...拦截成功...");
                return null;
            }
        }
        catch (Exception e){
            LogUtil.info("用户未登录...拦截成功...");
            return "/loginAndRegister/login";
        }

        return pjp.proceed();
    }
}


