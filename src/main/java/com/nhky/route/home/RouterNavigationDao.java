package com.nhky.route.home;

import com.nhky.pojo.LoginHistory;
import com.nhky.pojo.Router;
import com.nhky.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/17
 * Time: 11:00
 *
 * ic_util_router_navigation
 **/
@Repository
public interface RouterNavigationDao {
    //在某个状态下，查询用户可访问路由集合（如：用户访问主页时，获取导航栏路由信息，此时路由状态就是主页，根据uid获取用户权限级别后查询可访问路由）
    public List<Router> navigationList(@Param("uid") Long uid, @Param("router_type") String router_type);

    //获取当前登录用户信息
    public User getUser(@Param("uid") Long uid);

    //获取开发者列表
    public List<User> getAuthors();

    /*
    *
    * 修改邮箱
    * */
    public Integer modifyEmail(@Param("email") String email,@Param("uid") Long uid);

    //记录当前访问主机
    public Integer addVisitor(@Param("ip") String ip,@Param("name") String name);

    //查询当前主机是否保存某个用户登录信息并且未过期
    public List<LoginHistory> getLoginHistory(@Param("ip") String ip);
//    #查询用户信息
    public List<Map<String,Object>> getUMsg(@Param("uid") Long uid);

    //保存用户登录信息到当前主机:当前账号以经保存登录信息，则覆盖之前的登录信息，不存在就插入一条
    public Integer saveLoginMsg(LoginHistory history);
    //修改过期的登录信息
    public Integer removeTimeOutHistory(@Param("uid") Long uid ,@Param("ip") String ip);
}
