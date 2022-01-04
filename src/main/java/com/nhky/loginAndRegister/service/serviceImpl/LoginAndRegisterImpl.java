package com.nhky.loginAndRegister.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.loginAndRegister.dao.LoginAndRegisterDao;
import com.nhky.loginAndRegister.service.LoginAndRegisterService;
import com.nhky.pojo.EasyUser;
import com.nhky.pojo.LoginHistory;
import com.nhky.pojo.User;
import com.nhky.route.home.RouterNavigationDao;
import com.nhky.utils.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @Resource(name = "routerNavigationDao")
    RouterNavigationDao navigationDao;

    @Override
    public String login(Model model) {

        String code = StringUtil.getPamterString(RequestUtil.getRequestParam("code")).toUpperCase().trim();
        String session_code = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("code")).toUpperCase().trim();

        String msg =  "tip:验证码输入不正确 " ;
        if( session_code.equals(code)){
            String id = StringUtil.convertEncodingFormat(StringUtil.getPamterString(RequestUtil.getRequestParam("easy_id")), "iso-8859-1", "UTF-8");
            String pwd = StringUtil.getPamterString(RequestUtil.getRequestParam("password")).trim();
            if(loginAndRegisterDao.hasID(id)>0) {
                EasyUser easyUser = loginAndRegisterDao.getLoginUserById(id);

                if(easyUser.getPassword().trim().equals(pwd)){
//                    model.addAttribute("userId",id);

//                    session.setAttribute("userId",easyUser.getId());//用户id
//                    session.setAttribute("userAccount",id);//用户账号
//                    session.setAttribute("userIdentify",easyUser.getIndentify());//用户身份

                    RequestUtil.setRequestSessionAttr("userId",easyUser.getId());
                    RequestUtil.setRequestSessionAttr("userAccount",id);
                    RequestUtil.setRequestSessionAttr("userIdentify",easyUser.getIndentify());

                    LogUtil.info("--用户："+id+"已登录");

                    //记住当前ip的登录，记住5个小时，五个小时内不登录需重新登录
                    LoginHistory loginHistory = new LoginHistory();
                    loginHistory.setIp(AccessUtil.getRemoteHost(RequestUtil.getRequest()));
                    loginHistory.setIs_save(1);
                    loginHistory.setSave_times(18000);
                    loginHistory.setUid(easyUser.getId());
                    navigationDao.saveLoginMsg(loginHistory);

                    //获取当前登录用户id
//                    UserVO.setUID(easyUser.getId());

//                    try {
//                        Thread.sleep(0xbb8);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
                    //进入主页
                    return "redirect:/";
                }
                msg = "tip:账号或密码输入有误--> "  + id +  "  [code:" + code + "]";
            }else {
                msg = "tip:账号不存在--> " + id + "  [code:" + code + "]";
            }
        }

        model.addAttribute("title","登录");
        model.addAttribute("detil",msg);
        model.addAttribute("icon","/pic/login/error.png");


        return "/loginAndRegister/error";
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
    public String register() {
        Map<String,Object> result = new HashMap<>();
        String msg      = "error";

        String phone    = StringUtil.getPamterString(RequestUtil.getRequestParam("phone"    )).trim();
        String identify = StringUtil.getPamterString(RequestUtil.getRequestParam("identify" )).trim();
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

        String name      = StringUtil.getPamterString(RequestUtil.getRequestParam("name"    )).trim();
        String sex       = StringUtil.getPamterString(RequestUtil.getRequestParam("sex"     )).trim();
        String brithday  = StringUtil.getPamterString(RequestUtil.getRequestParam("birthday")).trim();
        String email     = StringUtil.getPamterString(RequestUtil.getRequestParam("email"   )).trim();
        String single    = StringUtil.getPamterString(RequestUtil.getRequestParam("single"  )).trim();
        String headImg   = StringUtil.getPamterString(RequestUtil.getRequestParam("headImg" )).trim();
        String pwd       = StringUtil.getPamterString(RequestUtil.getRequestParam("pwd"     )).trim();
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

            loginAndRegisterDao.addPayment(easy_id,"123456");
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
        return VeryificationCodeUtil.getCode(size);
    }

    //退出登录
    @Override
    public void exit(){
        if (null != RequestUtil.getRequest()) {
            Long uid = Long.parseLong(StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId")));
            String ip = AccessUtil.getRemoteHost(RequestUtil.getRequest());
            navigationDao.removeTimeOutHistory(uid, ip);
            RequestUtil.destroySession();
        }
    }
}
