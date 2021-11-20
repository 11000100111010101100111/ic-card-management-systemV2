package com.nhky.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 14:13
 **/
public class RequestUtil {
    public static HttpServletRequest getRequest(){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest();
    }
    public static void setRequestSessionAttr(String key,Object uMsg){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session=attr.getRequest().getSession(true);
        attr.getRequest().setAttribute(key,uMsg);
        session.setAttribute(key,uMsg);
    }
    public static Object getRequestSessionAttr(String key){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session=attr.getRequest().getSession(true);
        return  session.getAttribute(key);
    }
    public static Object getRequestParam(String key){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getParameter(key);
    }
    public static void destroySession(){
        Enumeration em = RequestUtil.getRequest().getSession().getAttributeNames();
        while(em.hasMoreElements()){
            RequestUtil.getRequest().getSession().removeAttribute(em.nextElement().toString());
        }
    }
}
