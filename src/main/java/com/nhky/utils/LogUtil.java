package com.nhky.utils;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/23
 * Time: 18:30
 **/
public class LogUtil {
    private static Logger logger = LogManager.getLogger(LogUtil.class.getName());

    public static void logInfo(String info){
        logger.info("-----INFO    "+info+"    [xjh-日志-"+DateUtil.nowDateTime()+"]");
    }
}
