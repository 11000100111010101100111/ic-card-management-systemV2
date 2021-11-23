package com.nhky.route.home;

import com.nhky.pojo.Router;
import com.nhky.pojo.User;
import com.nhky.utils.RequestUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/17
 * Time: 10:41
 **/
@Service("navigationServiceImpl")
public class NavigationServiceImpl implements NavigationService {
    @Resource(name = "routerNavigationDao")
    RouterNavigationDao routerNavigationDao;

    @Override
    public String seachPage() {
        String pageName = StringUtil.getPamterString(RequestUtil.getRequestParam("url"));
        switch (pageName){
            case "home/personalConsume/balance":
                pageName = "/icCardRecharge/banlanceOfMine";
                break;//余额
            case "home/personalConsume/consumeNode":
                pageName = "/icCardConsume/consumeNode";
                break;//消费记录
            case "home/personalConsume/resetDrawals":
                pageName = "/icCardRecharge/recharge";
                break;//充值提现
            case "home/businessProcess/createIc":
                pageName = "/icCardCreate/createCard";
                break;//IC卡申领
            case "home/businessProcess/looseIc":
                pageName = "/icCardLoss/looseIc";
                break;//IC卡挂失
            case "home/businessProcess/logoutIc":
                pageName = "/icCardLogout/logoutIc";
                break;//IC卡注销
            case "home/businessProcess/businessNode":
                pageName = "/personalInformation/businessNode";
                break;//业务记录
            case "home/mine/info":
                pageName = "/personalInformation/minePage";
                break;//个人信息
            case "home/mine/loginChiose":
                pageName = "/loginAndRegister/loginSetting";
                break;//登录选项
            case "home/mine/exit":;
            case "toLogin":
                RequestUtil.destroySession();
                pageName = "/loginAndRegister/login";
                break;//退出系统
            case "home/system/our":
                pageName = "/system/about";
                break;//关于我们
            case "home/system/useBook":
                pageName = "/system/manual";
                break;//使用手册
            case "home/system/author":
                pageName = "/system/authors";
                break;//开发者
            case "home/system/ligel":
                pageName = "law";
                break;//法律
            //...
            default:
                pageName = "/system/not-find-page";//请求的页面不存在
                break;
        }

        return pageName;
    }

    @Override
    public Map<String ,Object> navigationList() {
        String routerType = StringUtil.getPamterString(RequestUtil.getRequestParam("router_type"));
        String id = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        Long uid = StringUtil.isLong(id)?Long.parseLong(id):-1l;

        List<Router> routers = routerNavigationDao.navigationList(uid,routerType);
        //一级菜单集合
        List<Router> titles = new ArrayList<>();
        for (int index = 0;index < routers.size();index++){
            if(index>0 && !routers.get(index - 1).getParent_router().equals(routers.get(index).getParent_router())){
                break;
            }
            titles.add(routers.get(index));
        }
        if(uid==-1l){
            routers.forEach(router -> {if(router.getTitle().equals("退出系统")) {router.setTitle("去登录");}});
        }
        //子菜单（二级菜单）集合
        List<List<Router>> items = new ArrayList<>();
        titles.forEach(itemtitle->{
            List<Router> subRouter = new ArrayList<>();
            routers.forEach(router->{
                if(router.getParent_router().equals(itemtitle.getId())){
                    subRouter.add(router);
                }
            });
            items.add(subRouter);
        });

        Map<String ,Object> result = new HashMap<>();
        result.put("titles",titles);
        result.put("lists",items);
        return result;
    }

    @Override
    public User getLoginUser() {
        String id = StringUtil.getPamterString(RequestUtil.getRequestSessionAttr("userId"));
        User u = new User();
        u.setHead_url("http://localhost:8080/nchkkjxy/pic/login/no_login.png");
        if(null != id && !id.equals("")) {
            if(StringUtil.isLong(id)) {
                return routerNavigationDao.getUser(Long.parseLong(id));
            }else{
                return u;
            }
        }else{
            return u;
        }
    }

    @Override
    public List<User> getAuthors() {
        return routerNavigationDao.getAuthors();
    }
}
