package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/27
 * Time: 14:41
 **/

 /* ==============================================================
 * =============              ic_card_handel   ===================
 * ==============================================================
 * =  id:                 (bigint)        主键非空自增   记录的id
 * =  card_id:            (bigint)                      卡id
 * =  handle_type:        (varchar(225))                处理类型
 * =  handle_date:        (varchar(225))                处理日期
 * =  handle_result:      (varchar(10))                 处理结果(-1:已撤销,0:挂失)
 * =  mark:               (varchar(225))                处理备注
 * =  status:             (bigint)                      状态码
 * ==============================================================
 **/
public class CardHistory {
    Long id;
    Long card_id;
    String handle_type;
    String handle_date;
    String handle_result;
    String mark;
    Integer status;

    public CardHistory(Long card_id, String handle_type, String handle_date, String handle_result, String mark) {
        this.card_id = card_id;
        this.handle_type = handle_type;
        this.handle_date = handle_date;
        this.handle_result = handle_result;
        this.mark = mark;
    }

    public CardHistory(Long card_id, String handle_type, String handle_date, String handle_result, String mark, Integer status) {
        this.card_id = card_id;
        this.handle_type = handle_type;
        this.handle_date = handle_date;
        this.handle_result = handle_result;
        this.mark = mark;
        this.status = status;
    }

    public CardHistory(Long id, Long card_id, String handle_type, String handle_date, String handle_result, String mark, Integer status) {
        this.id = id;
        this.card_id = card_id;
        this.handle_type = handle_type;
        this.handle_date = handle_date;
        this.handle_result = handle_result;
        this.mark = mark;
        this.status = status;
    }

    public CardHistory(Long card_id, String handle_type, String handle_result, String mark) {
        this.card_id = card_id;
        this.handle_type = handle_type;
        this.handle_result = handle_result;
        this.mark = mark;
    }

    public CardHistory() {
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

    public String getHandle_type() {
        return handle_type;
    }

    public void setHandle_type(String handle_type) {
        this.handle_type = handle_type;
    }

    public String getHandle_date() {
        return handle_date;
    }

    public void setHandle_date(String handle_date) {
        this.handle_date = handle_date;
    }

    public String getHandle_result() {
        return handle_result;
    }

    public void setHandle_result(String handle_result) {
        this.handle_result = handle_result;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
