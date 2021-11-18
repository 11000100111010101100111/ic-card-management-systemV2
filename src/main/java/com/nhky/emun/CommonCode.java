package com.nhky.emun;

import com.nhky.pojo.VO.ICommonCode;

//ErrorCode的接口实现枚举
//IErrorCode（错误代码的接口类），里面定义两个方法，即获取错误码和错误消息的接口方法
public enum CommonCode implements ICommonCode {
    /***
     * 1. 以下错误码的定义，需要提前与前端沟通
     * 2. 错误码按模块进行错误码规划
     * 3. 所有错误码枚举类均需要实现错误码接口类
     */
    SUCCESS(              true, 0,      "操作成功"          ),
    SYSTEM_BUSY(          false,10000,  "系统繁忙,稍后再试!" ),
    FORM_VALIDATION_ERROR(false,10001,  "表单验证错误"       ),
    // 用户登录方面错误码
    LOGIN_ERROR(          false,101001, "你未登陆,请登陆"    ),
    TOKEN_ERROR(          false,101002, "登录过期，请重新登录"),
    UPDATE_ERROR(          false,101003, "数据更新异常"),
    SELECT_ERROR(          false,101004, "数据查询异常"),
    INSERT_ERROR(false,101005, "数据增加异常"),
    INSERT_SUCCEED(true,101006, "添加加成功"),
    NO_LOGIN(false,101007,"没有登录，请先登录");
    //...
    //可向下增加更多类型



    /**
     * 操作成功
     */

    private boolean success;
    private Integer code;
    private String msg;

    CommonCode(boolean success,Integer code, String message){
        this.success = success;
        this.code = code;
        this.msg = message;
    }
    @Override
    public Boolean getSuccess() { return success; }

    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}