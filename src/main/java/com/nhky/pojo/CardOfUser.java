package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/31
 * Time: 14:07
 *  * Table: ("ic_card_msg")
 *  * 用户拥有卡实体类
 **/
public class CardOfUser {

    private Long id;
    private Long card_id;
    private Long user_id;
    private Integer card_status;//   卡状态： -3失效卡，-2正在注销中，-1正在挂失中，0申请恢复中，1正常
    private Integer status;
    public CardOfUser() {
    }

    public CardOfUser(Long card_id, Long user_id, Integer status,Integer card_status) {
        this.card_id = card_id;
        this.user_id = user_id;
        this.card_status = card_status;
        this.status = status;
    }

    public CardOfUser(Long id, Long card_id, Long user_id, Integer status,Integer card_status) {
        this.id = id;
        this.card_id = card_id;
        this.user_id = user_id;
        this.status = status;
        this.card_status = card_status;
    }

    @Override
    public String toString() {
        return "CardOfUser{" +
                "id=" + id +
                ", card_id=" + card_id +
                ", user_id=" + user_id +
                ", status=" + status +
                '}';
    }

    public Integer getCard_status() {
        return card_status;
    }

    public void setCard_status(Integer card_status) {
        this.card_status = card_status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCard_id() {
        return card_id;
    }

    public void setCard_id(Long card_id) {
        this.card_id = card_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
