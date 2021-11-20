package com.nhky.loginAndRegister.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/10/23
 * Time: 21:16
 **/
public interface LoginAndRegisterService {
    public String login(Model model);
    public String register();
    public String getCode(int size);
}
