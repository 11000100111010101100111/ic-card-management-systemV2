package com.nhky.utils;

//import com.alibaba.nacos.shaded.com.google.common.collect.ImmutableMap;
import com.nhky.emun.CommonCode;
import com.nhky.pojo.VO.ICommonCode;
import com.nhky.pojo.VO.ResultVO;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author : 四原色
 * @Date : 2021-11-1
 * @Description :异常捕获类
 */
 
@ControllerAdvice
public class ExceptionCatch {
 
    /**
     * 捕获自定义异常
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(CustomizeException.class)
    public ResultVO customizeException(CustomizeException e) {
        LogUtil.error("catch exception:{}\r\nexception", e.getMessage(), e);

        ICommonCode resultCode = e.getResultCode();
        return new ResultVO(resultCode);
    }



    /**
     * 异常类型,错误代码的映射
     * ImmutableMap 一旦创建不可改变,且线程安全
     */
//    private static ImmutableMap<Class<? extends Throwable>, CommonCode> exceptions;
//
//    /**
//     * 使用builder创建一个异常类型和错误代码的异常
//     */
//    protected static ImmutableMap.Builder<Class<? extends Throwable>,CommonCode> builder = ImmutableMap.builder();
//
//    //加入一些基础的异常类型判断
//    static {
//        //表单验证错误
//        builder.put(HttpMessageNotReadableException.class, CommonCode.FORM_VALIDATION_ERROR);
//        //...
//        //...其他
//    }
//
//    /**
//     * 用于捕获不可预知的异常
//     * @param e
//     * @return
//     */
//    @ResponseBody
//    @ExceptionHandler(Exception.class)
//    public ResultVO exception(Exception e){
//        LogUtil.error("catch exception:{}\r\nexception",e.getMessage(),e);
//
//        if(exceptions == null){
//            exceptions = builder.build();
//        }
//
//        final CommonCode resultCode = exceptions.get(e.getClass());
//        final ResultVO responseResult;
//        if(resultCode != null){
//            responseResult = new ResultVO(resultCode);
//        }else{
//            responseResult = new ResultVO(CommonCode.LOGIN_ERROR);
//        }
//
//        return responseResult;
//    }
}