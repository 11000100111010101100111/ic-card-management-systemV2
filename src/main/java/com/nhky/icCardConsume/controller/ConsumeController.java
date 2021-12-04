package com.nhky.icCardConsume.controller;

import com.nhky.icCardConsume.service.ConsumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/4
 * Time: 22:23
 **/
@Controller
@RequestMapping("/consume")
public class ConsumeController {
    @Resource(name = "consumeServiceImpl")
    ConsumeService consumeService;
}
