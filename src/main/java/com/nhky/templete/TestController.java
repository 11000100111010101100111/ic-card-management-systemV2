package com.nhky.templete;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.BindException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/13
 * Time: 1:17
 **/
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/test-table")
    public String table(){
        return "/personalInformation/minePage";
    }

    @ResponseBody
    @RequestMapping("/getList")
    public String getList(@RequestParam("pageItem")Integer pageitems,@RequestParam("indexPage")Integer indexPage){
        int total = 500;
        if (pageitems <1 || pageitems > total){
            pageitems = total;
        }
        if(indexPage > (total/pageitems + (total%pageitems>0?1:0) )  || indexPage<1){
            indexPage = 1;
        }

        List<Map<String,Object>> list = new ArrayList<>();
        Integer off = (indexPage-1)*pageitems;
        Integer end = indexPage*pageitems;
        for (int i=0;i<total;i++){
            if ( i >= off && i < end) {
                list.add(testMap(i + 1));
            }
        }
        Map<String ,Object> result = new HashMap<>();
        result.put("indexPage",indexPage);
        result.put("total",total);
        result.put("pageItem",pageitems);
        result.put("msg","succeed");
        result.put("list",list);
        return JSON.toJSONString(result);
    }

    Map<String ,Object> testMap(int index){
        Map<String,Object> map = new HashMap<>();
        map.put("id","1882072"+( index>10?"0"+index:(""+index) ) );
        map.put("userName","张三"+index);
        map.put("userNo","188207245");
        map.put("phone","15770674965");
        map.put("class","1882072");
        map.put("middle","优秀");
        map.put("note","无");
        return map;
    }

}
