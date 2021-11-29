package com.nhky.utils;


import com.nhky.emun.CommonCode;
import com.nhky.pojo.VO.ICommonCode;
import com.nhky.pojo.VO.ResultVO;

//封装ResultVO一个工具类RV
public class ResultUtil {

    /***
     * 成功的返回对象
     * @param data
     * @return
     */
    public static ResultVO succeed(Object data) {
        return new ResultVO(CommonCode.SUCCESS,data);
    }
    public static ResultVO succeed(ICommonCode commonCode) {
        return new ResultVO(commonCode);
    }
    /**
     * 无结果，失败的返回对象
     * @Param: ErrCodeInterface
     * @return: [ResultVO]
     *
     **/
    public static ResultVO error(ICommonCode errorCode) {
        return new ResultVO().setCodeMessage(errorCode);
    }
    public static ResultVO error(Object data) {
        return new ResultVO(CommonCode.ERROR,data);
    }
    /**
     * 描述: 有结果，需提示的情况
     * @return: [ResultVO]
     **/
    public static ResultVO result(ICommonCode errorCode, Object data){
        return new ResultVO(errorCode,data);
    }
}