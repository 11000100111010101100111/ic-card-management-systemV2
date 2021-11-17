package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/17
 * Time: 11:03
 *   ic_util_router_navigation:
 *        id:              (bigint)        记录id（路由id）
 *        title:           (varchar 30)    显示文本
 *        url:             (varchar  256)  路由地址
 *        icon:            (varchar  256)  icon路径
 *        router_type:     (varchar 50)    路由类型
 *        leavel:          (int)           路由可访问级别，0表示默认级别（任何人都可访问），大于0，越大时访问者需要权限月严格
 *        parent_router:   (bigint)        父级路由id
 *        create_time:     (varchar 50)    路由创建时间
 *        create_personal: (bigint)        路由创建人id
 *        del_time:        (varchar 50)    路由删除时间
 *        del_personal:    (bigint)        路由删除id
 *        status:          (int)           路由状态默认1，0表示删除
 **/
public class Router {
    Long id;
    String title;
    String url;
    String icon;
    String route_type;
    Integer leavel;
    Long  parent_router;
    String create_time;
    Long create_personal;
    String del_time;
    Long del_personal;
    Integer status;

    public Router() {
    }

    public Integer getLeavel() {
        return leavel;
    }

    public void setLeavel(Integer leavel) {
        this.leavel = leavel;
    }

    public Router(String title, String url, String icon, String route_type, Integer leavel, Long parent_router, String create_time, Long create_personal, String del_time, Long del_personal, Integer status) {
        this.title = title;
        this.url = url;
        this.icon = icon;
        this.leavel = leavel;
        this.route_type = route_type;
        this.parent_router = parent_router;
        this.create_time = create_time;
        this.create_personal = create_personal;
        this.del_time = del_time;
        this.del_personal = del_personal;
        this.status = status;
    }

    public Router(Long id, String title, String url, String icon, String route_type, Integer leavel,Long parent_router) {
        this.leavel = leavel;
        this.id = id;
        this.title = title;
        this.url = url;
        this.icon = icon;
        this.route_type = route_type;
        this.parent_router = parent_router;
    }

    public Router(Long id, String title, String url, String icon, String route_type, Long parent_router,Integer leavel, String create_time, Long create_personal, String del_time, Long del_personal, Integer status) {
        this.id = id;
        this.title = title;
        this.url = url;
        this.icon = icon;
        this.leavel = leavel;
        this.route_type = route_type;
        this.parent_router = parent_router;
        this.create_time = create_time;
        this.create_personal = create_personal;
        this.del_time = del_time;
        this.del_personal = del_personal;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getRoute_type() {
        return route_type;
    }

    public void setRoute_type(String route_type) {
        this.route_type = route_type;
    }

    public Long getParent_router() {
        return parent_router;
    }

    public void setParent_router(Long parent_router) {
        this.parent_router = parent_router;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public Long getCreate_personal() {
        return create_personal;
    }

    public void setCreate_personal(Long create_personal) {
        this.create_personal = create_personal;
    }

    public String getDel_time() {
        return del_time;
    }

    public void setDel_time(String del_time) {
        this.del_time = del_time;
    }

    public Long getDel_personal() {
        return del_personal;
    }

    public void setDel_personal(Long del_personal) {
        this.del_personal = del_personal;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
