package com.nhky.emun;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/27
 * Time: 13:42
 **/
public enum OperatorResult {
//    (-2:已撤销,-1:已拒绝,0:发起申请,1:通过)
    BACK(-2,"已撤销"),
    REFUSE(-1,"已拒绝"),
    APPROVE(0,"发起申请"),
    ACK(1,"通过");

    private Integer code;
    private String msg;

    OperatorResult(Integer code, String message){
        this.code = code;
        this.msg = message;
    }


    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
