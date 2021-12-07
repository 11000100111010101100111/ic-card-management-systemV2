package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/7
 * Time: 22:38
 * ===============ic_shopping_goods_tag====================
 *   id              bigint         交易id
 *   goods_id        bigint         商品id
 *   card_id         bigint         IC卡号
 *   shopping_time   varchar(225)   交易时间
 *   shopping_money  varchar(225)   交易金额
 *   status          int            状态字
 *   shopping_num    int            下单数
 *   shopping_user   bigint         下单人id
 **/
public class ShoppingHistory {
    Long id;
    Long goods_id;
    Long card_id;
    String shopping_time;
    Long shopping_user;
    String shopping_money;
    Integer shopping_num;
    Integer status;

    public ShoppingHistory() {
    }

    public ShoppingHistory(Long goods_id, Long card_id, String shopping_time, Long shopping_user, String shopping_money, Integer shopping_num, Integer status) {
        this.goods_id = goods_id;
        this.card_id = card_id;
        this.shopping_time = shopping_time;
        this.shopping_user = shopping_user;
        this.shopping_money = shopping_money;
        this.shopping_num = shopping_num;
        this.status = status;
    }

    public ShoppingHistory(Long goods_id, Long card_id, String shopping_time, Long shopping_user, String shopping_money, Integer shopping_num) {
        this.goods_id = goods_id;
        this.card_id = card_id;
        this.shopping_time = shopping_time;
        this.shopping_user = shopping_user;
        this.shopping_money = shopping_money;
        this.shopping_num = shopping_num;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Long goods_id) {
        this.goods_id = goods_id;
    }

    public Long getCard_id() {
        return card_id;
    }

    public void setCard_id(Long card_id) {
        this.card_id = card_id;
    }

    public String getShopping_time() {
        return shopping_time;
    }

    public void setShopping_time(String shopping_time) {
        this.shopping_time = shopping_time;
    }

    public Long getShopping_user() {
        return shopping_user;
    }

    public void setShopping_user(Long shopping_user) {
        this.shopping_user = shopping_user;
    }

    public String getShopping_money() {
        return shopping_money;
    }

    public void setShopping_money(String shopping_money) {
        this.shopping_money = shopping_money;
    }

    public Integer getShopping_num() {
        return shopping_num;
    }

    public void setShopping_num(Integer shopping_num) {
        this.shopping_num = shopping_num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
