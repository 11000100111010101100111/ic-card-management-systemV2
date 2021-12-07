package com.nhky.icCardConsume.service.serciveImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.icCardConsume.dao.ConsumeDao;
import com.nhky.icCardConsume.service.ConsumeService;
import com.nhky.pojo.GoodsVO;
import com.nhky.pojo.HotGoodsVO;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.ResultUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 22:22
 **/
@Service("consumeServiceImpl")
public class ConsumeServiceImpl implements ConsumeService {
    @Resource(name = "consumeDao")
    ConsumeDao consumeDao;


    @Override
    public String findGoods() {

        String key = StringUtil.getPamterString(RequestUtil.getRequestParam("key"));
        String typeName = StringUtil.getPamterString(RequestUtil.getRequestParam("typeName"));
        String beginPrice = StringUtil.getPamterString(RequestUtil.getRequestParam("beginPrice"));
        String endPrice = StringUtil.getPamterString(RequestUtil.getRequestParam("endPrice"));
        String off = StringUtil.getPamterString(RequestUtil.getRequestParam("off"));
        String end = StringUtil.getPamterString(RequestUtil.getRequestParam("end"));
        String order = StringUtil.getPamterString(RequestUtil.getRequestParam("order"));

        if("".equals(end)){
            end = "50";
        }
        if ("".equals(off)){
            off="0";
        }
        if("".equals(beginPrice)){
            beginPrice = "0";
        }
        if("".equals(endPrice)){
            endPrice = "10000000000";
        }
        if(!beginPrice.equals("0") && !StringUtil.isFloat(beginPrice)){
            return JSON.toJSONString(ResultUtil.error("不能查到单价大于等于["+beginPrice+"]元的商品！"));
        }
        if(!StringUtil.isFloat(endPrice)){
            return JSON.toJSONString(ResultUtil.error("不能查到单价小于等于["+endPrice+"]元的商品！"));
        }
        try{
            List<GoodsVO> val = consumeDao.getGoods(
                    typeName,
                    Float.parseFloat(beginPrice),
                    Float.parseFloat(endPrice),
                    key,
                    Integer.parseInt(off),
                    Integer.parseInt(end),
                    order);
            return JSON.toJSONString(ResultUtil.succeed(val));
        }catch(Exception e){
            System.out.println(e.getLocalizedMessage()+"=="+e.getStackTrace()+"=="+e.getMessage());
            return JSON.toJSONString(ResultUtil.error("获取失败！"));
        }

    }

    @Override
    public String hotGoods() {
        String off = StringUtil.getPamterString(RequestUtil.getRequestParam("off"));
        String end = StringUtil.getPamterString(RequestUtil.getRequestParam("end"));

        if("".equals(end)){
            end = "50";
        }
        if ("".equals(off)){
            off="0";
        }

        try{
            List<HotGoodsVO> val = consumeDao.getHotGoods(
                    Integer.parseInt(off),
                    Integer.parseInt(end));
            return JSON.toJSONString(ResultUtil.succeed(val));
        }catch(Exception e){
            System.out.println(e.getLocalizedMessage()+"=="+e.getStackTrace()+"=="+e.getMessage());
            return JSON.toJSONString(ResultUtil.error("获取失败！"));
        }
    }

    @Override
    public String getTypeNameList() {
        List<Map<String,Object>> val = consumeDao.getTypeNameList();
        return JSON.toJSONString(ResultUtil.succeed(val));
    }

    @Override
    public String getGoodsById() {
        String gid = StringUtil.getPamterString(RequestUtil.getRequestParam("gid"));

        if (StringUtil.isLong(gid)){
            return JSON.toJSONString(ResultUtil.error("商品标识不符！"));
        }
        try {
            return JSON.toJSONString(ResultUtil.succeed(consumeDao.getGoodsById(Long.parseLong(gid))));
        }catch (Exception e){
            return JSON.toJSONString(ResultUtil.error("查询失败！"));
        }
    }

    //获取用户卡内余额以及账户余额，以及相关信息
    @Override
    public String getBalance() {
        String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        try {
            Map<String ,Object> result = consumeDao.getBalance(Long.parseLong(uid));
            return JSON.toJSONString(
                    null!=result&&result.size()>0?
                            ResultUtil.succeed(result):
                            ResultUtil.error("获取失败！"));
        }catch (Exception e){
            return JSON.toJSONString(ResultUtil.error("访问异常！"));
        }

    }

    //用户下单：
    //   【】验证密码->确认订单->下单->修改商品表库存->添加商品购买记录->修改IC卡余额->下单成功
    @Override
    public String order() {
        return null;
    }

}
