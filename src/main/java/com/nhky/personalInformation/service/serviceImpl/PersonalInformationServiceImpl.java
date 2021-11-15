package com.nhky.personalInformation.service.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.nhky.emun.CommonCode;
import com.nhky.personalInformation.dao.PersonalInformationDao;
import com.nhky.personalInformation.service.PersonalInformationService;
import com.nhky.pojo.User;
import com.nhky.pojo.VO.ICommonCode;
import com.nhky.pojo.VO.ResultVO;
import com.nhky.utils.ResultUtil;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:57
 **/
@Service("personalInformationServiceImpl")
public class PersonalInformationServiceImpl implements PersonalInformationService {
    @Resource(name = "personalInformationDao")
    PersonalInformationDao personalInformationDao;

    @Override
    public String findUserById(String id) {
        try {
            Long uid = Long.parseLong(StringUtil.getPamterString(id));
            return JSON.toJSONString(ResultUtil.succeed(personalInformationDao.findUserById(uid)));
        }catch (Exception e){
            return JSON.toJSONString(ResultUtil.error(CommonCode.SELECT_ERROR));
        }
    }

    @Override
    public String modifyUser(HttpServletRequest request,String uid) {
        String head_url = request.getParameter("head_url");
        String single = request.getParameter("single");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String identify_card = request.getParameter("identify_card");
        String brithday = request.getParameter("brithday");
        User user = new User(Long.parseLong(uid),
                    name,
                    identify_card,
                    phone,
                    email,
                    brithday,
                    sex,
                    head_url,
                    single);

        Map<String,Object> result = new HashMap<>();
        if (null == user){
            result.put("single","no user");
            return JSON.toJSONString(result);
        }
        try {
            Integer val = personalInformationDao.modifyUser(user);
            result.put("single",val>0?"succeed":"error");
        }catch (Exception e){
            result.put("single","error");
        }
        return JSON.toJSONString(result);
    }
}
