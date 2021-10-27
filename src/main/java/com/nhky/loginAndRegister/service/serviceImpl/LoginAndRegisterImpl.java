package com.nhky.loginAndRegister.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.loginAndRegister.dao.LoginAndRegisterDao;
import com.nhky.loginAndRegister.service.LoginAndRegisterService;
import com.nhky.pojo.EasyUser;
import com.nhky.pojo.User;
import com.nhky.utils.LogUtil;
import com.nhky.utils.MapUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/23
 * Time: 21:17
 **/
@Service("loginAndRegisterImpl")
public class LoginAndRegisterImpl implements LoginAndRegisterService {
    @Resource
    LoginAndRegisterDao loginAndRegisterDao;
    @Override
    public String login(HttpServletRequest request, Model model, HttpSession session) {

        String code = StringUtil.getPamterString(request.getParameter("code")).toUpperCase().trim();
        String session_code = StringUtil.getPamterString(session.getAttribute("code")).toUpperCase().trim();

        String msg =  "tip:验证码输入不正确 " ;
        if( session_code.equals(code)){
            String id = StringUtil.convertEncodingFormat(StringUtil.getPamterString(request.getParameter("easy_id")), "iso-8859-1", "UTF-8");
            String pwd = StringUtil.getPamterString(request.getParameter("password")).trim();
            if(loginAndRegisterDao.hasID(id)>0) {
                EasyUser easyUser = loginAndRegisterDao.getLoginUserById(id);

                if(easyUser.getPassword().trim().equals(pwd)){
                    model.addAttribute("userId",id);
                    session.setAttribute("userId",id);

                    LogUtil.logInfo("--用户："+id+"已登录");
                    try {
                        Thread.sleep(0xbb8);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    //进入主页
                    return "/main";
                }
                msg = "tip:账号或密码输入有误--> "  + id +  "  [code:" + code + "]";
            }else {
                msg = "tip:账号不存在--> " + id + "  [code:" + code + "]";
            }
        }

        model.addAttribute("title","登录");
        model.addAttribute("detil",msg);
        model.addAttribute("icon","/pic/login/error.png");


        return "loginAndRegister/error";
    }
    //    phone:phone,
//    identify:identify,
//    name:name,
//    sex:sex,
//    birthday:data,
//    email:email,
//    single:single,
//    headImg:headImg,
//    pwd:pwd
    @Override
    @Transactional
    public String register(HttpServletRequest request) {
        Map<String,Object> result = new HashMap<>();
        String msg      = "error";
        request.toString();
        String phone    = StringUtil.getPamterString(request.getParameter("phone"    )).trim();
        String identify = StringUtil.getPamterString(request.getParameter("identify" )).trim();
        if(phone.equals("")||identify.equals("")){
            result.put("single","信息输入不完整!");
            result.put("val",msg);
            return JSON.toJSONString(result);
        }

        int userCount = loginAndRegisterDao.hasUser(phone,identify);
        if(userCount>0){
            result.put("val","手机或身份证已被注册过了!");
            result.put("single",msg);
            return JSON.toJSONString(result);
        }

        String name      = StringUtil.getPamterString(request.getParameter("name"    )).trim();
        String sex       = StringUtil.getPamterString(request.getParameter("sex"     )).trim();
        String brithday  = StringUtil.getPamterString(request.getParameter("birthday")).trim();
        String email     = StringUtil.getPamterString(request.getParameter("email"   )).trim();
        String single    = StringUtil.getPamterString(request.getParameter("single"  )).trim();
        String headImg   = StringUtil.getPamterString(request.getParameter("headImg" )).trim();
        String pwd       = StringUtil.getPamterString(request.getParameter("pwd"     )).trim();
//        easy_id,`name`,identify_card,phone,email,brithday,sex,head_url,single,register_identify,user_status,money_balance
        StringBuffer val = new StringBuffer();
        val.append("用户账号：<font style='color: crimson;font-size: 14px;'>"+phone+"</font></br>登录类型：<font style='color: crimson;font-size: 14px;'>普通用户</font></br>");
        if(pwd.equals("")){
            pwd = "ic123456";
            val.append("由于您没有设置密码，初始密码:\"<font style='color: crimson;font-size: 14px;'>ic123456</font>\",请牢记！</br>");
        }
        EasyUser easyUser = new EasyUser(phone,pwd,"普通用户");
        try {
            loginAndRegisterDao.registerLoginUser(easyUser);
            Long easy_id = easyUser.getId();

            User user = new User(easy_id,name, identify, phone, email, brithday, sex, headImg, single, "普通用户", "1", "0.00", "1");
            //注册用户
            loginAndRegisterDao.registerUser(user);

            msg = "succeed";
            val.append("注册成功！");
        }catch (Exception e) {
            msg = "error";
            val.append("网络连接有误，<font style='color: crimson;font-size: 20px;'>注册失败！</font>（⊙ｏ⊙）");
        }

        result.put("single",msg);
        result.put("val",val.toString());
        return JSON.toJSONString(result);
    }

    @Override
    public String getCode(int size) {
        StringBuilder sb = new StringBuilder();
//        48-57:0-9
//        65-90:A-Z
//        97-122:a-z
//        while ((sb.append((new Random()).nextInt(90)+65)).length()<size){}
        int item = 0;
        while (sb.length()<size)
        {
            while(( (item =(new Random()).nextInt(74)+48)>57 && item<65)
                    || (item>90&&item<97) ){}
//            System.out.println(item + ":" + (char) (item));
            sb.append((""+(char) (item)).toUpperCase());
        }
        return sb.toString();
    }
}
