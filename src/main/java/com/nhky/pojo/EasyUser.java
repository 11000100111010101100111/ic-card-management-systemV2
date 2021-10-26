package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/23
 * Time: 17:33
 * Table: ("ic_main_easy_user")
 * 用户登录实体类
 **/

//用户登录实体类
public class EasyUser {
    Long id;
    //账号
    String easy_id;

    public String getEasy_id() {
        return easy_id;
    }

    public void setEasy_id(String easy_id) {
        this.easy_id = easy_id;
    }

    //密码
    String password;
    //用户身份
    String indentify;

    public EasyUser(Long id, String easy_id, String password, String indentify) {
        this.id = id;
        this.easy_id = easy_id;
        this.password = password;
        this.indentify = indentify;
    }

    public EasyUser(String easy_id, String password, String indentify) {
        this.easy_id = easy_id;
        this.password = password;
        this.indentify = indentify;
    }

    public EasyUser() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIndentify() {
        return indentify;
    }

    public void setIndentify(String identify) {
        this.indentify = identify;
    }
}
