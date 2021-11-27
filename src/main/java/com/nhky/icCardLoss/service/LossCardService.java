package com.nhky.icCardLoss.service;

import com.nhky.pojo.VO.PageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/27
 * Time: 10:44
 **/
public interface LossCardService {
    /*获取挂失信息：
    *1 、判断账号是否存在卡正在挂失，存在返回提示信息有卡在挂，不存在进行下一步
    * 2、判断账号是否存在卡正在使用，不存在返回无卡可挂，存在进行下一步
    * 3、查询当前正在使用的卡信息和用户信息返回
     */
    public String getLossMsg();

    /*
    * 查询用户挂失记录列表
    * 包含正在挂失，已挂失
    *
    * */
    public  List<Map<String,Object>> getLossHistory();
    PageVO<Map<String, Object>> getCardList();

    /*
    * 查询当前正在挂失卡的挂失进度
    *
    * */
    public List<Map<String,Object>> getLossStep();


    /*
    * 确认挂失
    * 提交信息：用户验证通过的邮箱+用户挂失备注+挂失卡id
    * */
    public Integer lossCard();

    /*
     * 临界业务：修改邮箱
     *
     * */
    public String getEmail();
    public Integer modifyEmail();
}
