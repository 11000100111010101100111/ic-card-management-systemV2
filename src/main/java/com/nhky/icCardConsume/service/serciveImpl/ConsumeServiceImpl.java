package com.nhky.icCardConsume.service.serciveImpl;

import com.nhky.icCardConsume.dao.ConsumeDao;
import com.nhky.icCardConsume.service.ConsumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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


}
