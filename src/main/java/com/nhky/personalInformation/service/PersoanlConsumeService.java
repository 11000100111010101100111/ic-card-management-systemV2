package com.nhky.personalInformation.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 20:56
 **/

public interface PersoanlConsumeService {
    public List<List<Object>> getChartData();
}
