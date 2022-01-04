package com.nhky.config.interceptor;

import com.nhky.pojo.LoginHistory;
import com.nhky.route.home.RouterNavigationDao;
import com.nhky.utils.AccessUtil;
import com.nhky.utils.DateUtil;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/8
 * Time: 9:26
 **/
public class VisitorInterceptor implements HandlerInterceptor {
    @Resource(name = "routerNavigationDao")
    RouterNavigationDao navigationDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ip = AccessUtil.getRemoteHost(request);
        String name = StringUtil.getPamterString(request.getRemoteUser());

        if(null == request.getSession() || null == request.getSession().getAttribute("userId")){
            List<LoginHistory> list = navigationDao.getLoginHistory(ip);
            if(null != list && list.size()>0){
                LoginHistory login = list.get(0);
                List<Map<String,Object>> users = navigationDao.getUMsg(login.getUid());
                String saveTimes = StringUtil.getPamterString(users.get(0).get("save_times"));
                saveTimes = "".equals(saveTimes)?"0":saveTimes;
                if(null != users
                        && users.size()>0
                        && !DateUtil.isTimeOut(
                                StringUtil.getPamterString(users.get(0).get("create_time")),
                                Integer.parseInt(saveTimes))) {
                    Map<String,Object> user = users.get(0);
                    request.getSession().setAttribute("userId", login.getUid());
                    request.getSession().setAttribute("userAccount", StringUtil.getPamterString(user.get("easy_id")));
                    request.getSession().setAttribute("userIdentify", StringUtil.getPamterString(user.get("indentify")));
                    name = StringUtil.getPamterString(login.getUid());
                }
            }
        }

        navigationDao.addVisitor(ip,name);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
