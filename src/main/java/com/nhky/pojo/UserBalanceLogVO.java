package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/14
 * Time: 10:50
 * ==============================================================
 * =============   ic_main_user_balance_log   ===================
 * ==============================================================
 * =  id:           (bigint)        主键非空自增   记录的id
 * =  user_id:      (bigint)                      用户账号id
 * =  money:        (varchar(50))                 变更的金额
 * =  type:         (varchar(50))                 变更的类型名称
 * =  time:         (varchar(50))                 变更的时间
 * =  balance:      (varchar(50))                 变更后的余额
 * =  operator_user:(bigint)                      操作人的id
 * =  ip_host:      (varchar(50))                 操作的主机
 * =  status:       (int)                         记录的状态字
 * =  note:         (varchar(255))                备注
 * ==============================================================
 **/


public class UserBalanceLogVO {
    Long id ;
    Long userId;
    String money;
    String type;
    String time;
    String balance;
    String operatorUser;
    String ipHost;
    Integer status;
    String note;

    public UserBalanceLogVO() {
    }
    public UserBalanceLogVO(Long userId, String money, String type, String operatorUser, String ipHost, Integer status, String note) {
        this.userId = userId;
        this.money = money;
        this.type = type;
        this.operatorUser = operatorUser;
        this.ipHost = ipHost;
        this.status = status;
        this.note = note;
    }

    public UserBalanceLogVO(Long userId, String money, String type, String time, String balance, String operatorUser, String ipHost, Integer status, String note) {
        this.userId = userId;
        this.money = money;
        this.type = type;
        this.time = time;
        this.balance = balance;
        this.operatorUser = operatorUser;
        this.ipHost = ipHost;
        this.status = status;
        this.note = note;
    }

    public UserBalanceLogVO(Long id, Long userId, String money, String type, String time, String balance, String operatorUser, String ipHost, Integer status, String note) {
        this.id = id;
        this.userId = userId;
        this.money = money;
        this.type = type;
        this.time = time;
        this.balance = balance;
        this.operatorUser = operatorUser;
        this.ipHost = ipHost;
        this.status = status;
        this.note = note;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getOperatorUser() {
        return operatorUser;
    }

    public void setOperatorUser(String operatorUser) {
        this.operatorUser = operatorUser;
    }

    public String getIpHost() {
        return ipHost;
    }

    public void setIpHost(String ipHost) {
        this.ipHost = ipHost;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
