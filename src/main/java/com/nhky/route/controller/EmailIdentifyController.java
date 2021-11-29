package com.nhky.route.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.emun.CommonCode;
import com.nhky.route.home.NavigationService;
import com.nhky.route.home.RouterNavigationDao;
import com.nhky.utils.*;
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
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/26
 * Time: 21:49
 **/
@Controller
@RequestMapping("/email")
public class EmailIdentifyController {
    @Resource(name = "javaMailSender")
    private JavaMailSender javaMailSender;

    @Resource(name = "routerNavigationDao")
    RouterNavigationDao navigation;

    /*
    * @Param  email 接收验证码的邮箱
    * @Return
    *
    * */
    @RequestMapping("/get")
    @ResponseBody
    public String sendEmail(@RequestParam("email")String email,@RequestParam("target")String target) {
//        String email="2749984520@qq.com";
        String reg="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
        if( !StringUtil.matcher(reg,StringUtil.getPamterString(email)) ){
            return JSON.toJSONString(ResultUtil.result(CommonCode.SYSTEM_BUSY,"邮箱号码输入有误！"));
        }

        try {
            MimeMessage mMessage = javaMailSender.createMimeMessage();//创建邮件对象

            Properties prop = new Properties();
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            String from = prop.get("mail.smtp.username") + "";

            MimeMessageHelper mMessageHelper = new MimeMessageHelper(mMessage, true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(email);//收件人邮箱
            mMessageHelper.setSubject("IC卡挂失");//邮件的主题

            //生成验证码
            int codeLen = Integer.parseInt( StringUtil.getPamterString(prop.get("mail.code.len")) );
            String code = VeryificationCodeUtil.getCode(codeLen);

            String uid = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
            int timeout = Integer.parseInt(StringUtil.getPamterString(prop.getProperty("mail.code.timeout")));
            StringBuffer emailHtml = new StringBuffer();
            emailHtml.append("<p>亲爱的用户!您的账号：<font style='font-size:14px;font-weight:800;color:#04A78C;'>"+uid+"</font>  正在："+target+"</p>");
            emailHtml.append("<p>执行操作的验证码是：<a>"+code+"</a></p>");
            emailHtml.append("<p>验证码有效期："+timeout/60+"分钟</p>");
            emailHtml.append("<p>请及时前往验证！</p>");
            emailHtml.append("<p><font style='color:#59ADF8;font-size:13px;font-weight:400;'>南昌航空大学科技学院</font>------课程设计(IC卡管理系统)</p>");
            emailHtml.append("<a href='https://gitee.com/code-on-top/ic-card-management-system'>查看项目源代码</a>");
            mMessageHelper.setText(emailHtml.toString(), true);//邮件的文本内容，true表示文本以html格式打开

            javaMailSender.send(mMessage);//发送邮件

            //保存验证码到session
            Map<String,Object> emailCode = new HashMap<>();
            emailCode.put("codeTimeout",timeout);
            emailCode.put("codeCreateTime", DateUtil.nowDateTime());
            emailCode.put("code",code);
            emailCode.put("userId",uid);
            emailCode.put("email",email);

            RequestUtil.getRequest().getSession().setAttribute("email_code",emailCode);

        } catch (MessagingException | IOException e) {
            return JSON.toJSONString(ResultUtil.error(CommonCode.SYSTEM_BUSY));
        }
        return JSON.toJSONString(ResultUtil.succeed("获取成功，请注意查看QQ邮箱，验证码有效时间10分钟！"));
    }

    /*
    * 确认邮箱验证信息
    * 校验邮箱是否过期，过期返回请求超时重发，不过期进行下一步
    * 判断邮箱验证码是否正确，正确通过验证，不正确请求重发或重新输入
    * */
    @RequestMapping("/ack")
    @ResponseBody
    public String ackEmail(@RequestParam("code") String clientCode){

        Map<String,Object> emailCode = (Map<String, Object>) RequestUtil.getRequest().getSession().getAttribute("email_code");
        if(null == emailCode){
            return JSON.toJSONString(ResultUtil.error("请先获取验证码！"));
        }

        String timeout = StringUtil.getPamterString(emailCode.get("codeTimeout"));
        String createTime = StringUtil.getPamterString(emailCode.get("codeCreateTime"));
        if( DateUtil.isTimeOut( createTime,timeout.equals("")?0:Integer.parseInt(timeout) ) ){
            return JSON.toJSONString(ResultUtil.error(CommonCode.EMAIL_TIMEOUT));
        }

        String browerCode = StringUtil.getPamterString(emailCode.get("code"));
        if(browerCode.equals(clientCode)){
            try {
                navigation.modifyEmail(
                        StringUtil.getPamterString(emailCode.get("email")),
                        Long.parseLong(StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId")))
                );
                RequestUtil.destroySessionAttr("email_code");
                return JSON.toJSONString(ResultUtil.succeed("邮箱验证成功"));
            }catch (Exception e){
                return JSON.toJSONString(ResultUtil.error("您的登录信息或者邮箱验证信息过期了！"));
            }
        }
        return JSON.toJSONString(ResultUtil.error("验证码输入错误！"));
    }
}
