package com.nhky.route.home;

import com.nhky.pojo.Router;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public List<Router> navigationList(@Param("uid") Long uid, @Param("router_type")String router_type);
}
