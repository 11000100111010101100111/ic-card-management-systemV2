package com.nhky.route.home;

import com.nhky.pojo.Router;
import com.nhky.pojo.User;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/17
 * Time: 10:40
 **/
public interface NavigationService {
    public String seachPage();
    public Map<String ,Object> navigationList();
    public User getLoginUser();

    //获取开发者列表
    public List<User> getAuthors();
}
