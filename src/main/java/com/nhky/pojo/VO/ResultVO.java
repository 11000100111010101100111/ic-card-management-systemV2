package com.nhky.pojo.VO;

import com.alibaba.fastjson.JSON;

//统一请求的返回对象
public class ResultVO<T> {
    //是否成功
    private Boolean succeed;
    //状态代码
    private Integer code;
    //消息
    private String msg;
    //对应返回数据")
    private T data;

    public ResultVO(boolean succeed,int code, String mesage) {
        setSucceed(succeed);
        setCode(code);
        setMsg(mesage);
    }
    public ResultVO(ICommonCode code) {
        setSucceed(code.getSuccess());
        setCode(code.getCode());
        setMsg(code.getMsg());
    }
    public ResultVO(ICommonCode code, T data) {
        setSucceed(code.getSuccess());
        setCodeMessage(code);
        setData(data);
    }


    public ResultVO setCodeMessage(ICommonCode codeMessage) {
        setSucceed(codeMessage.getSuccess());
        setCode(codeMessage.getCode());
        setMsg(codeMessage.getMsg());
        return this;
    }

    public ResultVO(Boolean succeed, Integer code, String msg, T data) {
        this.succeed = succeed;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResultVO() {
    }

    public Boolean getSucceed() {
        return succeed;
    }

    public void setSucceed(Boolean succeed) {
        this.succeed = succeed;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
