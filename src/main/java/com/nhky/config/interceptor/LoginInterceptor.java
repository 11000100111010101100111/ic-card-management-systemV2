package com.nhky.config.interceptor;

import com.nhky.utils.LogUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/18
 * Time: 20:02
 **/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String userId = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        if(null == userId || "".equals( userId )){
            LogUtil.info("用户未登录...拦截成功...");
            httpServletResponse.sendRedirect("/nchkkjxy/go/toLogin");
//            httpServletRequest.getRequestDispatcher("/go/toLogin").forward(httpServletRequest,httpServletResponse);
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
