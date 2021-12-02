package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/2
 * Time: 21:32
 *====================ic_card_easy_msg=======================
 *     bigint id                    表id（卡id）;
 *     varchar(255) blance          卡余额;
 *     varchar(255) create_date     创建日期;
 *     varchar(255) card_status     卡状态;
 *     varchar(255) card_type_type  卡类型;
 *     int status                   状态字;
 *
 *===========================================================
 **/
public class CardEasyMsg {
    Long id;
    String blance;
    String create_date;
    String card_status;
    String card_type_type;
    Integer status;

    public CardEasyMsg() {
    }

    public CardEasyMsg(String blance, String create_date, String card_status, String card_type_type, Integer status) {
        this.blance = blance;
        this.create_date = create_date;
        this.card_status = card_status;
        this.card_type_type = card_type_type;
        this.status = status;
    }

    public CardEasyMsg(String card_type_type) {
        this.card_type_type = card_type_type;
    }

    public CardEasyMsg(Long id, String blance, String create_date, String card_status, String card_type_type, Integer status) {
        this.id = id;
        this.blance = blance;
        this.create_date = create_date;
        this.card_status = card_status;
        this.card_type_type = card_type_type;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBlance() {
        return blance;
    }

    public void setBlance(String blance) {
        this.blance = blance;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getCard_status() {
        return card_status;
    }

    public void setCard_status(String card_status) {
        this.card_status = card_status;
    }

    public String getCard_type_type() {
        return card_type_type;
    }

    public void setCard_type_type(String card_type_type) {
        this.card_type_type = card_type_type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
