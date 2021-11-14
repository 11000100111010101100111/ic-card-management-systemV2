package com.nhky.personalInformation.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 22:05
 * 交易自己变动实体类，用来作为分页结果存储对象
 **/
public class FundVO {
//    {title:"id",name:"id",width:"5",hidden:true,align:"center"},
//    {title:"变更类型", name:"changeType",       width:"10",hidden:false,align:"center"},
//    {title:"变更金额", name:"changeMoney", width:"10",hidden:false,align:"center"},
//    {title:"操作账号", name:"operatorUser",   width:"20",hidden:false,align:"center"},
//    {title:"余额",     name:"blance",   width:"20",hidden:false,align:"center"},
//    {title:"时间",     name:"time",   width:"10",hidden:false,align:"center"},
//    {title:"备注",     name:"note",    width:"20",hidden:false,align:"center"},
    Long id;
    String changeType;
    String changeMoney;
    String operatorUser;
    String blance;
    String time;
    String note;
    Integer total;//总记录数

    public FundVO() {
    }

    public FundVO(String changeType, String changeMoney, String operatorUser, String blance, String time, String note) {
        this.changeType = changeType;
        this.changeMoney = changeMoney;
        this.operatorUser = operatorUser;
        this.blance = blance;
        this.time = time;
        this.note = note;
    }

    public FundVO(Long id, String changeType, String changeMoney, String operatorUser, String blance, String time, String note) {
        this.id = id;
        this.changeType = changeType;
        this.changeMoney = changeMoney;
        this.operatorUser = operatorUser;
        this.blance = blance;
        this.time = time;
        this.note = note;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getChangeType() {
        return changeType;
    }

    public void setChangeType(String changeType) {
        this.changeType = changeType;
    }

    public String getChangeMoney() {
        return changeMoney;
    }

    public void setChangeMoney(String changeMoney) {
        this.changeMoney = changeMoney;
    }

    public String getOperatorUser() {
        return operatorUser;
    }

    public void setOperatorUser(String operatorUser) {
        this.operatorUser = operatorUser;
    }

    public String getBlance() {
        return blance;
    }

    public void setBlance(String blance) {
        this.blance = blance;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
