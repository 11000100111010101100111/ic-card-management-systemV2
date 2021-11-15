package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/24
 * Time: 21:13
 * 用户表： ic_main_user
 **/
public class User {
    Long id;
    Long easy_id;
    String name;
    String identify_card;
    String phone;
    String email;
    String brithday;
    String sex;
    String head_url;
    String single;
    String register_identify;
    String user_status;
    String money_balance;
    String node_status;

    public User() {
    }

    public User(Long easy_id, String name, String identify_card, String phone, String email, String brithday, String sex, String head_url, String single) {
        this.easy_id = easy_id;
        this.name = name;
        this.identify_card = identify_card;
        this.phone = phone;
        this.email = email;
        this.brithday = brithday;
        this.sex = sex;
        this.head_url = head_url;
        this.single = single;
    }

    public User(Long easy_id, String name, String identify_card, String phone, String email, String brithday, String sex, String head_url, String single, String register_identify, String user_status, String money_balance, String node_status) {
        this.easy_id = easy_id;
        this.name = name;
        this.identify_card = identify_card;
        this.phone = phone;
        this.email = email;
        this.brithday = brithday;
        this.sex = sex;
        this.head_url = head_url;
        this.single = single;
        this.register_identify = register_identify;
        this.user_status = user_status;
        this.money_balance = money_balance;
        this.node_status = node_status;
    }

    public User(Long id,Long easy_id, String name, String identify_card, String phone, String email, String brithday, String sex, String head_url, String single, String register_identify, String user_status, String money_balance, String node_status) {
        this.id = id;
        this.easy_id = easy_id;
        this.name = name;
        this.identify_card = identify_card;
        this.phone = phone;
        this.email = email;
        this.brithday = brithday;
        this.sex = sex;
        this.head_url = head_url;
        this.single = single;
        this.register_identify = register_identify;
        this.user_status = user_status;
        this.money_balance = money_balance;
        this.node_status = node_status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", easy_id=" + easy_id +
                ", name='" + name + '\'' +
                ", identify_card='" + identify_card + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", brithday='" + brithday + '\'' +
                ", sex='" + sex + '\'' +
                ", head_url='" + head_url + '\'' +
                ", single='" + single + '\'' +
                ", register_identify='" + register_identify + '\'' +
                ", user_status='" + user_status + '\'' +
                ", money_balance='" + money_balance + '\'' +
                ", node_status='" + node_status + '\'' +
                '}';
    }

    public Long getEasy_id() {
        return easy_id;
    }

    public void setEasy_id(Long easy_id) {
        this.easy_id = easy_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdentify_card() {
        return identify_card;
    }

    public void setIdentify_card(String identify_card) {
        this.identify_card = identify_card;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBrithday() {
        return brithday;
    }

    public void setBrithday(String brithday) {
        this.brithday = brithday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHead_url() {
        return head_url;
    }

    public void setHead_url(String head_url) {
        this.head_url = head_url;
    }

    public String getSingle() {
        return single;
    }

    public void setSingle(String single) {
        this.single = single;
    }

    public String getRegister_identify() {
        return register_identify;
    }

    public void setRegister_identify(String register_identify) {
        this.register_identify = register_identify;
    }

    public String getUser_status() {
        return user_status;
    }

    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }

    public String getMoney_balance() {
        return money_balance;
    }

    public void setMoney_balance(String money_balance) {
        this.money_balance = money_balance;
    }

    public String getNode_status() {
        return node_status;
    }

    public void setNode_status(String node_status) {
        this.node_status = node_status;
    }
}
