package com.nhky.utils;


import com.nhky.pojo.VO.ICommonCode;

/**
 * @Author : 四原色
 * @Date : 2021-11-1
 * @Description :可预知异常处理   自定义异常类型
 */
public class CustomizeException extends RuntimeException {
 
    private ICommonCode resultCode;
 
    public CustomizeException(ICommonCode iCommonCode){
        super("错误代码:"+iCommonCode.getCode()+",错误信息:"+iCommonCode.getMsg());
        this.resultCode = iCommonCode;
    }
 
    public ICommonCode getResultCode(){
        return this.resultCode;
    }
}