<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/4
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的主页</title>
    <script src="http://localhost:8080/nchkkjxy/theame/js/jquery-3.6.0.js"></script>
    <script src="http://localhost:8080/nchkkjxy/theame/js/baseJs.js"></script>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/nchkkjxy/font/iconfont.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
    <style>
        *{
            margin: 0;
            padding: 0;
            -o-user-select: none;
            -moz-user-select: none; /*火狐 firefox*/
            -webkit-user-select: none; /*webkit浏览器*/
            -ms-user-select: none; /*IE10+*/
            -khtml-user-select :none; /*早期的浏览器*/
            user-select: none;
        }
        .mine-box{
            position: relative;
            width: 100%;
            height: 100%;
        }
        .mine-top{
            background-color: #c7254e;
            position: fixed;
            top: 0;
            width: 100%;
            height: 15%;
        }
        .mine-left,
        .mine-right{
            height: 85%;
            top: 15%;
        }
        .mine-left{
            width: 10%;
            background-color: #fff;
            top: 15%;
            position: fixed;
            display: inline-block;
        }

        .mine-left ul{
            width: 100%;
            height: 10%;
            list-style: none;
        }
        .mine-left ul li{
            position: relative;
            width: 100%;
            /*height: 100%;*/
            padding-top: 20px;
            padding-bottom: 20px;
            font-size: 14px;

            background-color: #fff;
            color: var(--sub_color);
            cursor: pointer;
            text-align: left;
            transition: all 0.8s;
        }
        .mine-left ul li:hover{

            background-color: var(--sub_color);
            color: #fff;
            /*text-align: center;*/
        }
        .mine-left ul li a{
            color: var(--sub_color);
            margin-left: 10px;
            outline: none;
            text-decoration: none;
        }
        .mine-left ul li:hover a{
            animation:move_center 0.5s ease-in;
            animation-fill-mode: forwards;
            color: #fff;
        }

        @keyframes move_center {
            0%{}
            100%{
                margin-left: 40px;
                font-weight: 800;
            }
        }

        .mine-right{
            width: 90%;
            left: 10%;
            background-color: #fff;
            position: fixed;
            display: inline-block;
            /*border-left: 1px solid #aaa;*/
        }
        .mine-right .content{
            width: 100%;
            height: 100%;
            overflow-y: scroll;
            background-color: white;
            z-index: 20;
        }
        .mine-right .content{
            overflow: hidden;
        }
        /* 设置滚动条的样式 */
        .mine-right .content::-webkit-scrollbar {
            /*width:10px;*/
            /*border-radius: 20px;*/

            display: none !important;
        }
        /* 滚动槽 */
        .mine-right .content::-webkit-scrollbar-track {
            background-color: #fff;
            -webkit-box-shadow: var(--sub_color);
            border-radius:10px;
            display: none;
        }
        /* 滚动条滑块 */
        .mine-right .content::-webkit-scrollbar-thumb {
            background:var(--sub_color);
            border-radius: 20px;
            display: none;
        }
        .mine-right .content::-webkit-scrollbar-thumb:window-inactive {
            background:rgba(255,0,0,0.4);
            display: none;
        }




        .mine-right .content .sub-content{
            width: 100%;
            height: 100%;
        }
        .mine-right .content .sub-1{
            border-left: 2px solid #c77a03;
            /*background-color: #c74c19;*/
        }
        .mine-right .content .sub-2{
            border-left: 2px solid #c72631;
            /*background-color: #c7c22f;*/
        }
        .mine-right .content .sub-3{
            border-left: 2px solid #c73ab2;
            /*background-color: #7cc726;*/
        }
        .mine-right .content .sub-4{
            border-left: 2px solid #932ec7;
            /*background-color: #23c762;*/
        }
        .mine-right .content .sub-5{
            border-left: 2px solid #4e65c7;
            /*background-color: #33c6c7;*/
        }
        .mine-right .content .sub-6{
            border-left: 2px solid #25aac7;
            /*background-color: #345fc7;*/
        }
        .mine-right .content .sub-7{
            border-left: 2px solid #1bc779;
            /*background-color: #723fc7;*/
        }
        .mine-right .content .sub-8{
            border-left: 2px solid #7ec731;
            /*background-color: #c73a93;*/
        }
    </style>
<%--    //顶部横栏--%>
    <style>
        .bruce {
            height: 100%;
            /*height: 100%;*/
            /*background-image: linear-gradient(270deg, #8146b4, #6990f6);*/
            background-image: linear-gradient(270deg, var(--sub_color), #93bcc7);
        }

        .bubble-bgwall {
            overflow: hidden;
            position: relative;
            margin: 0 auto;
            /*width: 1200px;*/
            width: 120px;
            height: 100%;
            float:right;
            /*margin-right:10px;*/
        }
        .bubble-bgwall li {
            display: flex;
            position: absolute;
            bottom: -20px;
            /*justify-content: center;*/
            justify-content: right;
            align-items: right ;
            border-radius: 100%;
            width: 5px;
            height: 5px;
            /*width: 50px;*/
            /*height: 50px;*/
            /*background-color: rgba(0, 0, 0, 1);*/
            background-color: #fff;
            color: #ccc;
            animation: bubble 5s infinite;
        }
        .bubble-bgwall li:nth-child(1) {
            left: 10%;
        }
        .bubble-bgwall li:nth-child(2) {
            left: 20%;
            /*width: 90px;
            height: 90px;*/
            width: 9px;
            height: 9px;
            animation-duration: 7s;
            animation-delay: 2s;
        }
        .bubble-bgwall li:nth-child(3) {
            left: 25%;
            animation-delay: 4s;
        }
        .bubble-bgwall li:nth-child(4) {
            left: 40%;
            /*width: 60px;
            height: 60px;*/
            width: 6px;
            height: 6px;
            /*background-color: rgba(255, 255, 255, 0.3);*/
            background-color: #fff;
            animation-duration: 8s;
        }
        .bubble-bgwall li:nth-child(5) {
            left: 70%;
        }
        .bubble-bgwall li:nth-child(6) {
            left: 80%;
            width: 12px;
            height: 12px;
            /*width: 120px;
            height: 120px;*/
            /*background-color: rgba(255, 255, 255, 0.2);*/
            background-color: #fff;
            animation-delay: 3s;
        }
        .bubble-bgwall li:nth-child(7) {
            left: 32%;
            /*width: 160px;
            height: 160px;*/
            width: 16px;
            height: 16px;
            animation-delay: 2s;
        }
        .bubble-bgwall li:nth-child(8) {
            left: 55%;
            /*width: 40px;
            height: 40px;*/
            width: 4px;
            height: 4px;
            font-size: 12px;
            animation-duration: 15s;
            animation-delay: 4s;
        }
        .bubble-bgwall li:nth-child(9) {
            left: 25%;
            /*width: 40px;
            height: 40px;*/
            width: 4px;
            height: 4px;
            /*background-color: rgba(255, 255, 255, 0.3);*/
            background-color: #fff;
            font-size: 12px;
            animation-duration: 12s;
            animation-delay: 2s;
        }
        .bubble-bgwall li:nth-child(10) {
            left: 85%;
            /*width: 160px;
            height: 160px;*/
            width: 16px;
            height: 16px;
            animation-delay: 5s;
        }

        @keyframes bubble {
            0% {
                opacity: 0.5;
                transform: translateY(0) rotate(45deg) scale(1.0);
                border-radius: 100%;
            }
            /*25% {
              opacity: 0.75;
              transform: translateY(-40px) rotate(90deg) scale(1.2);
            }
            50% {
              opacity: 1;
              transform: translateY(-60px) rotate(135deg) scale(1.6);
            }*/
            100% {
                opacity: 0;
                transform: translateY(-100px) rotate(180deg) scale(2.2);
                border-radius: 100%;
            }
        }

        .bruce .logo {
            float:left;
            color: #fff;
            font-family: Helvetica, Arial, sans-serif;
            font-size: 2em;
            margin: 2em 0.5em 0 10px;
        }
        .bruce .logo .box-outer {
            border-radius:5px;
            display: inline-block;
            animation: shift 4.5s 1s steps(3, start) backwards;
            /*animation-iteration-count: infinite;*/
        }
        .bruce .logo .box-inner {
            display: inline-block;
            width: .74em;
            height: .74em;
            background-color: #fff;
            animation-name: roll;
            animation-duration: 2s;
            animation-delay: 2s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
            transform-origin: bottom right;
            border-radius:5px;
        }

        @keyframes roll {
            from{
                box-shadow: 5px 0 5px var(--sub_color);
                transform: translateX(-300%);
            }
            10% {
                opacity: 1;
                transform: translateX(-100%);
                animation-timing-function: ease-in-out;
            }
            20% {
                transform: translateX(-100%) skewX(15deg);
            }
            28% {
                transform: translateX(-100%) skewX(0deg);
                animation-timing-function: ease-out;
            }
            45% {
                box-shadow: 4px 6px 5px var(--sub_color);
                transform: translateX(-100%) skewX(-5deg) rotate(20deg) scale(1.1);
                animation-timing-function: ease-in-out;
            }
            50% {
                box-shadow: 2px 5px 5px var(--sub_color);
                transform: translateX(-100%) skewX(-5deg) rotate(45deg) scale(1.1);
                animation-timing-function: ease-in;
            }
            60% {
                transform: translateX(-100%) rotate(90deg);
                box-shadow: 0 5px 5px var(--sub_color);
            }
            65% {
                transform: translateX(-100%) rotate(90deg) skewX(10deg);
                box-shadow: -5px 0px 5px var(--sub_color);
            }
            70% {
                transform: translateX(-100%) rotate(90deg) skewX(0deg);
                box-shadow: 0 5px 5px var(--sub_color);
            }
            90%{
                border-radius: 50%;
                opacity: 1;
                box-shadow: 0 0 5px var(--sub_color);
                color: var(--sub_color);
            }
            to {

                transform: translateX(-100%) rotate(90deg);
                /*box-shadow: 0 0 5px var(--sub_color);*/
                color: #c7254e;
                opacity: 0;
            }
        }
        @keyframes shift {
            from {
                transform: translateX(-200%);
            }
        }
        .bruce .logo .logo-box{
            border-right: 2px solid #ccc;
        }
        .bruce .logo .logo-box,
        .bruce .logo .logo-model{
            border-bottom: 2px solid #ccc;
        }
    </style>
    <style type="text/css">
        .progressBar {
            margin-top:0;
            width:100%;
            height:1px;
            background: #ffffff;
            border-radius:0px;
        }
        .barContent {
            width: 12.5%;
            height: 1px;
            background: rgb(4, 167, 140);
            border-radius: 0;
            transition: width 1s;
        }
    </style>
    <!--    sub-1-->
    <style>
        #person-img,
        #person-img-new{
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: var(--sub_color);
        }
        .sub-1{
            position: relative;
        }
        .mine-box .mine-right .content .person-msg,
        .mine-box .mine-right .content .modify-panel{
            position: absolute;
            width: 80%;
            height: 80%;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            z-index: 5;
        }

        /*修改面板*/
        .mine-box .mine-right .content .modify-panel{
            display: none;
            background-color: #fff;
            z-index: 10;
        }

        .mine-box .mine-right .content .person-msg td,
        .mine-box .mine-right .content .modify-pane td{
            font-size: 14px;
            border-bottom: 1px solid #666;
        }
        #modify-user,
        #modify-user-ack{
            margin-right: 20px;
            width: 100px;
            height: 30px;
            /*margin-top: 10px;*/
            /*margin-bottom: 20px;*/
            color: var(--sub_color);
            background-color: #fff;
            cursor: pointer;
            font-size: 14px;
            font-weight: 400;
            transition: all var(--transform_slowily);
        }
        #modify-user:hover,
        #modify-user-ack:hover{
            background-color: var(--sub_color);
            color: #fff;
        }

        #msg-sex .my-radio label,
        #new-msg-sex .my-radio label{
            margin:  0 5px  !important;
        }
        #msg-sex .my-radio label input + span,
        #new-msg-sex .my-radio label input + span{
            margin-bottom: 0 !important;
        }

        #msg-headIcon,
        #new-msg-headIcon{
            border-radius: 50%;width: 100px;height: 100px;
            border: 5px solid #fff;
            box-shadow: 0 0 8px #666;
            transition: all 0.8s;
            transform: translateY(-40px);
            cursor: url('http://localhost:8080/nchkkjxy/pic/cursor_style/love.cur'),auto;
        }
        #msg-headIcon:hover,
        #new-msg-headIcon:hover{

            transform: scale(1.1) translateY(5px) translateZ(5px);
        }

        #msg-single,
        #new-msg-single{
            text-align: center;
            color: #333;
            display: inherit;
            transform: translateY(-20px);
        }
        #msg-headIcon:hover #msg-single,
        #new-msg-headIcon:hover #new-msg-single{
            transform: translateY(10px);
        }
        /*.head-bigger-to-view{*/
        /*    position: absolute;*/
        /*    display: inline-block;*/
        /*    width: 400px;*/
        /*    height: 400px;*/
        /*    top:50%;*/
        /*    left: 50%;*/
        /*    transform: translate(-50%,-50%);*/
        /*    border: 5px solid #fff;*/
        /*    background-position: center;*/
        /*    background-repeat: no-repeat;*/
        /*    background-size: 100% 100%;*/
        /*    z-index: 20;*/
        /*}*/
    </style>
    <!--    sub-2-->
    <style>
        .inline_block{
            display: inline-block;
        }
        .float_right{
            float: right;
        }
        .sub-2{
            position: relative;
        }
        .sub-2 .balance-box{
            position: absolute;
            width: 90%;
            height: 90%;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .sub-2 .balance-tab{
            width: 100%;
            height: 100px;
            background-color: var(--sub_color);border-radius: 5px;box-shadow: 0 0 10px var(--sub_color);
        }
        .sub-2 .balance-items{
            width: 100%;
            height: calc(100% - 100px);
            overflow: scroll;
            max-height: calc(100% - 100px);
            min-height: calc(100% - 100px);
        }


        /*.sub-2 .balance-items tbody {*/
        /*    display: block;*/
        /*    height: 300px;*/
        /*    overflow-y: scroll;*/
        /*    border-bottom: 1px solid var(--sub_color);*/
        /*    border-top: 1px solid var(--sub_color);*/
        /*}*/

        /*.sub-2 .balance-items tr {*/
        /*    display: table;*/
        /*    width: 100%;*/
        /*    height: 40px;*/
        /*    table-layout: fixed;!*重要  表格固定算法*!*/
        /*}*/

        /*.sub-2 .balance-items thead {!*留出滚动条的位置*!*/
        /*    width: calc(100% - 1em)*/
        /*}*/

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
                <a href="#sub-1" target="_self" title="我的信息">我的信息</a>
            </li>
            <li id="a_2">
                <a href="#sub-2" target="_self" title="账户余额">账户余额</a>
            </li>
            <li id="a_3">
                <a href="#sub-3" target="_self" title="卡片中心">管理卡</a>
            </li>
            <li id="a_4">
                <a href="#sub-4" target="_self" title="我的消费">我的消费</a>
            </li>
            <li id="a_5">
                <a href="#sub-5" target="_self" title="挂失记录">挂失记录</a>
            </li>
            <li id="a_6">
                <a href="#sub-6" target="_self" title="注销记录">注销记录</a>
            </li>
            <li id="a_7">
                <a href="#sub-7" target="_self" title="账号变更">账号变更</a>
            </li>
            <li id="a_8">
                <a href="#sub-8" target="_self" title="账号登录及安全" target="_top" title="悬停文本">账号安全</a>
            </li>
            <li>
                <a>退   出</a>
            </li>
        </ul>
    </div>
    <div class="mine-right">
        <div class="progressBar" id="progressBar">
            <div class="barContent" id="barContent"></div>
        </div>
        <div class="content">
            <div class="sub-content sub-1" name="sub-1">
                <table class="modify-panel">
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
                        <td align="center" colspan="4" style="padding-bottom: 0;margin-bottom: 0;height: 100px;">
                            <img src="D:/桌面/课程设计/UI/img/defult_man.png" id="new-msg-headIcon">
                            <span style="text-align: center;border-bottom: 1px solid #aaa;" id="new-msg-single">hello!!!</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                        <td align="left" width="25%">
                            <input type="text" name="uName" value="" id="new-msg-name" class="new-msg">
                        </td>
                        <td align="right" width="25%">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                        <td align="left" width="25%" id="new-msg-sex"><div class="my-radio"></div></td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                        <td align="left" width="25%">
                            <input type="tel" id="new-msg-phone" value="" class="new-msg">
                        </td>
                        <td align="right" width="25%">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                        <td align="left" width="25%">
                            <input type="email" id="new-msg-email" value="" class="new-msg">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">身份证件：</td>
                        <td align="left" width="25%" colspan="3">
                            <input type="text" id="new-msg-identify" value="" class="new-msg">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">生&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
                        <td align="left" width="25%" colspan="3">
                            <input type="date" id="new-msg-brithday" value="" class="new-msg">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="25%">用户类型：</td>
                        <td align="left" width="25%" colspan="3" id="new-msg-userType"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="right" style=" border-bottom: 0px solid #666;">
                            <input type="button" value="确    认" id="modify-user-ack">
                        </td>
                    </tr>
                </table>
                <table class="person-msg">
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
                            <span style="text-align: center;border-bottom: 1px solid #aaa;" id="msg-single">hello!!!</span>
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
                                <img src="" class="inline_block" alt="" style="width: 100px;height: 100px;border-radius: 5px;">
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
            <div class="sub-content sub-3" name="sub-3"></div>
            <div class="sub-content sub-4" name="sub-4"></div>
            <div class="sub-content sub-5" name="sub-5"></div>
            <div class="sub-content sub-6" name="sub-6"></div>
            <div class="sub-content sub-7" name="sub-7"></div>
            <div class="sub-content sub-8" name="sub-8"></div>
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
            url: "http://localhost:8080/nchkkjxy/personalInformation/get",
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
    //         "head_url":"http://localhost:8080/nchkkjxy/pic/head_icon/defult.png",
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
        console.log(uInfo);
        $("#msg-headIcon").prop("src",uInfo.head_url);//:修改头像
        $("#msg-single").html(uInfo.single);//:签名
        $("#msg-name").html(uInfo.name);//姓名
        let _sex_html = "";
        if(uInfo.sex == "男"){
            _sex_html = "<label for='msg-man' >" +
                        "        <input type='radio' name='sex' value='男' id='msg-man' checked>" +
                        "        <span>" +
                        "           <svg t='1635051158257' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='5451' width='16' height='16' style='font-weight: 800;'><path d='M575.943755 0C328.967874 0 127.987501 200.980373 127.987501 447.956254c0 109.689288 39.696123 210.379455 105.389708 288.271849l-54.194707 54.194707-87.991407-87.991407c-14.998535-14.998535-39.296162-14.998535-54.294698 0s-14.998535 39.296162 0 54.294698l88.091397 87.991407L11.298897 958.406406c-14.998535 14.998535-14.998535 39.296162 0 54.294697 7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097353-11.298897l113.688898-113.688897 87.991407 87.991407c7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097354-11.298897 14.998535-14.998535 14.998535-39.296162 0-54.294698l-87.991407-87.991407 54.194707-54.194707C365.5643 856.216385 466.254467 895.912509 575.943755 895.912509c246.975881 0 447.956254-200.980373 447.956255-447.956255S822.919637 0 575.943755 0z m0 819.120008c-204.680012 0-371.163754-166.483742-371.163753-371.163754S371.263744 76.792501 575.943755 76.792501 947.107509 243.276243 947.107509 447.956254 780.623767 819.120008 575.943755 819.120008z' fill='#27D0D8' p-id='5452'></path></svg>" +
                        "        </span>" +
                        "</label>";
        }else if(uInfo.sex == "女"){
            _sex_html = "<label for='msg-woman' class='sex-lab' id='woman-lab'>" +
                        "        <input type='radio' name='sex' value='女' id='msg-woman' checked>" +
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
        $("#new-msg-headIcon").prop("src",uInfo.head_url);//:修改头像
        $("#new-msg-single").val(uInfo.single);//:签名
        $("#new-msg-name").val(uInfo.name);//姓名

        let _new_msg_sex_html = "<label for='msg-man' >" +
                                "        <input type='radio' name='sex' value='男' id='msg-man'"+
                                ((uInfo.sex == "男")?" checked >":">") +
                                "        <span>" +
                                "           <svg t='1635051158257' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='5451' width='16' height='16' style='font-weight: 800;'><path d='M575.943755 0C328.967874 0 127.987501 200.980373 127.987501 447.956254c0 109.689288 39.696123 210.379455 105.389708 288.271849l-54.194707 54.194707-87.991407-87.991407c-14.998535-14.998535-39.296162-14.998535-54.294698 0s-14.998535 39.296162 0 54.294698l88.091397 87.991407L11.298897 958.406406c-14.998535 14.998535-14.998535 39.296162 0 54.294697 7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097353-11.298897l113.688898-113.688897 87.991407 87.991407c7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097354-11.298897 14.998535-14.998535 14.998535-39.296162 0-54.294698l-87.991407-87.991407 54.194707-54.194707C365.5643 856.216385 466.254467 895.912509 575.943755 895.912509c246.975881 0 447.956254-200.980373 447.956255-447.956255S822.919637 0 575.943755 0z m0 819.120008c-204.680012 0-371.163754-166.483742-371.163753-371.163754S371.263744 76.792501 575.943755 76.792501 947.107509 243.276243 947.107509 447.956254 780.623767 819.120008 575.943755 819.120008z' fill='#27D0D8' p-id='5452'></path></svg>" +
                                "        </span>" +
                                "</label>"+
                                "<label for='msg-woman' class='sex-lab' id='woman-lab'>" +
                                "        <input type='radio' name='sex' value='女' id='msg-woman' "+
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
        $("#new-msg-userType").html(uInfo.register_identify + "<font class='iconfont icon-wenhao' style='width: 5px;height: 5px;border-radius: 50%;background-color: #c7254e;color: #fff;'></font>");//用户类型（不可再此处修改）
    }
    function getUserInfo() {

        return  userInfo = {
            head_url:$("#new-msg-headIcon").html(),//:修改头像
            single:$("#new-msg-single").html(),//:签名
            name:$("#new-msg-name").html(),//：修改姓名
            sex:$("#new-msg-sex").html(),//:修改性别
            phone:$("#new-msg-phone").html(),//:修改手机号
            email:$("#new-msg-email").html(),//:修改邮箱
            identify_card:$("#new-msg-identify").html(),//:修改身份证
            brithday:$("#new-msg-brithday").html(),//:修改生日
            //register_identify:$("#new-msg-userType").html(),//:用户类型（不可再此处修改）
        };

    }
    //查看我的账户余额
    function toAccountBalance() {
        getBalance();
    }
    //管理我的ic卡
    function toManageCard() {

    }
    //查看我的消费
    function toMyConmue() {

    }
    //查看我的挂失记录
    function toLossCardDetial() {

    }
    //查看我的注销记录
    function toLogoutCardDetial() {

    }
    // 进行我的账号变更
    function toChangeAccountType() {

    }
    //账号安全管理
    function toAccountSafe() {

    }
    //退出机返回主页
    function exitAndBackHome() {
        window.location.replace("http://localhost:8080/nchkkjxy/");
    }
</script>
<!--sub-1-->
<script>
    $("#modify-user-ack").click(function () {
        $(".mine-box .mine-right .content .person-msg").find("*").css("opacity","0");
        $(".mine-box .mine-right .content .modify-panel").css("display","none");

        //异步提交
        my_tip.tip("修改成功！",1,'.sub-1',[{cssName:'opcaity',cssValue:'0.8'}]);
    });
    $("#modify-user").click(function () {
        $(".mine-box .mine-right .content .person-msg").find("*").css("opacity","0");
        $(".mine-box .mine-right .content .modify-panel").css("display","table");
    });
    $("#msg-headIcon,#new-msg-headIcon").click(function () {
        head_bigger_to_view.show("body",$(this).attr("src"));
    })
</script>
<!--sub-2-->
<script>

    $(".daliy-point").click(function () {
        // my_tip.tip("签到成功！余额奖励<font style='color:crimson;font-weight: 400;'>+0.01</font>",1,'.sub-2',[{cssName:'background-color',cssValue:'rgba(255,175,20,0.81)'}]);
        // let money_now = (parseFloat($("#money-balance").html())+0.01).toFixed(2)
        // $("#money-balance").html(money_now);
        // $(".balance-items tbody").prepend("<tr><td align='center'>1</td><td align='center'>签到</td><td align='center'>+0.01</td><td align='center'>xjh</td><td align='center'>" +
        //     money_now+"</td><td align='center'>" +
        //     (new Date()).Format() +"</td></tr>");
        $.ajax({
            url: "http://localhost:8080/nchkkjxy/balance/daily",
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
            url: "http://localhost:8080/nchkkjxy/balance/getBalance",
            method: "post",
            dataType: "json",
            data:{},
            beforeSend:function(){

            },
            success:function (data) {
                console.log(data);
                if(data.succeed == true){
                    console.log(data);
                    $("#money-balance").html(data.data);
                }
            },
            error:function () {
            }
        });
    }
    //数据绑定

    var uid = "10";
    var sub2_gridData = {
        ajac: {
            url: "http://localhost:8080/nchkkjxy/balance/page",//请求地址
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
<!--sub-3-->
<!--sub-4-->
<!--sub-5-->
<!--sub-6-->
<!--sub-7-->
<!--sub-8-->
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
<!--//时间-->
<script>
    Date.prototype.Format = function(formatStr)  {
        if(typeof (formatStr) =="undefined")
            formatStr = (new Date()).toLocaleString( );
        var str = formatStr;
        // var Week = ['日','一','二','三','四','五','六'];

        str=str.replace(/yyyy|YYYY/,this.getFullYear());
        str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));

        str=str.replace(/MM/,this.getMonth()>9?this.getMonth().toString():'0' + this.getMonth());
        str=str.replace(/M/g,this.getMonth());


        // str=str.replace(/w|W/g,Week[this.getDay()]);

        str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());
        str=str.replace(/d|D/g,this.getDate());

        str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());
        str=str.replace(/h|H/g,this.getHours());
        str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());
        str=str.replace(/m/g,this.getMinutes());

        str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());
        str=str.replace(/s|S/g,this.getSeconds());

        return str;
    }
</script>
</body>
</html>
