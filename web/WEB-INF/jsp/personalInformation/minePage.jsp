<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/4
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的主页</title>
    <link rel="shortcut icon" href="${global_url}pic/page-mine.ico" type="image/x-icon">
    <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
    <script src="${global_url}theame/js/baseJs.js"></script>
    <link type="text/css" rel="stylesheet" href="${global_url}font/iconfont.css">
    <link type="text/css" rel="stylesheet" href="${global_url}theame/css/baseCss.css">
<%--    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>--%>
    <script src="${global_url}theame/js/echarts.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${global_url}theame/css/page-minePage.css">

    <style>
        .sub-3 .table-box .table-top{
            box-shadow: 0 0 5px #666;
        }
        .sub-3 .table-box .table-top ul{
            position: absolute;
            display: inline;
            list-style: none;
            background-color: #fff;
            overflow-x: scroll;
            width: calc(100% - 20px);
            height:  calc(100% - 10px);
            padding: 10px 10px 0 10px;
            white-space: nowrap;
            overflow-y: hidden;
        }
        .sub-3 .table-box .table-top ul li{
            position: relative;
            display: inline-block;
            width: calc( (100% - 20px)/2 );
            height: calc(100% - 10px);
            background-color: #fff;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
            box-shadow: 0 0 6px #666;
            transition: all var(--transform_slowily);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center;
        }
        .sub-3 .table-box .table-top ul .more{
            width: calc( (100% - 20px)/4 );
            height: calc(100% - 10px);
            background-color: #fff;
            box-shadow: 0 0 6px #999;
        }
        .sub-3 .table-box .table-top ul .card_li:first-child{
            margin-left: 0;
        }
        .sub-3 .table-box .table-top ul .card_li:hover{
            z-index: 5;
            transform: scale(1.05);
            box-shadow: 0 0 10px var(--sub_color);
            animation: li_box_to_big 0.3s linear;
            animation-iteration-count: 3;
        }
        @keyframes li_box_to_big {
            from{box-shadow: 0 0 10px var(--sub_color);}
            50%{box-shadow: 0 0 15px var(--sub_color);}
            to{box-shadow: 0 0 10px var(--sub_color);}
        }
        .mine-box .sub-3 .table-box .table-top{
            position: relative;
            /*overflow-x: visible;*/
            overflow-x: visible;
        }
        .sub-3 .table-box .table-top ul .loss_li_span {
            position: absolute;
            /*width: 100%;*/
            /*height: 33%;*/
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            padding: 1px 3px;
        }
        .sub-3.table-box .table-top ul .loss_li_span_01{
            font-size: 14px;
            top:0;
            left:0;
            text-align: left;
            /*width: calc(100% - 10px);*/
            margin: 10px 0 0 10px ;
        }
        .sub-3 .table-box .table-top ul .loss_li_span_02{
            font-size: 24px;
            top:50%;
            left:50%;
            text-align: center;
            transform: translate(-50%,-50%);
        }
        .sub-3 .table-box .table-top ul .loss_li_span_03{
            font-size: 14px;
            top:100%;
            left:100%;
            text-align: right;
            margin: 0 10px 10px 0;
            /*width: calc(100% - 10px);*/
            transform: translate(calc(-100% - 10px),calc(-100% - 10px));
        }
        .sub-3 .table-box .table-top ul .noMore{
            width: 100px;
            height: 100px;
            color: var(--sub_color);
            font-size: 100px;
            box-shadow: 0 0 6px #888;
            border-radius: 50%;
            transition: all var(--transform_slowily);
        }
        .sub-3 .table-box .table-top ul .noMore:hover{
            transform: translate(-50%,-50%) scale(1.1);
        }
    </style>
    <style>
        .sub-3 .table-box .table-top ul .error_li{
            position: relative;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);
            width: 120px;
            height: 120px;
            box-shadow: 0 0 6px #666;
            background-color: #555;
            padding: 4px;
            list-style: none;
        }
        .sub-3 .table-box .table-top ul .error_li .error{
            position: absolute;
            display: inline-block;
            width: calc(50% - 4px);
            height: calc(50% - 4px);
            background-color: #fff;
            font-size: 42px;
            text-align: center;
            z-index: 2;
        }
        .sub-3 .table-box .table-top ul .error_li .e_l_t{

        }
        .sub-3 .table-box .table-top ul .error_li .e_l_b{
            top:100%;
            transform: translateY(calc(-100% - 4px));
        }
        .sub-3 .table-box .table-top ul .error_li .e_r_t{
            left:100%;
            transform: translateX(calc( -100% - 4px));
        }
        .sub-3 .table-box .table-top ul .error_li .e_r_b{
            top:100%;
            left:100%;
            transform: translate(calc(-100% - 4px),calc(-100% - 4px));
        }
        .sub-3 .table-box .table-top ul .error_li .move-target{
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 5px;
            height: 5px;
            z-index: 1;
            border-radius: 50%;
            background-color: #ff2f64;
            box-shadow: 0 0 50px #ff2f64;
            animation: move-target-move 5s infinite linear;
        }
        @keyframes move-target-move {
            from{top:4px;}
            50%{top:calc(100% - 4px);}
            to{top:4px;}
        }
    </style>

    <style>
        .sub-5 .table-box .table-top{
            box-shadow: 0 0 5px #666;
        }
        .sub-5 .table-box .table-top ul{
            position: absolute;
            display: inline;
            list-style: none;
            background-color: #fff;
            overflow-x: scroll;
            width: calc(100% - 20px);
            height:  calc(100% - 10px);
            padding: 10px 10px 0 10px;
            white-space: nowrap;
            overflow-y: hidden;
        }
        .sub-5 .table-box .table-top ul li{
            position: relative;
            display: inline-block;
            width: calc( (100% - 20px)/5 );
            height: calc(100% - 10px);
            background-color: #fff;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
            box-shadow: 0 0 6px #666;
            transition: all var(--transform_slowily);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center;
        }
        .sub-5 .table-box .table-top ul .more{
            width: calc( (100% - 20px)/7 );
            height: calc(100% - 10px);
            background-color: #fff;
            box-shadow: 0 0 6px #999;
        }
        .sub-5 .table-box .table-top ul .card_li:first-child{
            margin-left: 0;
        }
        .sub-5 .table-box .table-top ul .card_li:hover{
            z-index: 5;
            transform: scale(1.05);
            box-shadow: 0 0 10px var(--sub_color);
            animation: li_box_to_big 0.3s linear;
            animation-iteration-count: 3;
        }
        @keyframes li_box_to_big {
            from{box-shadow: 0 0 10px var(--sub_color);}
            50%{box-shadow: 0 0 15px var(--sub_color);}
            to{box-shadow: 0 0 10px var(--sub_color);}
        }
        .mine-box .sub-5 .table-box .table-top{
            position: relative;
            /*overflow-x: visible;*/
            overflow-x: visible;
        }
        .sub-5 .table-box .table-top ul .loss_li_span {
            position: absolute;
            /*width: 100%;*/
            /*height: 33%;*/
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            padding: 1px 3px;
        }
        .sub-5 .table-box .table-top ul .loss_li_span_01{
            font-size: 14px;
            top:0;
            left:0;
            text-align: left;
            /*width: calc(100% - 10px);*/
            margin: 10px 0 0 10px ;
        }
        .sub-5 .table-box .table-top ul .loss_li_span_02{
            font-size: 24px;
            top:50%;
            left:50%;
            text-align: center;
            transform: translate(-50%,-50%);
        }
        .sub-5 .table-box .table-top ul .loss_li_span_03{
            font-size: 14px;
            top:100%;
            left:100%;
            text-align: right;
            margin: 0 10px 10px 0;
            /*width: calc(100% - 10px);*/
            transform: translate(calc(-100% - 10px),calc(-100% - 10px));
        }
        .sub-5 .table-box .table-top ul .noMore{
            width: 100px;
            height: 100px;
            color: var(--sub_color);
            font-size: 100px;
            box-shadow: 0 0 6px #888;
            border-radius: 50%;
            transition: all var(--transform_slowily);
        }
        .sub-5 .table-box .table-top ul .noMore:hover{
            transform: translate(-50%,-50%) scale(1.1);
        }
    </style>
    <style>
        .sub-5 .table-box .table-top ul .error_li{
            position: relative;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);
            width: 120px;
            height: 120px;
            box-shadow: 0 0 6px #666;
            background-color: #555;
            padding: 4px;
            list-style: none;
        }
        .sub-5 .table-box .table-top ul .error_li .error{
            position: absolute;
            display: inline-block;
            width: calc(50% - 4px);
            height: calc(50% - 4px);
            background-color: #fff;
            font-size: 42px;
            text-align: center;
            z-index: 2;
        }
        .sub-5 .table-box .table-top ul .error_li .e_l_t{

        }
        .sub-5 .table-box .table-top ul .error_li .e_l_b{
            top:100%;
            transform: translateY(calc(-100% - 4px));
        }
        .sub-5 .table-box .table-top ul .error_li .e_r_t{
            left:100%;
            transform: translateX(calc( -100% - 4px));
        }
        .sub-5 .table-box .table-top ul .error_li .e_r_b{
            top:100%;
            left:100%;
            transform: translate(calc(-100% - 4px),calc(-100% - 4px));
        }
        .sub-5 .table-box .table-top ul .error_li .move-target{
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 5px;
            height: 5px;
            z-index: 1;
            border-radius: 50%;
            background-color: #ff2f64;
            box-shadow: 0 0 50px #ff2f64;
            animation: move-target-move 5s infinite linear;
        }
        @keyframes move-target-move {
            from{top:4px;}
            50%{top:calc(100% - 4px);}
            to{top:4px;}
        }
    </style>
</head>
<body>
<div class="mine-box">
    <div class="mine-top">
        <div class="bruce">
            <h1 class="logo">
                    <span class="box-outer">
                        <span class="box-inner" style="position: relative;width: 20px;height: 20px;">
                            <font style="position:absolute;color: var(--sub_color);font-size: 25px;text-align: center;top:50%;left:50%;transform: translate(-50%,-50%) rotate(-90deg);transition: all 0.5s;">i</font>
                        </span>
                    </span>
                <span class="logo-box">IC&nbsp;</span><!--
                    --><span class="logo-model">Card&nbsp;Management</span>
            </h1>
            <ul class="bubble-bgwall"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>
        </div>
    </div>
    <div class="mine-left">
        <ul>
            <li id="a_1">
                <a href="#sub-1" target="_self">
                    <font class="iconfont icon-xuesheng a_font"></font>
                    我的信息</a>
            </li>
            <li id="a_2">
                <a href="#sub-2" target="_self">
                    <font class="iconfont icon-jiangxuejin a_font"></font>
                    账户余额</a>
            </li>
            <li id="a_3">
                <a href="#sub-3" target="_self">
                    <font class="iconfont icon-xinwendongtai a_font"></font>
                    卡片中心</a>
            </li>
            <li id="a_4">
                <a href="#sub-4" target="_self">
                    <font class="iconfont icon-feiyongbaoxiao a_font"></font>
                    我的消费</a>
            </li>
            <li id="a_5">
                <a href="#sub-5" target="_self">
                    <font class="iconfont icon-tongzhigonggao a_font"></font>
                    挂失记录</a>
            </li>
            <li id="a_6">
                <a href="#sub-6" target="_self">
                    <font class="iconfont icon-kejipingtai a_font"></font>
                    注销记录</a>
            </li>
            <li id="a_7">
                <a href="#sub-7" target="_self">
                    <font class="iconfont icon-jishuzhuanyi a_font"></font>
                    账号变更</a>
            </li>
            <li id="a_8">
                <a href="#sub-8" target="_self" target="_top">
                    <font class="iconfont icon-kexuejishu a_font"></font>
                    账号安全</a>
            </li>
            <li>
                <a>
                    <font class="iconfont icon-tuichudenglu a_font"></font>
                    退   出</a>
            </li>
        </ul>
    </div>
    <div class="mine-right">
        <div class="progressBar" id="progressBar">
            <div class="barContent" id="barContent"></div>
        </div>
        <div class="content">
            <div class="sub-content sub-1" name="sub-1">
                <!--头像上传-->
                <div class="file-temp">
                    <div class="file-area">
                        <div class="file-box">
                            <input type="file"  name="upload-file" class="upload-file" style="opacity: 0;width: 100%;height: 100%;cursor: pointer;">
                        </div>
                        <div class="file-tip">
                            <span>请从本地选择<font class="file-type">*.jpg</font>/<font class="file-type">*.png</font>作为头像！</span>
                        </div>
                    </div>
                    <div class="but-area">
                        <input type="button" value="取消" class="file-but file-cancel">
                        <input type="button" value="确定" class="file-but file-sure">
                    </div>
                </div>
                <table class="modify-panel" border="0" cellpadding="0" cellspacing="0">
                    <tfoot>
                        <tr>
                            <td colspan="4" align="left" style="outline: none;border-bottom: 0;">
                                    <span  style="background-color: #c7254e;border-radius: 5px;border: 2px solid #fff;color: #fff;padding: 2px 1px;">
                                        Modify
                                    </span>
                            </td>
                        </tr>
                    </tfoot>
                    <tr style="padding-bottom: 0;background-color: var(--sub_color);">
                        <td align="center" colspan="4" style="position:relative;padding-bottom: 0;margin-bottom: 0;height: 100px;">
                                <img src="D:/桌面/课程设计/UI/img/defult_man.png" id="new-msg-headIcon">
                                <span id="new-msg-single">hello!!!</span>
                                <div id="modify-single-panel">
                                    <textarea name="new_single" id="new_single" type="text" οnchange="this.value=this.value.substring(0, 400)"
                                              οnkeydοwn="this.value=this.value.substring(0, 400)"
                                              οnkeyup="this.value=this.value.substring(0, 400)"></textarea>
                                    <label class="label label-danger">字数不超过<font style="color: crimson;">200</font>字</label>
                                    <div class="btn_s">
                                        <input type="button" value="确定" class="sure_single single_btn"><input type="button" value="取消" class="cancel_single single_btn">
                                    </div>
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="20%">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                        <td align="left" width="30%">
                            <input type="text" name="uName" value="" id="new-msg-name" class="new-msg">
                        </td>
                        <td align="right" width="20%">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                        <td align="left" width="30%" id="new-msg-sex"><div class="my-radio"></div></td>
                    </tr>
                    <tr>
                        <td align="right" width="20%">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                        <td align="left" width="30%">
                            <input type="tel" id="new-msg-phone" value="" class="new-msg">
                        </td>
                        <td align="right" width="20%">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                        <td align="left" width="30%">
                            <input type="email" id="new-msg-email" value="" class="new-msg">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="20%">身份证件：</td>
                        <td align="left" width="30%">
                            <input type="text" id="new-msg-identify" value="" class="new-msg">
                        </td>
                        <td align="right" width="20%">修改头像：</td>
                        <td align="left" width="30%">
                            <div type="button" id="modify_head" value="" class="iconfont icon-bianji new-msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="20%">生&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
                        <td align="left" width="30%" colspan="3">
                            <input type="date" id="new-msg-brithday" value="" class="new-msg">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="20%">用户类型：</td>
                        <td align="left" width="30%" colspan="3" id="new-msg-userType" style="padding: 15px 5px;"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="right" style=" border-bottom: 0px solid #666;">
                            <input type="button" value="返    回" id="modify-user-cancel" style="background-color: #c7254e;color: white">
                            <input type="button" value="确    认" id="modify-user-ack">
                        </td>
                    </tr>
                </table>
                <table class="person-msg" border="0" cellpadding="0" cellspacing="0">
                    <tfoot>
                    <tr>
                        <td colspan="4" align="left" style="outline: none;border-bottom: 0;">
                            <span  style="background-color: #04a78c;border-radius: 5px;border: 2px solid #fff;color: #fff;padding: 2px 4px;"> Mine </span>
                        </td>
                    </tr>
                    </tfoot>
                    <tr style="padding-bottom: 0;background-color: var(--sub_color);">
                        <td align="center" colspan="4" style="padding-bottom: 0;margin-bottom: 0;height: 100px;">
                            <img src="D:/桌面/课程设计/UI/img/defult_man.png" id="msg-headIcon">
                            <span  id="msg-single">hello!!!</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                        <td align="left" width="25%" id="msg-name"></td>
                        <td align="right" width="25%">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                        <td align="left" width="25%" id="msg-sex"><div class="my-radio"></div></td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                        <td align="left" width="25%" id="msg-phone" ></td>
                        <td align="right" width="25%">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                        <td align="left" width="25%" id="msg-email"></td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">身份证件：</td>
                        <td align="left" width="25%" colspan="3" id="msg-identify"></td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">生&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
                        <td align="left" width="25%" colspan="3" id="msg-brithday"></td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">用户类型：</td>
                        <td align="left" width="25%" colspan="3" id="msg-userType"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="right" style=" border-bottom: 0px solid #666;">
                            <input type="button" value="修    改" id="modify-user">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="sub-content sub-2" name="sub-2">
                <div class="balance-box">
                    <table class="balance-tab">
                        <tr>
                            <td>
                                <img src="${global_url}pic/main_page/money_icon.png" class="inline_block" alt="" style="width: 100px;height: 100px;border-radius: 5px;">
                                <div class="inline_block" >
                                        <span>
                                            <font style=" border-radius:5px;font-size: 10px;font-family: 'Adobe 宋体 Std L';color: var(--sub_color);background-color: #fff;padding: 2px;margin-left: 2px;">余额￥</font>
                                            <font id="money-balance" style="font-size: 42px;font-weight: 400;color:#fff;font-family: 'Courier New';">99.99</font>
                                        </span>
                                </div>
                            </td>
                            <td align="right">
                                <div class="inline_block daliy-point">
                                    <span style="margin-right: 20px;background-color: #c7254e;border-radius: 5px;padding: 5px;color: #fff;cursor: pointer;">签到</span>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="balance-items"></div>
                </div>
            </div>
            <div class="sub-content sub-3" name="sub-3">
                <div class="con">
                    <div class="left">
                        <div class="table-box">
                            <div class="table-top">

                            </div>
                            <div class="table-bottom"></div>
                        </div>
                    </div>
                    <div class="top"></div>
                    <div class="bottom">
                        <span class="card-name">普通卡</span>
                        <div class="card"></div>
                    </div>
                </div>
            </div>
            <div class="sub-content sub-4" name="sub-4">
                <div class="chart-panel">
                    <div class="border-box box-top box-left box-top-left"></div>
                    <div class="border-box box-top box-right box-top-right"></div>
                    <div class="my-chart"></div>
                    <div class="border-box box-bottom box-left box-bottom-left"></div>
                    <div class="border-box box-bottom box-right box-bottom-right"></div>
                </div>
            </div>
            <div class="sub-content sub-5" name="sub-5">
                <div class="table-box">
                    <div class="table-top">
                        <ul>
<%--                            <li id="loss_li_1" class="card_li" style="background-image: url('http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png');">--%>
<%--                                <span class="loss_li_span loss_li_span_01"><font class=" iconfont icon-huizhang1" style="color: #4e65c7"> </font>NO.<font style="color: var(--sub_color);">1</font></span>--%>
<%--                                <span class="loss_li_span loss_li_span_02"><font class=" iconfont icon--yue" style="color: #ffda62"></font>余额：<font style="color: #ffda62">122.00</font>￥</span>--%>
<%--                                <span class="loss_li_span loss_li_span_03"><font class="iconfont icon-xuesheng" style="color: var(--sub_color);"> </font>持有人：<font style="color: var(--sub_color);">肖家海</font></span>--%>
<%--                            </li>--%>
<%--                            <li id="loss_li_2" class="card_li" style="background-image: url('http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png');">--%>
<%--                                <span class="loss_li_span loss_li_span_01"><font class=" iconfont icon-huizhang1" style="color: #4e65c7"> </font>NO.<font style="color: var(--sub_color);">2</font></span>--%>
<%--                                <span class="loss_li_span loss_li_span_02"><font class=" iconfont icon--yue" style="color: #ffda62"></font>余额：<font style="color: #ffda62">182.00</font>￥</span>--%>
<%--                                <span class="loss_li_span loss_li_span_03"><font class="iconfont icon-xuesheng" style="color: var(--sub_color);"> </font>持有人：<font style="color: var(--sub_color);">肖家海</font></span>--%>
<%--                            </li>--%>
<%--                            <li class="more">--%>
<%--                                <span class="noMore loss_li_span loss_li_span_02 iconfont icon-icon--"></span>--%>
<%--                            </li>--%>
                        </ul>
                    </div>
                    <div class="table-bottom"></div>
                </div>
            </div>
            <div class="sub-content sub-6" name="sub-6">
                <div class="table-box">
                    <div class="table-top"></div>
                    <div class="table-bottom"></div>
                </div>
            </div>
            <div class="sub-content sub-7" name="sub-7">
                <div class="change-account">
                    <div>
                        <input type="button" class="app_btn" id="a">
                    </div>
                    <div class="bottom-btn">
                        <input type="button" value="我的申请" class="app_btn show_my_app account_menu">
                        <input type="button" value="已有身份" class="app_btn show_my_identify account_menu">
                        <input type="button" value="申请流程" class="app_btn show_app_tip account_menu">
                    </div>
                </div>
                <div class="change-tip">
                    <span class="chang_title">账号变更申请流程</span>
                    <div class="node approve">
                        <span>提出申请</span>
                    </div>
                    <div class="node admin">
                        <span>管理员审核</span>
                    </div>
                    <div class="node success">
                        <span>成功通过</span>
                    </div>
                    <div class="node confuse">
                        <span>不予通过</span>
                    </div>
                    <span class="line ap_ad"></span>
                    <span class="line ad_su"></span>
                    <span class="line ad_co"></span>
                    <input class="sure_tip" type="button" value="我知道了">
                </div>
                <div class="sure_change">

                    <div class="bottom-btn">
                        <input type="button" value="关闭" class="app_btn close_app">
                        <input type="button" value="确认" class="app_btn sure_my_app">
                    </div>
                </div>
                <div class="my_approve">
                    <div class="bottom-btn">
                        <input type="button" value="关闭" class="app_btn close_app">
                    </div>
                </div>
                <div class="my_identify">
                    <div class="bottom-btn">
                        <input type="button" value="关闭" class="app_btn close_app">
                    </div>
                </div>
            </div>
            <div class="sub-content sub-8" name="sub-8">
                <div class="modify-pwd">
                    <div class="modify-top">
                        <span>修改登录密码</span>
                        <table>
                            <tr>
                                <td align="right"><font class="modify_tip">新密码：</font></td>
                                <td  align="left"><input type="password" class="pwd_ipt" name="new_pwd" id="new_pwd" autocomplete="off"></td>
                            </tr>
                            <tr>
                                <td align="right"><font class="modify_tip">确认密码：</font></td>
                                <td align="left"><input type="password" class="pwd_ipt"  name="ack_new_pwd" id="ack_new_pwd" autocomplete="off"></td>
                            </tr>
                            <tr>
                                <td width="'100"></td>
                                <td align="right">
                                    <div class="leave" id="pwdLevel_1"></div>
                                    <div class="leave" id="pwdLevel_2"></div>
                                    <div class="leave" id="pwdLevel_3"></div>
                                    <div class="leave_color" id="levelText_1">弱</div>
                                    <div class="leave_color" id="levelText_2">中</div>
                                    <div class="leave_color" id="levelText_3">强</div>
                                    <div class="leave_tip">
                                        <span id="pwd_tip" style="color: #898989;">
                                            <font style="color: #f00;">*</font>
                                            6-16位，由字母(区分大小写)、数字、符号组成
                                        </span>
                                        <span id="pwd_err" style="color: #f00;display: none;">
                                            6-16位，由字母(区分大小写)、数字、符号组成
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modify-bottom">
                        <input type="button" value="确认" class="sure_modify_pwd">
                        <input type="button" value="取消" class="confuse_modify_pwd">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function processBar(val) {
        $("#barContent").css("width", (val * 12.5) + "%" ) ;
    }
</script>
<script>
    var heightH = window.innerHeight * 0.85;

    function move(moveObj,moveTarget,scrollStep) {
        //$(moveObj).offset().top
        $(moveTarget).animate({
            scrollTop: heightH*scrollStep
        }, 800);
    }

    $(function () {
        var lis = $(".mine-left>ul").find("li");
        var len = lis.length;
        for(let i=0;i<len;i++){
            $(lis[i]).click(function(){
                if(i<len-1) {
                    move('.sub-' + (i + 1), '.content', i);
                    processBar(i + 1);
                }else{
                    exitAndBackHome();
                }
                // elem.tip($(lis[i]).find("a").html(),1);
                my_tip.tip();
                switch (i) {
                    case 0:toMyMessage();break;
                    case 1:toAccountBalance();break;
                    case 2:toManageCard();break;
                    case 3:toMyConmue();break;
                    case 4:toLossCardDetial();break;
                    case 5:toLogoutCardDetial();break;
                    case 6:toChangeAccountType();break;
                    case 7:toAccountSafe();break;
                }

                let _a = $(".mine-left>ul").find("li");
                let _a_len = _a.length;
                for(let index = 0;index <_a_len;index++){
                    if(i == index){
                        $(_a[index]).removeClass("hangkonghangtian-aerospace-taiyangxi-s");
                    }
                }
                $(this).addClass("hangkonghangtian-aerospace-taiyangxi-s");
            });
        }
    });
    //查看我的信息
    function toMyMessage() {
        // 修改面板===================
        //new-msg-headIcon:修改头像
        //new-msg-single:签名
        //new-msg-name：修改姓名
        //new-msg-sex:修改性别
        //new-msg-phone:修改手机号
        //new-msg-email:修改邮箱
        //new-msg-identify:修改身份证
        //new-msg-brithday:修改生日
        //new-msg-userType:用户类型（不可再此处修改）
        $.ajax({
            url: "${global_url}personalInformation/get",
            method: "post",
            dataType: "json",
            data:{},
            beforeSend:function(){
                loading_cir.loading("body");
            },
            success:function (data) {
                if(data.succeed == true){
                    // console.log(data);
                    setUserInfo(data.data);
                }
                loading_cir.loaded("body");
            },
            error:function () {
                loading_cir.loaded("body");
            }
        });
        //展示信息面板===========================
        //msg-headIcon:头像
        //msg-single:签名
        //msg-name：姓名
        //msg-sex:性别
        //msg-phone:手机号
        //msg-email:邮箱
        //msg-identify:身份证
        //msg-brithday:生日
        //msg-userType:用户类型（不可再此处修改）
    }
    toMyMessage();
    // {
    //     "code":0,
    //     "data":
    //     {
    //         "easy_id":10,
    //         "email":"123@123.com",
    //         "head_url":"http://47.113.189.196:80/nchkkjxy/pic/head_icon/defult.png",
    //         "id":1,
    //         "identify_card":"362430199999999999",
    //         "money_balance":"201.63",
    //         "name":"xjh",
    //         "node_status":"1",
    //         "phone":"15770674965",
    //         "register_identify":"????",
    //         "sex":"?",
    //         "single":"qqq",
    //         "user_status":"1"
    //     },
    //     "msg":"????",
    //     "succeed":true
    // }
    function setUserInfo(uInfo) {
        // console.log(uInfo);
        $("#msg-headIcon").attr("src",uInfo.head_url);//:修改头像
        $("#msg-single").html(uInfo.single);//:签名
        $("#msg-name").html(uInfo.name);//姓名
        let _sex_html = "";
        if(uInfo.sex == "男"){
            _sex_html = "<label for='msg-man' id='man-lab'>" +
                        "        <input type='radio' name='msg-sex' value='男' id='msg-man' checked>" +
                        "        <span>" +
                        "           <svg t='1635051158257' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='5451' width='16' height='16' style='font-weight: 800;'><path d='M575.943755 0C328.967874 0 127.987501 200.980373 127.987501 447.956254c0 109.689288 39.696123 210.379455 105.389708 288.271849l-54.194707 54.194707-87.991407-87.991407c-14.998535-14.998535-39.296162-14.998535-54.294698 0s-14.998535 39.296162 0 54.294698l88.091397 87.991407L11.298897 958.406406c-14.998535 14.998535-14.998535 39.296162 0 54.294697 7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097353-11.298897l113.688898-113.688897 87.991407 87.991407c7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097354-11.298897 14.998535-14.998535 14.998535-39.296162 0-54.294698l-87.991407-87.991407 54.194707-54.194707C365.5643 856.216385 466.254467 895.912509 575.943755 895.912509c246.975881 0 447.956254-200.980373 447.956255-447.956255S822.919637 0 575.943755 0z m0 819.120008c-204.680012 0-371.163754-166.483742-371.163753-371.163754S371.263744 76.792501 575.943755 76.792501 947.107509 243.276243 947.107509 447.956254 780.623767 819.120008 575.943755 819.120008z' fill='#27D0D8' p-id='5452'></path></svg>" +
                        "        </span>" +
                        "</label>";
        }else if(uInfo.sex == "女"){
            _sex_html = "<label for='msg-woman' class='sex-lab' id='woman-lab'>" +
                        "        <input type='radio' name='msg-sex' value='女' id='msg-woman' checked>" +
                        "        <span>" +
                        "            <svg t='1635051266858' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='7132' width='16' height='16' style='font-weight: 800;'><path d='M945.2 0H748.3c-21.7 0-39.4 17.6-39.4 39.4s17.6 39.4 39.4 39.4h141.2L755.2 213.1C675.2 145.7 572 105 459.5 105 206.1 105 0 311.2 0 564.5S206.1 1024 459.5 1024 919 817.9 919 564.5c0-112.5-40.7-215.7-108.1-295.7l134.3-134.3v141.2c0 21.8 17.6 39.4 39.4 39.4s39.4-17.6 39.4-39.4V78.8C1024 35.3 988.7 0 945.2 0zM459.5 945.2c-209.9 0-380.7-170.8-380.7-380.7s170.8-380.7 380.7-380.7 380.7 170.8 380.7 380.7-170.8 380.7-380.7 380.7z' fill='#e89abe' p-id='7133'></path></svg>" +
                        "        </span>" +
                        "</label>";
        }else{
            _sex_html = "<font style='color: #c7254e;font-weight: 400;font-size: 14px;text-align: center;'>?</font>";
        }
        $("#msg-sex .my-radio").html(_sex_html);

        $("#msg-phone").html(uInfo.phone);//手机号
        $("#msg-email").html(uInfo.email);//邮箱
        $("#msg-identify").html(uInfo.identify_card);//身份证
        $("#msg-brithday").html(uInfo.brithday);//生日
        $("#msg-userType").html(uInfo.register_identify);//用户类型（不可再此处修改）
//======================================================================================================================================
        $("#new-msg-headIcon").attr("src",uInfo.head_url);//:修改头像
        $("#new-msg-single").html(uInfo.single);//:签名
        $("#new-msg-name").val(uInfo.name);//姓名

        let _new_msg_sex_html = "<label for='new-msg-man' id='new-man-lab'>" +
                                "        <input type='radio' name='new-sex' value='男' id='new-msg-man'"+
                                ((uInfo.sex == "男")?" checked >":">") +
                                "        <span>" +
                                "           <svg t='1635051158257' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='5451' width='16' height='16' style='font-weight: 800;'><path d='M575.943755 0C328.967874 0 127.987501 200.980373 127.987501 447.956254c0 109.689288 39.696123 210.379455 105.389708 288.271849l-54.194707 54.194707-87.991407-87.991407c-14.998535-14.998535-39.296162-14.998535-54.294698 0s-14.998535 39.296162 0 54.294698l88.091397 87.991407L11.298897 958.406406c-14.998535 14.998535-14.998535 39.296162 0 54.294697 7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097353-11.298897l113.688898-113.688897 87.991407 87.991407c7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097354-11.298897 14.998535-14.998535 14.998535-39.296162 0-54.294698l-87.991407-87.991407 54.194707-54.194707C365.5643 856.216385 466.254467 895.912509 575.943755 895.912509c246.975881 0 447.956254-200.980373 447.956255-447.956255S822.919637 0 575.943755 0z m0 819.120008c-204.680012 0-371.163754-166.483742-371.163753-371.163754S371.263744 76.792501 575.943755 76.792501 947.107509 243.276243 947.107509 447.956254 780.623767 819.120008 575.943755 819.120008z' fill='#27D0D8' p-id='5452'></path></svg>" +
                                "        </span>" +
                                "</label>"+
                                "<label for='new-msg-woman' class='sex-lab' id='new-woman-lab'>" +
                                "        <input type='radio' name='new-sex' value='女' id='new-msg-woman' "+
                                ((uInfo.sex == "女")?" checked>":">") +
                                "        <span>" +
                                "            <svg t='1635051266858' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='7132' width='16' height='16' style='font-weight: 800;'><path d='M945.2 0H748.3c-21.7 0-39.4 17.6-39.4 39.4s17.6 39.4 39.4 39.4h141.2L755.2 213.1C675.2 145.7 572 105 459.5 105 206.1 105 0 311.2 0 564.5S206.1 1024 459.5 1024 919 817.9 919 564.5c0-112.5-40.7-215.7-108.1-295.7l134.3-134.3v141.2c0 21.8 17.6 39.4 39.4 39.4s39.4-17.6 39.4-39.4V78.8C1024 35.3 988.7 0 945.2 0zM459.5 945.2c-209.9 0-380.7-170.8-380.7-380.7s170.8-380.7 380.7-380.7 380.7 170.8 380.7 380.7-170.8 380.7-380.7 380.7z' fill='#e89abe' p-id='7133'></path></svg>" +
                                "        </span>" +
                                "</label>";
        $("#new-msg-sex .my-radio").html(_new_msg_sex_html);//性别
        $("#new-msg-phone"   ).val(uInfo.phone);//手机号
        $("#new-msg-email"   ).val(uInfo.email);//邮箱
        $("#new-msg-identify").val(uInfo.identify_card);//身份证
        $("#new-msg-brithday").val(uInfo.brithday);//生日
        $("#new-msg-userType").html(""+uInfo.register_identify +
            "<span style='color:#888;font-size:12px;border-raduis:5px;padding:5px 2px;'>" +
            "(用户类型不能修改)" +
            "    <font class='iconfont icon-wenhao' " +
            "     style='width: 5px;height: 5px;border-radius: 50%;background-color: #c7254e;color: #fff;cursor:help; '>" +
            "    </font>" +
            "</span>");//用户类型（不可再此处修改）
        elemTitle.gridTitle(
            $("#new-msg-userType span font"),
            "请前往账号变更中心申请！",
            [
                {cssName:"width",cssValue:'250px'},
                {cssName:"background-color",cssValue:'#ff333d'},
                {cssName:"color",cssValue:'#fff'},
                {cssName:"z-index",cssValue:"30"}
            ]);
        $("#new-msg-userType span font").click(function () {
            $("#a_7 a").click();
        });
    }
    function getUserInfo() {
        // let selector = document.getElementsByName('new-sex');
        // let sex = $(selector).val();
        return  userInfo = {
            head_url:$("#new-msg-headIcon").prop("src"),//$("#new-msg-headIcon").html(),//:修改头像
            single:$("#new-msg-single").html(),//:签名
            name:$("#new-msg-name").val(),//：修改姓名
            sex:$(document.getElementsByName('new-sex')).val(),//:修改性别
            phone:$("#new-msg-phone").val(),//:修改手机号
            email:$("#new-msg-email").val(),//:修改邮箱
            identify_card:$("#new-msg-identify").val(),//:修改身份证
            brithday:$("#new-msg-brithday").val(),//:修改生日
            //register_identify:$("#new-msg-userType").html(),//:用户类型（不可再此处修改）
        };

    }
    //查看我的账户余额
    function toAccountBalance() {
        getBalance();
    }
    //管理我的ic卡
    function toManageCard() {
        $(".sub-3 .top").animate({
            width: '100%',
            height: '0',
            top:'0',
            left: '0',
        },1);
        $(".sub-3 .left").animate({
            top: '0',
            width:'0',
            height: '100%',
        },1);
        $(".sub-3 .left .table-box").animate({
            opacity:'0'
        },0);
        $(".sub-3 .bottom").animate({
            width: '100%',
            height: '0',
            top:'100%',
            left: '0',
        },1);
        $(".sub-3 .bottom .card").animate({
            top: '50%',
            left: '50%',
            width: '50%',
            height: '50%',
            transform: 'translate(-50%,-50%)'
        },1);


        $(".sub-3 .bottom").animate(
            {
                width: '100%',
                height: '100%',
                top: 0,
                left: 0,
            },
            {
                duration:1000,
                complete:function () {
                    $(".sub-3 .bottom").animate({},{
                       duration:400,
                       complete:function () {
                           $(".sub-3 .bottom").animate(
                               {
                                   width: '50%',
                                   height: '50%',
                                   top:'50%',
                                   left: '50%',
                               },600);
                           $(".sub-3 .left").animate({
                               width: '50%',
                               top: 0,
                               left: 0,
                           },800);
                           $(".sub-3 .top").animate({
                               width: '50%' ,
                               height: '50%',
                               top:0,
                               left: '50%',
                           },800);
                           $(".sub-3 .left .table-box").animate({
                               opacity:'1'
                           },1);
                       }
                    });
                }
            }
        );

        $.ajax({
            url:"${global_url}personalLoss/getLoss",
            method:'post',
            dataType:'json',
            data:{},
            success:function (data) {
                if(data.succeed == true){
                    setcardsSub3(data.data);
                    console.log(data.data)
                }else{
                    setCardsError();
                }
            },
            error:function () {
                setCardsError();
            }
        });
    }
    //查看我的消费
    function toMyConmue() {
        showMyCoume();
    }
    //查看我的挂失记录
    function toLossCardDetial() {
        getCardList();
    }
    //查看我的注销记录
    function toLogoutCardDetial() {

    }
    // 进行我的账号变更
    var _has_show_sub_7_tip = false;
    function toChangeAccountType() {
        if(_has_show_sub_7_tip){
            return;
        }
        $(".sub-7 .change-tip").addClass("change-tip_animation");
        $(".sub-7 .change-tip").animate({
            width:'500px',
            height:'300px',
            opacity:0
        },800);
        _has_show_sub_7_tip = true;
    }
    //账号安全管理
    function toAccountSafe() {

    }
    //退出机返回主页
    function exitAndBackHome() {
        window.location.replace("${global_url}");
    }
</script>
<!--sub-1我的信息-->
<script>
    $("#modify-user-cancel").click(function () {
        show_msg_panel();
    });
    $("#modify-user-ack").click(function () {
        //异步提交
        sureModify();
    });
    $("#modify-user").click(function () {
        show_modify_msg_panel();
    });
    $("#msg-headIcon,#new-msg-headIcon").click(function () {
        head_bigger_to_view.show(".sub-1",$(this).attr("src"));
    });
    function sureModify() {
        // console.log($(document.getElementsByName('new-sex')).val());
            $.ajax({
                url:"${global_url}personalInformation/update",
                method:"post",
                dataType:"json",
                data:{
                    head_url:$("#new-msg-headIcon").attr("src"),//"http://47.113.189.196:80/nchkkjxy/pic/head_icon/client_user_xjh_10.png",//$("#new-msg-headIcon").html(),//:修改头像
                    single:$("#new-msg-single").html(),//:签名
                    name:$("#new-msg-name").val(),//：修改姓名
                    sex: elemUtil.getRadioVal("new-sex"),//:修改性别
                    phone:$("#new-msg-phone").val(),//:修改手机号
                    email:$("#new-msg-email").val(),//:修改邮箱
                    identify_card:$("#new-msg-identify").val(),//:修改身份证
                    brithday:$("#new-msg-brithday").val(),//:修改生日
                    //register_identify:$("#new-msg-userType").html(),//:用户类型（不可再此处修改）
                },
                beforeSend:function(){
                    loading_cir.loading("body");
                },
                success:function (data) {
                    loading_cir.loaded("body");
                    show_msg_panel();
                    my_tip.tip("修改成功！",1,'.sub-1',[{cssName:'opcaity',cssValue:'0.8'}]);

                    //刷新个人信息
                    toMyMessage();
                },
                error:function () {
                    loading_cir.loaded("body");
                    show_msg_panel();
                    my_tip.tip("访问异常！",1,'.sub-1',[
                        {cssName:'opcaity',cssValue:'0.8'},
                        {cssName: 'background-color',cssValue:'#c7254e'}
                        ]);
                },
            });
    }
    //打卡信息面板
    function show_msg_panel() {
        // $(".mine-box .mine-right .content .person-msg").find("*").css("opacity","1");
        $(".mine-box .mine-right .content .person-msg").animate({opacity:"1"},400);
        $(".mine-box .mine-right .content .modify-panel").animate({opacity: '0'},400);
        $(".mine-box .mine-right .content .modify-panel").css("display","none");
    }
    // 打开修改信息面板
    function show_modify_msg_panel() {
        $(".mine-box .mine-right .content .person-msg").animate({opacity:"0"},400);
        $(".mine-box .mine-right .content .modify-panel").animate({opacity: '1'},400);
        $(".mine-box .mine-right .content .modify-panel").css("display","table");
    }

    //头像上传
    var file_judeg = {
        supportFile : ["jpg","gif","bmp","png","jpeg"],
        MaxNameLength : 100,
        judge:function (fileNode,singleNode) {
            let filePath = $(fileNode).val();
            let fileName = filePath.substring(filePath.lastIndexOf( "\\" ) + 1, filePath.length);
            if  ( typeof (fileName) !="undefined" && fileName !=  "" ) {
                if(typeof (singleNode)!="undefined") {
                    $(singleNode).css("border","3px solid var(--sub_color)");
                }
                //lastIndexOf如果没有搜索到则返回为-1
                if  (fileName.lastIndexOf( "." ) != -1) {
                    let  fileType = (fileName.substring(fileName.lastIndexOf( "." ) + 1, fileName.length)).toLowerCase();
                    // console.log(fileType)
                    for  (  let  i = 0; i < file_judeg.supportFile.length; i++) {
                        if  (file_judeg.supportFile[i] == fileType) {
                            if  (fileName.length > file_judeg.MaxNameLength) {
                                // "文件名长度不能超过100字符" );
                                $(fileNode).val("");
                                my_tip.tip("文件名长度不能超过"+file_judeg.MaxNameLength+"字符",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                                return  -1 ;
                            }
                            return  1;
                        }
                    }
                    my_tip.tip("文件格式无效",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                    return  -1 ;
                }  else  {
                    $(fileNode).val("");
                    my_tip.tip("选择文件失败",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                    return  -1 ;
                }
            }
            else{
                if(typeof (singleNode)!="undefined") {
                    $(singleNode).css("border","3px dashed var(--sub_color)");
                }
                return 0;
            }
        }
    }
    $(".file-temp .file-area .file-box .upload-file").change(function () {
        let reg = file_judeg.judge($(this),$(".file-temp .file-area .file-box "));
        if(reg == 1){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #16DC63");
            $(".file-temp .file-area .file-box ").css("border-color", "#16DC63");
            $(".file-temp .file-area .file-box ").css("background-image", "url('${global_url}pic/main_page/file_succeed.png')");
        }
        else if(reg == -1){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px crimson");
            $(".file-temp .file-area .file-box ").css("border-color", "crimson");
            $(".file-temp .file-area .file-box ").css("background-image", "url('${global_url}pic/main_page/file_error.png')");
        }
        else if(reg == 0){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #666");
            $(".file-temp .file-area .file-box ").css("border-color", "#666");
            $(".file-temp .file-area .file-box ").css("background-image", "url('${global_url}pic/main_page/file_add.png')");
        }
    });
    var file_btn = $(".file-temp .file-area .file-box .upload-file");
    //选择文件
    $(".file-temp .file-area .file-box .upload-file").click(function () {
        if( $(".file-temp .file-area .file-box .upload-file").val() !=  "" ) {
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #666");
            $(".file-temp .file-area .file-box ").css("border", "3px dashed #666");
            $(".file-temp .file-area .file-box ").css("background-image", "url('${global_url}pic/main_page/file_add.png')");
        }
    });
    //上传事件
    $(".file-temp .but-area .file-sure").click(function () {
        if ($(".file-temp .file-area .file-box .upload-file").val() == "") {
            my_tip.tip("没有选择文件",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
        } else {
            //开始上传文件
            let multipartFile = new FormData();
            multipartFile.append("file", file_btn[0].files[0])
            $.ajax({
                url: "${global_url}file/upload",  //后台URL
                type: "post",
                data: multipartFile,
                contentType: false,
                cache: false,
                processData: false,//必须false才会避开jQuery对 formdata 的默认处理,XMLHttpRequest会对 formdata 进行正确的处理
                beforeSend:function(){
                    loading_cir.loading('body');
                },
                success: function (data) {
                    $("#new-msg-headIcon").attr("src",data.replace(/\"/g, ""));
                    loading_cir.loaded('body');
                    $('.sub-1 .file-temp').animate({
                        width:'0',
                        height:'0',
                        top:'0',
                        left:'0',
                        opacity:'0'
                    },800);
                    // $('.sub-1 .file-temp').css('display','none');
                    $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #666");
                    $(".file-temp .file-area .file-box ").css("border", "3px dashed #666");
                    $(".file-temp .file-area .file-box ").css("background-image", "url('${global_url}pic/main_page/file_add.png')");
                },
                error:function () {
                    loading_cir.loaded('body');
                }
            });
        }
    });

    //点击开始修改头像
    // width: 500px;
    // height: 300px;
    // top: 50%;
    // left: 50%;
    $("#modify_head").click(function () {
        // $('.sub-1 .file-temp').css('display','inline-block');
        $('.sub-1 .file-temp').animate({
            width:'500px',
            height:'300px',
            top:'50%',
            left:'50%',
            opacity:'1'
        },800);
    });
    //关闭修改头像
    $(".sub-1 .file-temp .but-area .file-cancel").click(function () {
        $('.sub-1 .file-temp').animate({
            width:'0',
            height:'0',
            top:'0',
            left:'0',
            opacity:'0'
        },800);
        // $('.sub-1 .file-temp').css('display','none');
    });

    //点击修改个性签名
    $("#new-msg-single").click(function () {
        $("#new_single").val(getSingleValue());
        $('#modify-single-panel').animate({
            width:'500px',
            height:'250px',
            top:'20%',
            opacity:'1'
        },800);
    });
    function setSingleValue(val){
        $("#new-msg-single").html(val);
    }
    function getSingleValue(){
        return $("#new-msg-single").html();
    }
    function closeNewSingle(){
        $('#modify-single-panel').animate({
            width:'0',
            height:'0',
            top:'-20%',
            opacity:'0'
        },800);
    }
    $("#modify-single-panel .btn_s .cancel_single").click(function () {
        closeNewSingle();
    });
    $("#modify-single-panel .btn_s .sure_single").click(function () {
        let single_val = $("#new_single").val();
        if(single_val.length > 200){
            my_tip.tip("内容写得不仅很多还比较烧气！",0,'#modify-single-panel',[{cssName:'background-color',cssValue:'crimson'}]);
            return ;
        }
        setSingleValue(single_val);
        closeNewSingle();
    });
</script>
<!--sub-2账户余额-->
<script>

    $(".daliy-point").click(function () {
        // my_tip.tip("签到成功！余额奖励<font style='color:crimson;font-weight: 400;'>+0.01</font>",1,'.sub-2',[{cssName:'background-color',cssValue:'rgba(255,175,20,0.81)'}]);
        // let money_now = (parseFloat($("#money-balance").html())+0.01).toFixed(2)
        // $("#money-balance").html(money_now);
        // $(".balance-items tbody").prepend("<tr><td align='center'>1</td><td align='center'>签到</td><td align='center'>+0.01</td><td align='center'>xjh</td><td align='center'>" +
        //     money_now+"</td><td align='center'>" +
        //     (new Date()).Format() +"</td></tr>");
        $.ajax({
            url: "${global_url}balance/daily",
            method: "post",
            dataType: "json",
            data:{},
            beforeSend:function(){
                loading_cir.loading("body");
                $(".daliy-point").css("pointer-events","none");
            },
            success:function (data) {
                loading_cir.loaded("body");
                if(data.succeed == true){
                    dataGrid.reload($(".sub-2 .balance-items"),sub2_gridData);
                    my_tip.tip("签到成功！余额奖励<font style='color:crimson;font-weight: 400;'>+0.01</font>",1,'.sub-2',[{cssName:'background-color',cssValue:'rgba(255,175,20,0.81)'}]);
                    // let money_now = (parseFloat($("#money-balance").html())+0.01).toFixed(2);
                    // $("#money-balance").html(money_now);

                    getBalance();
                }

                $(".daliy-point").css("pointer-events","painted");
            },
            error:function () {
                loading_cir.loaded("body");
            }
        })
    });

    function printData() {

    }
    function addRow() {

    }
    function exportData() {

    }
    function importData() {

    }
    function removeRow(ids) {

    }
    function reloadData() {

    }


    //获取余额
    function getBalance() {
        $.ajax({
            url: "${global_url}balance/getBalance",
            method: "post",
            dataType: "json",
            data:{},
            beforeSend:function(){

            },
            success:function (data) {
                // console.log(data);
                if(data.succeed == true){
                    // console.log(data);
                    $("#money-balance").html(data.data);
                }
            },
            error:function () {
            }
        });
    }
    //数据绑定

    var uid = window.localStorage.getItem("userId");
    var sub2_gridData = {
        ajac: {
            url: "${global_url}balance/page",//请求地址
            method: "post",//请求方法
            data: {
                uid:uid
            },//请求条件
            dataType: "json",
            beforeSend:function () {
                // my_layer.open();
            },
            overSend:function () {
                // my_layer.close();
            }
        },
        columnId:true,//显示列表序号（自增）
        columns:[
            {title:"id",      name:"id",width:"5",hidden:true,align:"center"},
            {title:"变更类型", name:"type",       width:"15",hidden:false,align:"center"},
            {title:"变更金额", name:"money", width:"10",hidden:false,align:"center"},
            {title:"操作账号", name:"operatorUser",   width:"10",hidden:false,align:"center"},
            {title:"余额",     name:"balance",   width:"10",hidden:false,align:"center"},
            {title:"时间",     name:"time",   width:"20",hidden:false,align:"center"},
            {title:"备注",     name:"note",    width:"25",hidden:false,align:"center"},
        ],//数据集合
        multi_select:true,//是否多选
        pages:[5,10,20,50,100],//每页多少天，选项
    };

    //绑定把表格数据
    dataGrid.grid($(".sub-2 .balance-items"),sub2_gridData);
    // 获取账户余额
    getBalance();
</script>
<!--sub-3卡管理-->
<script>

    function setcardsSub3(card) {
        let _cardList_html_ =" <ul>";
        $(".sub-3 .table-top ul").remove();

        for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
            _cardList_html_ += "" +
                "<li id='sub3cardLi" + card[cardIndex].cardId + "' class='card_li'>" +
                "     <span class='loss_li_span loss_li_span_01'><font class=' iconfont icon-huizhang1' style='color: #4e65c7'> </font>NO.<font style='color: var(--sub_color);'>"+card[cardIndex].cardId+"</font></span>" +
                "     <span class='loss_li_span loss_li_span_02'><font class=' iconfont icon--yue' style='color: #ffda62'></font>余额：<font style='color: #ffda62'>"+card[cardIndex].cardBalance+"</font>￥</span>" +
                "     <span class='loss_li_span loss_li_span_03'><font class='iconfont icon-xuesheng' style='color: var(--sub_color);'> </font>持有人：<font style='color: var(--sub_color);'>"+card[cardIndex].uName+"</font></span>" +
                " </li>";
        }
        _cardList_html_ += "<li class='more'><span class='noMore loss_li_span loss_li_span_02 iconfont icon-icon--' title='添加更多IC卡'></span></li></ul>";

        $(".sub-3 .table-top").append(_cardList_html_);

        let lis =  $(".sub-3 .table-top ul .card_li");
        for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
            $(lis[cardIndex]).css('background-image',"url('" + card[cardIndex].cardUrl + "')");
        }
        $(".sub-3 .table-top .more .noMore").click(function () {
            window.open("${global_url}navTo?url=home/businessProcess/createIc");
        });

        $(".sub-3 .table-top ul .card_li").click(function () {
            var clickSub3LiId = $(this).prop("id");
            setLossHistory(clickSub3LiId.substr(10,clickSub3LiId.length-1));
        });
        function setLossHistory(cId) {
            var sub3_gridData = {
                ajac: {
                    url: "${global_url}personalLoss/getLossPage",//请求地址
                    method: "post",//请求方法
                    data: {
                        cardId:cId
                    },//请求条件
                    dataType: "json",
                    beforeSend:function () {
                        // my_layer.open();
                    },
                    overSend:function () {
                        // my_layer.close();
                    }
                },
                columnId:true,//显示列表序号（自增）
                columns:[
                    {title:"IC卡号", name:"cardId",       width:"10",hidden:false,align:"center"},
                    {title:"操作类型", name:"handleType", width:"20",hidden:false,align:"center"},
                    {title:"操作日期", name:"handelDate",   width:"30",hidden:false,align:"center"},
                    {title:"操作结果", name:"handleResult",   width:"20",hidden:false,align:"center"},
                    {title:"备注",    name:"handelMark",   width:"20",hidden:false,align:"center"}
                ],//数据集合
                multi_select:true,//是否多选
                pages:[5,10,20,50,100],//每页多少天，选项
            };
            <%--var sub3_gridData = {--%>
            <%--    ajac: {--%>
            <%--        url: "${global_url}balance/page",//请求地址--%>
            <%--        method: "post",//请求方法--%>
            <%--        data: {--%>
            <%--            uid:uid--%>
            <%--        },//请求条件--%>
            <%--        dataType: "json",--%>
            <%--        beforeSend:function () {--%>
            <%--            // my_layer.open();--%>
            <%--        },--%>
            <%--        overSend:function () {--%>
            <%--            // my_layer.close();--%>
            <%--        }--%>
            <%--    },--%>
            <%--    columnId:true,//显示列表序号（自增）--%>
            <%--    columns:[--%>
            <%--        {title:"id",      name:"id",width:"5",hidden:true,align:"center"},--%>
            <%--        {title:"变更类型", name:"type",       width:"15",hidden:false,align:"center"},--%>
            <%--        {title:"变更金额", name:"money", width:"10",hidden:false,align:"center"},--%>
            <%--        {title:"操作账号", name:"operatorUser",   width:"10",hidden:false,align:"center"},--%>
            <%--        {title:"余额",     name:"balance",   width:"10",hidden:false,align:"center"},--%>
            <%--        {title:"时间",     name:"time",   width:"20",hidden:false,align:"center"},--%>
            <%--        {title:"备注",     name:"note",    width:"25",hidden:false,align:"center"},--%>
            <%--    ],//数据集合--%>
            <%--    multi_select:true,//是否多选--%>
            <%--    pages:[5,10,20,50,100],//每页多少天，选项--%>
            <%--};--%>
            //绑定把表格数据
            dataGrid.grid($(".sub-3 .table-bottom"),sub3_gridData);
        }
    }



</script>
<!--sub-4我的消费-->
<script>
    // $.getJSON('http://47.113.189.196:80/nchkkjxy/theame/js/wonderland.project.json', function (themeJSON) {
    // echarts.registerTheme('wonderland.project', themeJSON);
    // var myChart = echarts.init(dom, 'wonderland');
    // var myChart = echarts.init(document.querySelector(".my-chart"));//,'wonderland.project');
    // myChart.showLoading();  // 开启 loading 效果
    // $.get('http://47.113.189.196:80/nchkkjxy/test/eChartValue', function (data) {
    //     myChart.hideLoading();  // 隐藏 loading 效果
    //     myChart.setOption({
    //         series : [
    //             {
    //                 name: 'name',
    //                 type: 'pie',    // 设置图表类型为饼图
    //                 radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
    //                 data: data
    //             },
    //         ]
    //     })
    // }, 'json');


    // });
</script>
<script type="text/javascript">
    function showMyCoume() {
        // $(".sub-4 .my-chart").remove();
<%--        $.getJSON('http://47.113.189.196:80/nchkkjxy/theame/js/wonderland.project.json', function (themeJSON) {--%>
<%--            echarts.registerTheme('wonderland.project', themeJSON);--%>
<%--            // var myChart = echarts.init(dom, 'wonderland');--%>
        var myChart = echarts.init(document.querySelector(".sub-4 .my-chart"),'wonderland.project');
        // myChart.showLoading();  // 开启 loading 效果
        $.ajax({
         url:"${global_url}test/eChartValue",
         dataType:"json",
         method:"post",
        beforeSend:function () {
            loading_cir.loading(".sub-4");
        },
         success:function (data) {
             // myChart.hideLoading();
             loading_cir.loaded(".sub-4");
             var colors = ['#5793f3','#d14a61','#675bba','rgb(4, 167, 140)'];
             var option = {
                 legend: {},
                 color: colors,
                 tooltip: {
                     trigger: 'axis',
                     showContent: false
                 },
                 dataset: {
                     source: data
                     //     [
                     //     ['年度', '2012', '2013', '2014', '2015', '2016', '2017'],
                     //     ['收入', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
                     //     ['支出', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
                     //     ['来款', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
                     //     ['外借', 55.2, 67.1, 69.2, 72.4, 53.9, 39.1]
                     // ]
                 },
                 xAxis: {type: 'category'},
                 yAxis: {gridIndex: 0},
                 grid: {top: '55%'},
                 series: [
                     {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                     {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                     {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                     {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                     {
                         type: 'pie',
                         id: 'pie',
                         radius: '30%',
                         center: ['50%', '25%'],
                         label: {
                             formatter: '{b}: {@一月份} ({d}%)'
                         },
                         encode: {
                             itemName: '月份',
                             value: '一月份',
                             tooltip: '一月份'
                         }
                     }
                 ]
             };

             myChart.on('updateAxisPointer', function (event) {
                 var xAxisInfo = event.axesInfo[0];
                 if (xAxisInfo) {
                     var dimension = xAxisInfo.value + 1;
                     myChart.setOption({
                         series: {
                             id: 'pie',
                             label: {
                                 formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                             },
                             encode: {
                                 value: dimension,
                                 tooltip: dimension
                             }
                         }
                     });
                 }
             });
             myChart.setOption(option);

         },
         error:function () {
             // myChart.hideLoading();
             loading_cir.loaded(".sub-4");
         }
     });
    }

</script>
<!--sub-5挂失-->
<script>
    function getCardList() {
        // let cards = [
        //     {'cardUrl':'http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png','cardId':'1','uName':'肖家海','cardBalance':'100.22'},
        //     {'cardUrl':'http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png','cardId':'2','uName':'肖家海','cardBalance':'100.22'},
        //     {'cardUrl':'http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png','cardId':'3','uName':'肖家海','cardBalance':'100.22'}
        // ];
        $.ajax({
            url:"${global_url}personalLoss/getLoss",
            method:'post',
            dataType:'json',
            data:{},
            success:function (data) {
                if(data.succeed == true){
                    setcards(data.data);
                    console.log(data.data)
                }else{
                    setCardsError();
                }
            },
            error:function () {
                setCardsError();
            }
        });


    }
    function setcards(card) {
        let _cardList_html_ =" <ul>";
        $(".sub-5 .table-top ul").remove();

        for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
            _cardList_html_ += "" +
                "<li id='cardLi" + card[cardIndex].cardId + "' class='card_li'>" +
                "     <span class='loss_li_span loss_li_span_01'><font class=' iconfont icon-huizhang1' style='color: #4e65c7'> </font>NO.<font style='color: var(--sub_color);'>"+card[cardIndex].cardId+"</font></span>" +
                "     <span class='loss_li_span loss_li_span_02'><font class=' iconfont icon--yue' style='color: #ffda62'></font>余额：<font style='color: #ffda62'>"+card[cardIndex].cardBalance+"</font>￥</span>" +
                "     <span class='loss_li_span loss_li_span_03'><font class='iconfont icon-xuesheng' style='color: var(--sub_color);'> </font>持有人：<font style='color: var(--sub_color);'>"+card[cardIndex].uName+"</font></span>" +
                " </li>";
        }
        _cardList_html_ += "<li class='more'><span class='noMore loss_li_span loss_li_span_02 iconfont icon-icon--' title='添加更多IC卡'></span></li></ul>";

        $(".sub-5 .table-top").append(_cardList_html_);

        let lis =  $(".sub-5 .table-top ul .card_li");
        for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
           $(lis[cardIndex]).css('background-image',"url('" + card[cardIndex].cardUrl + "')");
        }
        $(".sub-5 .table-top .more .noMore").click(function () {
            window.open("${global_url}navTo?url=home/businessProcess/createIc");
        });

        $(".sub-5 .table-top ul .card_li").click(function () {
            var clickLiId = $(this).prop("id");
            setLossHistory(clickLiId.substr(6,clickLiId.length-1));
        });
        function setLossHistory(cId) {
            var sub5_gridData = {
                ajac: {
                    url: "${global_url}personalLoss/getLossPage",//请求地址
                    method: "post",//请求方法
                    data: {
                        cardId:cId
                    },//请求条件
                    dataType: "json",
                    beforeSend:function () {
                        // my_layer.open();
                    },
                    overSend:function () {
                        // my_layer.close();
                    }
                },
                columnId:true,//显示列表序号（自增）
                columns:[
                    {title:"IC卡号", name:"cardId",       width:"10",hidden:false,align:"center"},
                    {title:"操作类型", name:"handleType", width:"20",hidden:false,align:"center"},
                    {title:"操作日期", name:"handelDate",   width:"30",hidden:false,align:"center"},
                    {title:"操作结果", name:"handleResult",   width:"20",hidden:false,align:"center"},
                    {title:"备注",    name:"handelMark",   width:"20",hidden:false,align:"center"}
                ],//数据集合
                multi_select:true,//是否多选
                pages:[5,10,20,50,100],//每页多少天，选项
            };

            //绑定把表格数据
            dataGrid.grid($(".sub-5 .table-bottom"),sub5_gridData);
        }
    }
    function setCardsError() {
        let _cardList_html_ =" <ul>";
        $(".sub-5 .table-top ul").remove();

        _cardList_html_ += " <li class='error_li'>" +
            "    <span class='error e_l_t'>没</span><!--" +
            "    --><span class='error e_r_t'>有</span><!--" +
            "    --><span class='error e_l_b'>数</span><!--" +
            "    --><span class='error e_r_b'>据</span>" +
            "    <span class='move-target'></span>" +
            "</li></ul>";

        $(".sub-5 .table-top").append(_cardList_html_);
    }
</script>
<!--sub-6注销-->
<script>
    var sub6_gridData = {
        ajac: {
            url: "${global_url}balance/page",//请求地址
            method: "post",//请求方法
            data: {
                uid:uid
            },//请求条件
            dataType: "json",
            beforeSend:function () {
                // my_layer.open();
            },
            overSend:function () {
                // my_layer.close();
            }
        },
        columnId:true,//显示列表序号（自增）
        columns:[
            {title:"id",      name:"id",width:"5",hidden:true,align:"center"},
            {title:"变更类型", name:"type",       width:"15",hidden:false,align:"center"},
            {title:"变更金额", name:"money", width:"10",hidden:false,align:"center"},
            {title:"操作账号", name:"operatorUser",   width:"10",hidden:false,align:"center"},
            {title:"余额",     name:"balance",   width:"10",hidden:false,align:"center"},
            {title:"时间",     name:"time",   width:"20",hidden:false,align:"center"},
            {title:"备注",     name:"note",    width:"25",hidden:false,align:"center"},
        ],//数据集合
        btns:[
            {
                id:"add_logout",
                txt:"添加",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                click:function () {
                    addRow();
                }
            },
            {
                id:'print_logout',
                txt:"打印",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                click:function () {
                    printData();
                }
            },
            {
                id:"import_logout",
                txt:"导入",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                click:function () {
                    importData();
                }
            },
            {
                id:'export_logout',
                txt:"导出",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                click:function () {
                    exportData();
                }
            },
            {
                id:'remove_logout',
                txt:"移除",
                icon:"add-icon",
                btn_style:"alter",//normal、alter、msg
                click:function () {

                }
            },
            {
                id:'reflush_logout',
                txt:"刷新",
                icon:"add-icon",
                btn_style:"msg",//normal、alter、msg
                click:function () {
                    reloadData();
                }
            }
        ],
        multi_select:true,//是否多选
        pages:[5,10,20,50,100],//每页多少天，选项
    };

    //绑定把表格数据
    dataGrid.grid($(".sub-6 .table-bottom"),sub6_gridData);
    $("#reflush_logout").click(function () {
        dataGrid.reload($(".sub-6 .table-bottom"),sub6_gridData)
        // alert(dataGrid.getSelection($(".sub-6 .table-bottom")));
    });
</script>
<!--sub-7账号变更-->
<script>
    $("#a").click(function () {
        $(".sub-7 .change-account").animate({
            opacity:'0',
            width: '0',
            height: '0'
        },800);
        $(".sub-7 .sure_change").animate({
            opacity:'1',
            width: '500px',
            height: '400px'
        },800);
    });
    $(".sub-7 .sure_tip").click(function () {
        $(".sub-7 .change-tip").removeClass("change-tip_animation");
        $(".sub-7 .change-tip").animate({
            width:'0px',
            height:'0px',
            top:'-1000px',
            opacity:'0'
        },{duration:1000,complete:function () {
                $(".sub-7 .change-tip").animate({
                    width:'500px',
                    height:'300px'
                },1);
            }});
        $(".sub-7 .change-account").animate({
            opacity:'1',
            width: '80%',
            height: '80%'
        },800);
    });
    $(".sub-7 .show_app_tip").click(function () {
        $(".sub-7 .change-account").animate({
            opacity:'0',
            width: '0',
            height: '0'
        },800);
        $(".sub-7 .change-tip").addClass("change-tip_animation");
    });


    $(".sub-7 .show_my_app").click(function () {
        $(".sub-7 .change-account").animate({
            opacity:'0',
            width: '0',
            height: '0'
        },800);
        $(".sub-7 .my_approve").animate({
            opacity:'1',
            width: '500px',
            height: '400px'
        },800);
    });


    $(".sub-7 .show_my_identify").click(function () {
        $(".sub-7 .change-account").animate({
            opacity:'0',
            width: '0',
            height: '0'
        },800);
        $(".sub-7 .my_identify").animate({
            opacity:'1',
            width: '500px',
            height: '400px'
        },800);
    });


    $(".sub-7 .close_app").click(function () {
        $(this).parent("div").parent("div").animate({
            opacity:'0',
            width: '0',
            height: '0'
        },800);
        $(".sub-7 .change-account").animate({
            opacity:'1',
            width: '80%',
            height: '80%'
        },800);
    });
</script>
<!--sub-8账号安全-->
<script>
    $(".sub-8 .modify-bottom .confuse_modify_pwd").click(function () {
        $(".sub-8 .modify-top input[type='password']").val("");
    });

    var password_leavel = 0;
    $(".sub-8 .modify-bottom .sure_modify_pwd").click(function () {
        let _pwd_ = $("#new_pwd").val();
        let _new_pwd_ = $("#ack_new_pwd").val();
        if(typeof (_pwd_) == "undefined" || typeof (_new_pwd_) == "undefined"){
            my_tip.tip("输入内容不完整！",1,'.sub-8',[{cssName:'background-color',cssValue:'crimson'},{cssName:'color',cssValue: '#fff'}]);
            return;
        }
        if(password_leavel<2){
            my_tip.tip("新密码不符合要求！",1,'.sub-8',[{cssName:'background-color',cssValue:'crimson'},{cssName:'color',cssValue: '#fff'}]);
            return;
        }
        if(_pwd_ != _new_pwd_){
            my_tip.tip("密码前后不一致！",1,'.sub-8',[{cssName:'background-color',cssValue:'crimson'},{cssName:'color',cssValue: '#fff'}]);
            return;
        }
        // $.ajax();
    });


    $("#new_pwd").focus(function(){     //光标定位在密码框上绑定的事件
        $("#pwdLevel_1").attr("class","red_line1");
        $("#tbPassword").keyup();    //调用keyup()事件
    });
    $("#new_pwd").keyup(function(){      //为密码框绑定keyup事件
        var _th=$(this);
        if(!_th.val()){             //判断非空
            console.log(_th.val());
            $("#pwd_tip").hide();     //默认提示语隐藏
            $("#pwd_err").show();     //错误信息显示
            Primary();      //调用Primary(),改变密码强度条显示的样式
            return;
        }
        if(_th.val().length<6){     //判断密码长度是否<6
            $("#pwd_tip").hide();   //默认提示语隐藏
            $("#pwd_err").show();   //错误信息显示
            Weak();  //调用Weak(),改变密码强度条显示的样式
            return;
        }
        var _r=checkPassword(_th);    //调用checkPassword(_th),验证密码格式，返回整数值(true和false相加后的值)，赋值给变量_r
        if(_r<1){
            $("#pwd_tip").hide();
            $("#pwd_err").show();
            Primary();   //调用Primary(),改变密码强度条显示的样式
            return;
        }
        if(_r>0&&_r<2){
            Weak();    //调用Weak(),改变 密码强度条显示的样式
        }else if(_r>=2&&_r<4){
            Medium();  //调用Medium(),改变密码强度条显示的样式
        }else if(_r>=4){
            Tough();   //调用Tough(),改变密码强度条显示的样式
        }
        $('#pwd_tip').hide();
        $('#pwd_err').hide();
    });
    //"弱、中、强"对应的条为灰色
    function Primary(){
        $("#pwdLevel_1").attr("class","leave");
        $("#pwdLevel_2").attr("class","leave");
        $("#pwdLevel_3").attr("class","leave");
        $("#levelText_1").css("display",'none');
        $("#levelText_2").css("display",'none');
        $("#levelText_3").css("display",'none');
        password_leavel = 0;
    }
    //"弱"对应的条高亮
    function Weak(){
        $("#pwdLevel_1").addClass("red_line1");
        $("#pwdLevel_2").attr("class","leave");
        $("#pwdLevel_3").attr("class","leave");
        $("#levelText_1").css("display",'inline-block');
        $("#levelText_2").css("display",'none');
        $("#levelText_3").css("display",'none');
        password_leavel = 1;
    }
    //"弱、中"对应的条高亮
    function Medium(){
        $("#pwdLevel_1").addClass("red_line1");
        $("#pwdLevel_2").addClass("red_line2");
        $("#pwdLevel_3").attr("class","leave");
        $("#levelText_1").css("display",'none');
        $("#levelText_2").css("display",'inline-block');
        $("#levelText_3").css("display",'none');
        password_leavel = 2;
    }
    //"弱、中、强"对应的条高亮
    function Tough(){
        $("#pwdLevel_1").addClass("red_line1");
        $("#pwdLevel_2").addClass("red_line2");
        $("#pwdLevel_3").addClass("red_line3");
        $("#levelText_1").css("display",'none');
        $("#levelText_2").css("display",'none');
        $("#levelText_3").css("display",'inline-block');
        password_leavel = 3;
    }
    //验证密码格式
    function checkPassword(pwdinput){
        var maths,smalls,bigs,corps,cat,num;
        var str=$(pwdinput).val();   //输入框密码值
        var len=str.length;         //密码长度
        var cat=/.{16}/g;            //匹配16个字符，除了换行和行结束符
        if(len==0){                  //如果密码长度为0，返回1
            return 1;
        }
        if(len>16){   //如果密码长度超过16位，则密码框内只显示前16位
            $(pwdinput).val(str.match(cat)[0]);
            console.log(str.match(cat)[0]);
        }
        cat=/.*[\u4e00-\u9fa5]+.*$/;   //匹配是否含有汉字
        if(cat.test(str)){      //如果含有汉字，返回-1
            return -1;
        }
        cat=/[0-9]/;    //匹配是否含有数字
        maths=cat.test(str);
        cat=/[a-z]/;  //匹配是否含有小写字母
        smalls=cat.test(str);
        cat=/[A-Z]/;   //匹配是否含有大写字母
        bigs=cat.test(str);
        corps=corpses(pwdinput);    //调用corpses(pwdinput)方法，验证密码框内的值是否同时含有数字、大小写字母
        num = maths + smalls + bigs + corps;    //maths、smalls、bigs、corps为true或false,true表示1,false表示0
        if(len<6){    //如果密码长度<6,返回1
            return 1;
        }
        if(len>=6&&len<=8){   //如果密码长度>=6&&<=8
            if(num==1 || num==2) return 1;   //如果值中包含数字、小写字母、大写字母、特殊符号中的1种或2种,则返回1
            if(num==3 || num==4) return 2; //如果值中包含数字、小写字母、大写字母、特殊符号中的3种或4种,则返回2
        }
        if(len>8){
            if(num==1) return 1;
            if(num==2 || num==3) return 2;
            if(num==4) return 4;
        }
    }
    function corpses(pwdinput){     //该方法匹配字符串中是否包含特殊字符(即除去大小写字母和数字)
        var cat=/./g;   //匹配单个字符，除了换行和行结束符
        var str=$(pwdinput).val();   //获取密码框内的值
        var sz=str.match(cat);    //匹配单个字符，除了换行和行结束符,返回结果为数组sz
        for(var i=0;i<sz.length;i++){    //循环匹配数组中的每个字符，进行验证
            cat=/[0-9]/;    //匹配是否含有数字
            var maths_01=cat.test(sz[i]);
            cat=/[a-z]/;  //匹配是否含有小写字母
            var smalls_01=cat.test(sz[i]);
            cat=/[A-Z]/;   //匹配是否含有大写字母
            var bigs_01=cat.test(sz[i]);
            if(!maths_01&&!smalls_01&&!bigs_01){   //如果匹配的字符串包含特殊字符，则返回true，否则返回false
                return true;
            }
        }
        return false;
    }
</script>
<!--sub-9-->
<script>
    (function ($) {
        $.show_tip = function (arg) {
            this.msg = "不知道为什么，忽然就弹出了一条信息";
            this.location = 1;
            this.parentNode = 'body';
            this.css = [];//[{cssName:'',cssValue:''}]
            this.showFun =function (arg) {
                var uuid = (Math.random()*10000000).toString(16).substr(0,4)+'-'+(new Date()).getTime()+'-'+Math.random().toString().substr(2,5);
                if(typeof (this.parentNode) == "undefined" || typeof ($(this.parentNode))=="undefined"){
                    // console.log($('body').find(".my_tip").length)
                    //
                    // if($('body').find(".my_tip").length<=0)
                    $('body').prepend("<div class='my_tip' id='"+uuid+"'><div><span>"+this.msg+"</span></div></div>");
                }else{
                    // console.log($(parentNode).find(".my_tip").length)
                    // if($(parentNode).find(".my_tip").length<=0)
                    $(this.parentNode).prepend("<div class='my_tip' id='"+uuid+"'><div><span>"+this.msg+"</span></div></div>");
                }

                if(typeof (this.location) =="undefined"|| this.location==="top" || this.location==="" || this.location ==1){
                    $(".my_tip").css("top",'10%');
                }else if(this.location === 'top'|| this.location ==2){
                    $(".my_tip").css("center",'50%');
                }else if(this.location === 'bottom'|| this.location ==3){
                    $(".my_tip").css("top",'90%');
                }else{
                    $(".my_tip").css("top",'10%');
                }

                // if(typeof (this.msg) =="undefined"|| this.msg===""){
                //     $(".my_tip").html("不知道为什么，忽然就弹出了一条信息");
                // }else{
                $(".my_tip").html(this.msg);
                // }

                if(typeof (this.css) != "undefined") {
                    for(let cssIndex = 0; cssIndex < this.css.length; cssIndex++) {
                        $(".my_tip").css(this.css[cssIndex].cssName, this.css[cssIndex].cssValue);
                    }
                }

                $(".my_tip").css("display","inline-block");

                $(".my_tip").animate({
                    opacity: 1,
                    top: '-=2%'
                    // width: my_tipW,
                    // left: my_left - my_tipW/2
                },100);
                $(".my_tip").animate({transform: 'translate(-50%,-50%) scale(1)',top:'+=4%'},800);
                $(".my_tip").animate({
                    opacity: 0,
                    top: "-=10%"
                    // dispaly: 'none',
                    // width: 0,
                    // left: my_left + my_tipW
                }, {duration:500,complete:function () {
                        $('#'+uuid).detach();

                    }});
            };
            this.setMsg = function (val) {
                if(typeof (val) != "undefined")
                    this.msg = val;
            }
            this.getMsg = function () {
                return this.msg;
            }
            this.setLocation = function (val) {
                if(typeof (val) != "undefined")
                    this.location = val;
            }
            this.setLocation = function () {
                return this.location;
            }
            this.setParentNode = function (val) {
                if(typeof (val) != "undefined") this.parentNode = val;
            }
            this.getParentNode = function () {
                return this.parentNode;
            }
            this.setCss = function (val) {
                if(typeof (val) != "undefined") this.css = val;
            }
            this.getCss = function () {
                return this.css;
            }
        };

    })(jQuery);


    var my_tip = {
        tip: function show(msg,location,parentNode,css) {
            var action =new $.show_tip();
            action.setMsg(msg);
            action.setLocation( location);
            action.setParentNode(parentNode);
            action.setCss(css);
            action.showFun();
        }
    }
</script>

<script>
    cssMap = [
        {cssName:"width",cssValue:'100px'},
        {cssName:"background-color",cssValue:'var(--sub_color)'},
        {cssName:"color",cssValue:'#fff'},
        {cssName:"z-index",cssValue:"20"}
    ];
    elemTitle.gridTitle($("#a_1 a"),"我的信息",cssMap);
    elemTitle.gridTitle($("#a_2 a"),"账户余额",cssMap);
    elemTitle.gridTitle($("#a_3 a"),"卡片中心",cssMap);
    elemTitle.gridTitle($("#a_4 a"),"我的消费",cssMap);
    elemTitle.gridTitle($("#a_5 a"),"挂失记录",cssMap);
    elemTitle.gridTitle($("#a_6 a"),"注销记录",cssMap);
    elemTitle.gridTitle($("#a_7 a"),"账号变更",cssMap);
    elemTitle.gridTitle($("#a_8 a"),"登录安全",cssMap);

</script>
</body>
</html>
