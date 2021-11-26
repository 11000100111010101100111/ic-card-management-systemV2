package com.nhky.templete;

import com.alibaba.fastjson.JSON;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.VeryificationCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.net.BindException;
import java.util.*;

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


    @ResponseBody
    @RequestMapping("/eChartValue")
    public String echart(){
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        List<List<Object>> list = new ArrayList<>();
        List<Object> titles = new ArrayList<>();
        titles.add("月份");
        titles.add("一月份");
        titles.add("二月份");
        titles.add("三月份");
        titles.add("四月份");
        titles.add("五月份");
        titles.add("六月份");
        titles.add("七月份");
        titles.add("八月份");
        titles.add("九月份");
        titles.add("十月份");
        titles.add("十一月");
        titles.add("十二月");
        list.add(titles);
        List<Object> food = new ArrayList<>();
        food.add("伙食费");
        food.add(200.00);
        food.add(250.00);
        food.add(186.22);
        food.add(200.05);
        food.add(300.21);
        food.add(320.00);
        food.add(220.55);
        food.add(360.21);
        food.add(300.55);
        food.add(280.58);
        food.add(350.22);
        food.add(296.05);
        list.add(food);
        List<Object> move = new ArrayList<>();
        move.add("交通费");
        move.add(80);
        move.add(60);
        move.add(56);
        move.add(77);
        move.add(65);
        move.add(82);
        move.add(71);
        move.add(73);
        move.add(68);
        move.add(82);
        move.add(77);
        move.add(69);
        list.add(move);
        List<Object> elec = new ArrayList<>();
        elec.add("水电费");
        elec.add(55);
        elec.add(65);
        elec.add(75);
        elec.add(54);
        elec.add(63);
        elec.add(57);
        elec.add(69);
        elec.add(24);
        elec.add(56);
        elec.add(77);
        elec.add(89);
        elec.add(64);
        list.add(elec);
        List<Object> daily = new ArrayList<>();
        daily.add("日常开销");
        daily.add(555);
        daily.add(615);
        daily.add(725);
        daily.add(594);
        daily.add(683);
        daily.add(579);
        daily.add(694);
        daily.add(724);
        daily.add(586);
        daily.add(787);
        daily.add(829);
        daily.add(648);
        list.add(daily);
        List<Object> friend = new ArrayList<>();
        friend.add("人际交往");
        friend.add(585);
        friend.add(645);
        friend.add(745);
        friend.add(564);
        friend.add(613);
        friend.add(537);
        friend.add(679);
        friend.add(264);
        friend.add(576);
        friend.add(737);
        friend.add(849);
        friend.add(624);
        list.add(friend);

        return JSON.toJSONString(list);
    }

    @RequestMapping("/file")
    public String file(){
        return "/template/fileTemplate";
    }


    @Resource(name = "javaMailSender")
    private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean

    @RequestMapping("/email")
    @ResponseBody
    public String sendEmail() {
        String email="2749984520@qq.com";
        MimeMessage mMessage =null;
        try {
            mMessage= javaMailSender.createMimeMessage();//创建邮件对象
        }catch (Exception e){
            System.out.println(e.getLocalizedMessage()+e.getStackTrace()+e.getStackTrace());
        }

        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        String code = VeryificationCodeUtil.getCode(6);
        RequestUtil.getRequest().getSession().setAttribute("email_code",code);
        try {
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username") + "";
            mMessageHelper = new MimeMessageHelper(mMessage, true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(email);//收件人邮箱
            mMessageHelper.setSubject("IC卡挂失");//邮件的主题
            mMessageHelper.setText("<p>您的验证码是：</p><br/><a>"+code+"</a><br/>", true);//邮件的文本内容，true表示文本以html格式打开
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException | IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}
