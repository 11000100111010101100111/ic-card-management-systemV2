package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/5
 * Time: 22:18
 **/
public class HotGoodsVO {
    Long goodsId;
    String goodsName;
    String goodsIcon;
    String goodsPrice;
    String goodsExtant;
    String goodsInventory;
    String goodsDiscount;
    String goodsTitle;
    String goodsDescription;
    String goodsIsSpecial;
    String goodsClass;
    String goodsUtil;
    String goodsCellNum;//销售量
    public String getGoodsMark() {
        return goodsMark;
    }

    public void setGoodsMark(String goodsMark) {
        this.goodsMark = goodsMark;
    }

    String goodsMark;
    public String getGoodsCellNum() {
        return goodsCellNum;
    }

    public void setGoodsCellNum(String goodsCellNum) {
        this.goodsCellNum = goodsCellNum;
    }

    public HotGoodsVO() {
    }

    public HotGoodsVO(Long goodsId, String goodsName, String goodsIcon, String goodsPrice, String goodsExtant, String goodsInventory, String goodsDiscount, String goodsTitle, String goodsDescription, String goodsIsSpecial, String goodsClass, String goodsUtil, String goodsCellNum) {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsIcon = goodsIcon;
        this.goodsPrice = goodsPrice;
        this.goodsExtant = goodsExtant;
        this.goodsInventory = goodsInventory;
        this.goodsDiscount = goodsDiscount;
        this.goodsTitle = goodsTitle;
        this.goodsDescription = goodsDescription;
        this.goodsIsSpecial = goodsIsSpecial;
        this.goodsClass = goodsClass;
        this.goodsUtil = goodsUtil;
        this.goodsCellNum = goodsCellNum;
    }

    public HotGoodsVO(String goodsName, String goodsIcon, String goodsPrice, String goodsExtant, String goodsInventory, String goodsDiscount, String goodsTitle, String goodsDescription, String goodsIsSpecial, String goodsClass, String goodsUtil, String goodsCellNum) {
        this.goodsName = goodsName;
        this.goodsIcon = goodsIcon;
        this.goodsPrice = goodsPrice;
        this.goodsExtant = goodsExtant;
        this.goodsInventory = goodsInventory;
        this.goodsDiscount = goodsDiscount;
        this.goodsTitle = goodsTitle;
        this.goodsDescription = goodsDescription;
        this.goodsIsSpecial = goodsIsSpecial;
        this.goodsClass = goodsClass;
        this.goodsUtil = goodsUtil;
        this.goodsCellNum = goodsCellNum;
    }


    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsIcon() {
        return goodsIcon;
    }

    public void setGoodsIcon(String goodsIcon) {
        this.goodsIcon = goodsIcon;
    }

    public String getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(String goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsExtant() {
        return goodsExtant;
    }

    public void setGoodsExtant(String goodsExtant) {
        this.goodsExtant = goodsExtant;
    }

    public String getGoodsInventory() {
        return goodsInventory;
    }

    public void setGoodsInventory(String goodsInventory) {
        this.goodsInventory = goodsInventory;
    }

    public String getGoodsDiscount() {
        return goodsDiscount;
    }

    public void setGoodsDiscount(String goodsDiscount) {
        this.goodsDiscount = goodsDiscount;
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    public String getGoodsDescription() {
        return goodsDescription;
    }

    public void setGoodsDescription(String goodsDescription) {
        this.goodsDescription = goodsDescription;
    }

    public String getGoodsIsSpecial() {
        return goodsIsSpecial;
    }

    public void setGoodsIsSpecial(String goodsIsSpecial) {
        this.goodsIsSpecial = goodsIsSpecial;
    }

    public String getGoodsClass() {
        return goodsClass;
    }

    public void setGoodsClass(String goodsClass) {
        this.goodsClass = goodsClass;
    }

    public String getGoodsUtil() {
        return goodsUtil;
    }

    public void setGoodsUtil(String goodsUtil) {
        this.goodsUtil = goodsUtil;
    }
}
