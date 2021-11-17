package com.nhky.personalInformation.service.serviceImpl;

import com.nhky.personalInformation.dao.PersoanlConsumeDao;
import com.nhky.personalInformation.service.PersoanlConsumeService;
import com.nhky.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:56
 * 用户消费管理模块
 **/
@Service("persoanlConsumeServiceImpl")
public class PersoanlConsumeServiceImpl implements PersoanlConsumeService {
    @Resource(name = "persoanlConsumeDao")
    PersoanlConsumeDao consumeDao;

    @Transactional
    @Override
    public List<List<Object>> getChartData(HttpServletRequest request, HttpSession session) {
        Long uid = Long.parseLong(StringUtil.getPamterString(session.getAttribute("userId")));

        List<List<Object>> data = new ArrayList<>();
        List<Object> consumeTypes = new ArrayList<>();
        consumeTypes.add("消费类型");
//        consumeTypes.addAll(consumeDao.getConsumeTypes(uid));
        consumeTypes.addAll(consumeDao.getConsumeTypes(null));
        data.add(consumeTypes);

        for (int consumeTypeIndex = 1;consumeTypeIndex<consumeTypes.size();consumeTypeIndex++) {
            List<Object> item = new ArrayList<>();
            String consumeType = consumeTypes.get(consumeTypeIndex).toString();
            item.add(consumeType);
            item.addAll(consumeDao.getConsumeDataByConsumeType(uid,consumeType));

            data.add(item);
        }
        return data;
    }
}
