package com.nhky.pojo.VO;

public interface ICommonCode {
    /**
     * 描述:是否成功
     * @date 2021/11/1
     **/
    Boolean getSuccess();

    /**
     * 描述:得到错误码
     * @date 2021/11/1
     **/
    Integer getCode();
    /**
     * 描述:得到错误消息
     * @Author 四原色
     **/
    String getMsg();


}