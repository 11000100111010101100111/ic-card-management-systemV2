package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 17:48
 * IC卡充值记录实体类
 *
 * ============ic_recharge_node==================================
 * ==   id               bigint          结点id
 * ==   recharge_money   varchar(255)    充值金额
 * ==   recharge_time    varchar(255)    充值时间
 * ==   status           int             -1,表示消费,1表示充值
 * ==   blance           varchar(50)     充值后的余额
 * ==   note             varchar(255)    备注
 * ===============================================================
 **/
public class CardRechargeVO {
    Long id;
    String recharge_money;
    String recharge_time;
    Integer status;
    String blance;
    String note;
    Long cid;

    public CardRechargeVO() {
    }

    public CardRechargeVO(Long id, String recharge_money, String recharge_time, Integer status, String blance, String note, Long cid) {
        this.id = id;
        this.recharge_money = recharge_money;
        this.recharge_time = recharge_time;
        this.status = status;
        this.blance = blance;
        this.note = note;
        this.cid = cid;
    }

    public CardRechargeVO(String recharge_money, String recharge_time, Integer status, String blance, String note) {
        this.recharge_money = recharge_money;
        this.recharge_time = recharge_time;
        this.status = status;
        this.blance = blance;
        this.note = note;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public CardRechargeVO(Long id, String recharge_money, String recharge_time, Integer status, String blance, String note) {
        this.id = id;
        this.recharge_money = recharge_money;
        this.recharge_time = recharge_time;
        this.status = status;
        this.blance = blance;
        this.note = note;
    }

    public CardRechargeVO(String recharge_money,String note, Long cid) {
        this.recharge_money = recharge_money;
        this.note = note;
        this.cid = cid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRecharge_money() {
        return recharge_money;
    }

    public void setRecharge_money(String recharge_money) {
        this.recharge_money = recharge_money;
    }

    public String getRecharge_time() {
        return recharge_time;
    }

    public void setRecharge_time(String recharge_time) {
        this.recharge_time = recharge_time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBlance() {
        return blance;
    }

    public void setBlance(String blance) {
        this.blance = blance;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
