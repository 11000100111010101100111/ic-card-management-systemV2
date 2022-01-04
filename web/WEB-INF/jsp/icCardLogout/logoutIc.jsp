<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/17
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${global_url}font/iconfont.css">
        <link rel="stylesheet" type="text/css" href="${global_url}theame/css/baseCss.css">
        <link rel="stylesheet" type="text/css" href="${global_url}theame/css/mySelect.css">
        <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
        <script src="${global_url}theame/js/baseJs.js"></script>
        <link rel="shortcut icon" href="${global_url}pic/page-logout.ico" type="image/x-icon">
        <title>注销</title>
        <style>
            body{
                --color_1: #c7254e;
                --color_2: #277dc7;
                --color_3: #18c735;
                --color_4: #c7c610;
            }
            .logout-start-div{
                position: absolute;
                width: 100%;
                height: 100%;
                top:0;
                left:0;
                background-color: var(--sub_color);
                z-index: 2;
            }
            .logout-start-div .logout-start-div-sub{
                position: absolute;
                height: 70px;
                /*background-color: #c7254e;*/
                width:0;
                border-radius: 70px;
                border: 5px solid #fff;
                z-index: 2;
                filter: blur(10px);
            }
            .logout-start-div .logout-start-div-sub:nth-child(1){
                top:30%;
                left:-10%;
                transform: translate(-50%,50%) rotate(45deg);
                background-color: var(--color_1);
                animation: big-width 1.5s ease-in;
                animation-fill-mode: forwards;
            }
            .logout-start-div .logout-start-div-sub:nth-child(2){
                top:0;
                width: 0;
                left:0;
                transform: translate(-50%,-50%) rotate(45deg);
                background-color: var(--color_2);
                animation: big-width 1.5s ease-in;
                animation-fill-mode: forwards;
                animation-delay: 0.3s;
            }
            .logout-start-div .logout-start-div-sub:nth-child(3){
                width: 0;
                top:-35%;
                left:15%;
                transform: translate(-50%,50%)  rotate(45deg);
                background-color: var(--color_3);
                animation: big-width 1.5s ease-in;
                animation-fill-mode: forwards;
                animation-delay: 0.5s;
            }
            @keyframes big-width {
                from{width: 0}
                to{
                    width: 90%;
                    filter: blur(0px);
                }
            }

            .logout-start-div .logout-start-div-sub:nth-child(4){
                width: 0;
                top:58%;
                left:32%;
                transform: translate(-50%,50%)  rotate(-45deg);
                background-color: var(--color_4);
                /*transform: translate(0,-50px) rotate(45deg);*/
                animation: big-bth4 1.5s ease-in;
                animation-fill-mode: forwards;
                /*animation-delay: 1s;*/
            }
            @keyframes big-bth4 {
                from{width: 0;filter: blur(10px);}
                to{width: 100%;filter: blur(0px);}
            }
            .logout-start-div .logout-btn-div{
                position: relative;
                width: 100%;
                height: 100%;
                /*background-color: #c7254e;*/
                z-index: 1;
            }
            .logout-start-div .logout-btn-div .logout-btn{
                position: absolute;
                width: 0;
                height: 50px;
                font-size: 18px;
                font-weight: 800;
                border-radius: 50px;
                cursor: pointer;
                opacity: 0;
                transition: all var(--transform_slowily);
                animation: btn-start 1s ease-in;
                animation-delay: 1s;
                animation-fill-mode: forwards;
            }

            .logout-start-div .logout-btn-div .logout-btn:nth-child(1){
                top: calc(50% - 90px);
                left: calc(50% + 160px);
                transform: translate(-50%,-50%);
                border-color: var(--color_1);
                color: var(--color_1);
            }
            .logout-start-div .logout-btn-div .logout-btn:nth-child(1):hover{
                box-shadow: 0 0 10px var(--color_1);
                transform: translate(-50%,-50%) scaleX(1.2);
            }

            .logout-start-div .logout-btn-div .logout-btn:nth-child(2){
                top: 50%;
                left: calc(50% + 70px);
                transform: translate(-50%,-50%);
                border-color: var(--color_2);
                color: var(--color_2);
            }
            .logout-start-div .logout-btn-div .logout-btn:nth-child(2):hover{
                box-shadow: 0 0 10px var(--color_2);
                transform: translate(-50%,-50%) scaleX(1.2);
            }

            .logout-start-div .logout-btn-div .logout-btn:nth-child(3){
                top: calc(50% + 90px);
                left: calc(50% - 20px);
                transform: translate(-50%,-50%);
                border-color: var(--color_3);
                color: var(--color_3);
            }
            .logout-start-div .logout-btn-div .logout-btn:nth-child(3):hover{
                box-shadow: 0 0 10px var(--color_3);
                transform: translate(-50%,-50%) scaleX(1.2);

            }
            @keyframes btn-start {
                from{}
                to{
                    width: 120px;
                    border:  5px solid;
                    opacity: 1;
                }
            }




            .logout-panel{
                position: absolute;
                left: 50%;
                top:100%;
                width: 0;
                height: 0;
                transform:translate(-50%,-50%);
                z-index: 5;
                border-radius: 5px;
                box-shadow: 0 0 10px #666;
                backdrop-filter: blur(8px);
                -webkit-backdrop-filter: blur(8px);
                overflow-y: auto;
            }
            .logout-panel .close{
                position: absolute;
                top: 5px;
                left: 50%;
                transform: translateX(-50%);
                width: 60px;
                height: 20px;
                border-radius: 10px;
                background-color: #fff;
            }
            .logout-panel .close span{
                position: absolute;
                left: 50%;
                top:50%;
                transform: translate(-50%,-50%);
                width: 15px;
                height: 2px;
                background-color: var(--color_1);
                transition: all var(--transform_slowily);
            }
            .logout-panel .close:hover{
                box-shadow: 0 0 8px var(--color_1);
            }
            .logout-panel .close:hover span:nth-child(1){
                transform: translate(-50%,-50%) rotate(45deg);
            }
            .logout-panel .close:hover span:nth-child(2){
                transform: translate(-50%,-50%) rotate(-45deg);
            }
            .logout-card{
                /*background-color: var(--color_1);*/
            }
            .logout-history{
                /*background-color: var(--color_2);*/
            }


            .logout-title{
                position: absolute;
                width: 400px;
                height: 300px;
                top: 100%;
                left: 100%;
                transform: translate(0,0) rotate(-45deg);
                background-color: #fff;
                z-index: 2;
                box-shadow: 0 0 10px #666;
                animation: span-start 2s ease-in;
                animation-fill-mode: forwards;
            }
            .logout-title span{
                position: absolute;
                top: 15%;
                left: 50%;
                transform: translate(-50%,-50%);
                font-size: 50px;
                color: var(--sub_color);
                font-weight: 600;
            }
            @keyframes span-start {
                from{}
                to{
                    /*top: 50%;*/
                    /*left: 50%;*/
                    transform: translate(-50%,-50%) rotate(-45deg);
                }
            }

            /*导航栏*/
            .logout-nav{
                position: absolute;
                list-style: none;
                top:20%;
                left:100%;
                transform: translate(-50%,-50%);
                width: 80px;
                z-index: 5;
            }
            .logout-nav li{
                display: inline-block;
                left:0;
                width: 100%;
                height: 30px;
                border-radius:40px;
                margin-bottom: 20px;
                transition: all var(--transform_slowily);
                padding: 2px 3px;
                border: 5px solid transparent;
            }
            .logout-nav li:hover{
                background-color: #fff;
                transform: translateX(-40%);
                border: 5px solid var(--color_3);
            }

            .logout-nav li a{
                position: relative;
                outline: none;
                text-decoration: none;
                font-size: 30px;
                width: 100%;
                height: 100%;
                background-color: #fff;
                color: var(--sub_color);
                border-radius:40px;
                transition: all var(--transform_slowily);
            }
            .logout-nav li a font{
                font-size: 18px;
                color: var(--sub_color);
            }

            .logout-panel .card-msg-div{
                position: relative;
                width: 90%;
                height: 90%;
                top:5%;
                left:5%;
            }
            .logout-panel .card-msg-div .card-msg img{
                /*width: 25%;*/
                /*height: 33%;*/
                width: 100%;
                height: 100%;
                border-radius: 5px;
                border: 2px solid #fff;
            }
            .logout-panel .card-msg-div .card-msg .base-msg{
                display: inline-block;
                height: 33%;
            }
            .logout-panel .card-msg-div .card-msg .left-msg{
                width: 25%;
            }
            .logout-panel .card-msg-div .card-msg .right-msg{
                float: right;
                width: 50%;
            }
            .logout-panel .card-msg-div .card-msg .right-msg span{
                display: block;
                color: #fff;
                font-size: 16px;
                margin: 10px;
                text-align: right;
            }
            .logout-panel .card-msg-div .card-msg .right-msg span font{
                margin-left: 10px;
                font-size: 25px;
            }
            .logout-panel .card-msg td{
                padding: 10px 5px;
                font-size: 16px;
                font-weight: 800;
                color: var(--sub_color);
            }

            .logout-panel table {
                border-collapse: collapse;
                width: 100%;
            }

            .logout-panel .card-msg th, .logout-panel .card-msg  td {
                /*text-align: left;*/
                padding: 8px;
            }
            .logout-panel .card-msg  tr:nth-child(1){
                background-color: transparent;
            }
            .logout-panel .card-msg  tr:nth-child(2){
                background-color: #aaa;

            }
            .logout-panel .card-msg  tr:nth-child(2) td{
                color: #fff;
            }
            .logout-panel .card-msg  tr{background-color: #f2f2f2}

            .logout-panel .card-msg  th {
                background-color: #fff;
                border-radius: 5px;
                color: white;
            }

            .logout-panel .sure-to-logout-btn{
                width: 80px;
                height: 30px;
                font-size: 14px;
                font-weight: 400;
                color: var(--sub_color);
                background-color: #fff;
                border-radius: 5px;
                cursor: pointer;
                transition: all var(--transform_slowily);
            }
            .logout-panel .sure-to-logout-btn:hover{
                box-shadow: 0 0 10px #555;
            }
        </style>

        <style>
            .loss-panel-ack-email{
                position: fixed;
                /*top:50%;*/
                left: 50%;
                top: -150%;
                transform: translate(-50%,-50%);
                width: 600px;
                height: 450px;
                border-radius: 5px;
                background-color: #fff;
                box-shadow:  0 0 6px #666;
                z-index: 30;
            }
            .loss-panel-ack-email .close{
                position: absolute;
                top:0;
                left: 100%;
                transform: translateX(calc(-100% - 5px));
                float: right;
                margin-top: 5px;
                width: 20px;
                height: 20px;
                font-size: 20px;
                padding: 3px;
                border-radius: 50%;
                text-align: center;
                background-color: var(--sub_color);
                cursor: pointer;
                transition: all var(--transform_slowily);
                color: var(--sub_color);
            }
            .loss-panel-ack-email .close:hover{
                background-color: #c7254e;
                color: #fff;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 90%;
                height: 90%;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .sub-title{
                border-left: 3px solid var(--sub_color);
                margin: 20px 0;
                padding-left: 5px;
                color: var(--sub_color);
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email{
                width: 100%;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .div{
                width: 100%;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email h3{
                border-left: 2px solid var(--sub_color);
                margin: 10px 0;
                padding-left: 5px;
                color: var(--sub_color);
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .email{
                width: 100%;
                text-align: center;
                font-size: 16px;
                padding: 5px 0;
                color: var(--sub_color);
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .ack-email-code{
                width: calc(100% - 96px);
                text-align: center;
                font-size: 16px;
                padding: 5px 0;
                margin: 5px 5px 5px 0;
                color: var(--sub_color);
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email{
                width: 80px;
                text-align: center;
                font-size: 16px;
                padding: 5px 0;
                margin: 5px 0 5px 0;
                background-color: #4e65c7;
                color: #fff;
                font-weight: 800;
                border: none;
                outline: none;
                cursor: pointer;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email:hover{
                box-shadow: none;
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email:focus{
                border: none;
                outline: none;
                animation:send-email 0.6s linear ;
                animation-iteration-count: 2;
                /*animation-fill-mode: forwards;*/
            }
            @keyframes send-email {
                from{
                    box-shadow: 0 0 0 #4e65c7;
                }
                10%{
                    box-shadow: -5px -5px 8px #4e65c7;
                }
                50%{
                    box-shadow: 5px 5px 8px #4e65c7;
                }
                90%{
                    box-shadow: -5px -5px 8px #4e65c7;
                }
                to{
                    box-shadow: 0 0 0 #4e65c7;
                }
            }

             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email textarea{
                width: 100%;
                max-width: 100%;
                min-width: 100%;
                resize: none;
                padding: 5px;
                font-size: 12px;
                text-align: left;
                color: var(--sub_color);
            }

             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .bottom-btn-panel{
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translate(-50%,-100%);
            }
             .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .bottom-btn-panel .sure-loss-btn{
                width: 90px;
                height: 30px;
                font-size: 14px;
                font-weight: 600;
                background-color: var(--sub_color);
                color: #fff;
                cursor: pointer;
            }
        </style>

        <style>
            .card-history-div{
                background-color: #fff;
            }
            .card-history-div .loss-history{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 0;
                height: 0;
                border-radius: 5px;
                opacity: 1;
                z-index: 30;
                background-color: #fff;
                box-shadow: 0 0 6px #666;
            }
            .card-history-div .loss-history .loss-history-sub{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 90%;
                height: 90%;
            }
            .card-history-div .loss-history .loss-history-sub .history-left{
                width: calc(50% - 1px);
                height: 100%;
                overflow: auto;
                float: left;
                /*background-color: #c7254e;*/
            }
            #konwHistory{
                width: 100px;
                height: 30px;
                font-size: 14px;
                font-weight: 800;
                color: var(--sub_color);
                transition: all var(--transform_slowily);
                margin: 40px auto;
            }
            #konwHistory:hover{
                color: #fff;
                background-color: var(--sub_color);
            }
            .card-history-div .loss-history .loss-history-sub .mid-line{
                float: left;
                height: 100%;
                width: 2px;
                border-radius: 1px;
                background-color: #aaa;
            }
            .card-history-div .loss-history .loss-history-sub .history-right{
                position: relative;
                float: right;
                width: calc(50% - 1px);
                height: 100%;
                overflow: auto;
                /*background-color: #4e65c7;*/
            }
            .card-history-div .loss-history .loss-history-sub .history-font{
                font-size: 13px;
                padding: 3px;
                margin: 3px;
                border-radius: 5px;
                border: 1px solid var(--sub_color);
                float: left;
            }
            .card-history-div .loss-history .loss-history-sub .card_img{
                width: 100px;
                height: 60px;
            }
            .card-history-div .loss-history .loss-history-sub ul{
                list-style: none;
            }
            .card-history-div .loss-history .loss-history-sub .history-right ul{
                padding: 10px 5px;
                box-shadow: 0 0 8px #999;
                margin: 5px;
                /*background-color: #4e65c7;*/
            }
            .card-history-div .loss-history .loss-history-sub ul li{
                width: 100%;
                text-align: center;
                font-size: 16px;
                margin: 20px auto;
            }
            /*.row-line{*/
            /*    !*position: absolute;*!*/
            /*    width: 100%;*/
            /*    height: 2px;*/
            /*    margin: 10px auto;*/
            /*    border-radius: 2px;*/
            /*    background-color: #aaa;*/
            /*}*/
        </style>

        <style>
            .card-msg-div .table-top{
                width: 100%;
                position: relative;
                box-shadow: 0 0 5px #666;
                height: 150px;
            }
            .card-msg-div .table-top ul{
                position: absolute;
                display: inline;
                list-style: none;
                top:0;
                left:0;
                background-color: #fff;
                overflow-x: scroll;
                width: calc(100% - 20px);
                height:  calc(100% - 10px);
                padding: 10px 10px 0 10px;
                white-space: nowrap;
                overflow-y: hidden;
            }
            .card-msg-div .table-top ul li{
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
            .card-msg-div .table-top ul .more{
                width: calc( (100% - 20px)/7 );
                height: calc(100% - 10px);
                background-color: #fff;
                box-shadow: 0 0 6px #999;
            }
            .card-msg-div .table-top ul .card_li:first-child{
                margin-left: 0;
            }
            .card-msg-div .table-top ul .card_li:hover{
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
            .card-msg-div .table-top{
                position: relative;
                /*overflow-x: visible;*/
                overflow-x: visible;
            }
            .card-msg-div .table-top ul .loss_li_span {
                position: absolute;
                /*width: 100%;*/
                /*height: 33%;*/
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 8px;
                padding: 1px 3px;
            }
            .card-msg-div .table-top ul .loss_li_span_01{
                font-size: 14px;
                top:0;
                left:0;
                text-align: left;
                /*width: calc(100% - 10px);*/
                margin: 10px 0 0 10px ;
            }
            .card-msg-div .table-top ul .loss_li_span_02{
                font-size: 24px;
                top:50%;
                left:50%;
                text-align: center;
                transform: translate(-50%,-50%);
            }
            .card-msg-div .table-top ul .loss_li_span_03{
                font-size: 14px;
                top:100%;
                left:100%;
                text-align: right;
                margin: 0 10px 10px 0;
                /*width: calc(100% - 10px);*/
                transform: translate(calc(-100% - 10px),calc(-100% - 10px));
            }
            .card-msg-div .table-top ul .noMore{
                width: 100px;
                height: 100px;
                color: var(--sub_color);
                font-size: 100px;
                box-shadow: 0 0 6px #888;
                border-radius: 50%;
                transition: all var(--transform_slowily);
            }
            .card-msg-div .table-top ul .noMore:hover{
                transform: translate(-50%,-50%) scale(1.1);
            }
        </style>
        <style>
            .card-msg-div .table-top ul .error_li{
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
            .card-msg-div .table-top ul .error_li .error{
                position: absolute;
                display: inline-block;
                width: calc(50% - 4px);
                height: calc(50% - 4px);
                background-color: #fff;
                font-size: 42px;
                text-align: center;
                z-index: 2;
            }
            .card-msg-div .table-top ul .error_li .e_l_t{

            }
            .card-msg-div .table-top ul .error_li .e_l_b{
                top:100%;
                transform: translateY(calc(-100% - 4px));
            }
            .card-msg-div .table-top ul .error_li .e_r_t{
                left:100%;
                transform: translateX(calc( -100% - 4px));
            }
            .card-msg-div .table-top ul .error_li .e_r_b{
                top:100%;
                left:100%;
                transform: translate(calc(-100% - 4px),calc(-100% - 4px));
            }
            .card-msg-div .table-top ul .error_li .move-target{
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
        <ul class="logout-nav">
            <li><a href="${global_url}" class="iconfont icon-shenghuo1"><font>主页</font></a></li>
            <li><a href="${global_url}navTo?url=home/mine/info" class="iconfont icon-xueshengziliao"><font>我的</font></a></li>
            <li><a href="javascript:location.reload();" class="iconfont icon-liushuijiankong"><font>刷新</font></a></li>
        </ul>
        <div class="logout-start-div">
            <div class="logout-start-div-sub"></div>
            <div class="logout-start-div-sub"></div>
            <div class="logout-start-div-sub"></div>
            <div class="logout-start-div-sub"></div>
            <div class="logout-btn-div">
                <input type="button" class="logout-btn" id="logout-toLogout-btn" value="立即注销">
                <input type="button" class="logout-btn" id="logout-seeHistory-btn" value="注销历史">
                <input type="button" class="logout-btn" id="logout-toHome-btn" value="返回主页">
            </div>
        </div>
        <div class="logout-card logout-panel">
            <div class="close">
                <span></span>
                <span></span>
            </div>
            <div class="card-msg-div">
                <table class="card-msg">
                    <thead>
                        <tr>
                            <th colspan="4" align="left">
                                <div class="table-top"></div>
                            </th>
                        </tr>
                    </thead>
<%--                    <tbody>--%>
<%--                        <tr>--%>
<%--                            <td colspan="4">--%>
<%--                                <div class="base-msg left-msg">--%>
<%--                                    <img src="${global_url}staticRes/icon/icCardCreate/nomal.png"/>--%>
<%--                                </div>--%>
<%--                                <div class="base-msg right-msg">--%>
<%--                                    <span>肖家海<font class="iconfont icon-xingming"></font></span>--%>
<%--                                    <span>15770674565<font class="iconfont icon-huafei"></font></span>--%>
<%--                                    <span>2749984520@qq.com<font class="iconfont icon-youxiang"></font></span>--%>
<%--                                    <span>36243019970815481X<font class="iconfont icon-gengxinshenfenzhengxinxi01"></font></span>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td colspan="4" align="center">IC卡信息一览</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td align="right">卡号：</td>--%>
<%--                            <td align="left" id="_card_id">1</td>--%>
<%--                            <td align="right">持有人：</td>--%>
<%--                            <td align="left">肖家海</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td align="right">卡内余额：</td>--%>
<%--                            <td align="left">99.99</td>--%>
<%--                            <td align="right">开卡日期：</td>--%>
<%--                            <td align="left">2021-12-01 12:33:00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td align="right">卡类型：</td>--%>
<%--                            <td align="left">普通卡</td>--%>
<%--                            <td align="right">卡状态：</td>--%>
<%--                            <td align="left">正在使用</td>--%>
<%--                        </tr>--%>
<%--                    </tbody>--%>
                </table>
            </div>
        </div>
        <div class="logout-history logout-panel" style="opacity: 1;">
            <div class="close">
                <span></span>
                <span></span>
            </div>
            <div class="card-msg-div card-history-div">
                <div class="loss-history">
                    <div class="loss-history-sub">
                        <div class="history-left">
                            <ul>
                                <li>
                                    <img src="http://47.113.189.196:80/nchkkjxy/staticRes/icon/icCardCreate/nomal.png" class="card_img" alt="">
                                </li>
                                <li>
                                    <font class="history-font">创建日期</font>2021-11-13 12:22:56
                                </li>
                                <li>
                                    <font class="history-font">IC卡号</font>1
                                </li>
                                <li>
                                    <font class="history-font">卡内余额</font>0.00￥
                                </li>
                                <li>
                                    <font class="history-font">付款折扣</font>1折
                                </li>
                                <li>
                                    <font class="history-font">IC卡类型</font>普通卡
                                </li>
                                <li>
                                    <input type="button" value="已 了 解" id="konwHistory">
                                </li>
                            </ul>
                        </div><!--
               --><span class="mid-line"></span><!--
               --><div class="history-right">
                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>

                        <ul>
                            <li>
                                <font class="history-font">操作类型</font>创建
                            </li>
                            <li></li>
                            <li>
                                <font class="history-font">操作日期</font>2021-11-13 12:22:56
                            </li>
                            <li>
                                <font class="history-font">备注</font>无
                            </li>
                            <li>
                                <font class="history-font">操作结果</font>创建成功
                            </li>
                        </ul>
                    </div>
                    </div>
                </div>
                <div class="loss-recording-panel">
                    <div style="position: relative;width: 100%;height: 100%;" class="table-loss">

                    </div>
                </div>
            </div>
        </div>
        <div class="logout-title">
            <span>注&nbsp;&nbsp;销</span>
        </div>

        <div class="loss-panel-ack-email">
            <div class="close iconfont icon-jiaoyi"></div>
            <div class="loss-panel-ack-email-sub">
                <h1 class="sub-title">确认注销</h1>
                <div class="ack-email">
                    <div class="div">
                        <h3><font class="iconfont icon-queren" style="color: #2f9833;"></font>确认您的邮箱</h3>
                        <input type="email" class="email" id="mine-email" value="" autocomplete="off">
                        <input type="text" class="ack-email-code inline_block" id="email_code" placeholder="填写邮箱验证码">
                        <input type="button" class="send-email inline_block" value="获  取">
                    </div>
                    <div class="div">
                        <h3><font class="iconfont icon-wenhao" style="color: #c7254e;"></font>您问什么选择挂失</h3>
                        <textarea name="loss-mark" id="loss-mark" cols="30" rows="10" οnchange="this.value=this.value.substring(0, 400)"
                                  οnkeydοwn="this.value=this.value.substring(0, 400)"
                                  οnkeyup="this.value=this.value.substring(0, 400)"></textarea>
                    </div>
                    <div class="bottom-btn-panel">
                        <input type="button" class="sure-loss-btn" value="提  交">
                    </div>
                </div>
            </div>
        </div>
        <%--//面板切换--%>
        <script>
            //去注销
            $("#logout-toLogout-btn").click(function () {
                showPanel(".logout-card");
                getCardList();
            });
            //关闭去注销
            $(".logout-card  .close").click(function () {
                closePanel(".logout-card");

                $(".card-msg-div .card-msg tbody").remove();
                $(".card-msg-div .card-msg tfoot").remove();
            });

            //查看注销历史
            $("#logout-seeHistory-btn").click(function () {
                showPanel(".logout-history");
            });
            //关闭注销历史
            $(".logout-history .close").click(function () {
                closePanel(".logout-history");
            });

            //返回主页
            $("#logout-toHome-btn").click(function () {
                window.location.href='http://47.113.189.196:80/nchkkjxy/';
            });

            function showPanel(panelNode) {
                $(panelNode).animate({
                    width:'80%',
                    height:'80%',
                    top:'50%'
                },800);
            }
            function closePanel(panelNode) {
                $(panelNode).animate({
                    width:'0',
                    height:'0',
                    top:'100%'
                },800);
            }
        </script>
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
                $(".card-msg-div .table-top ul").remove();
                let _cardList_html_ =" <ul>";
                for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
                    _cardList_html_ += "" +
                        "<li id='cardLi" + card[cardIndex].cardId + "' class='card_li'>" +
                        "     <span class='loss_li_span loss_li_span_01'><font class=' iconfont icon-huizhang1' style='color: #4e65c7'> </font>NO.<font style='color: var(--sub_color);'>"+card[cardIndex].cardId+"</font></span>" +
                        "     <span class='loss_li_span loss_li_span_02'><font class=' iconfont icon--yue' style='color: #ffda62'></font>余额：<font style='color: #ffda62'>"+card[cardIndex].cardBalance+"</font>￥</span>" +
                        "     <span class='loss_li_span loss_li_span_03'><font class='iconfont icon-xuesheng' style='color: var(--sub_color);'> </font>持有人：<font style='color: var(--sub_color);'>"+card[cardIndex].uName+"</font></span>" +
                        " </li>";
                }
                _cardList_html_ += "<li class='more'><span class='noMore loss_li_span loss_li_span_02 iconfont icon-icon--' title='添加更多IC卡'></span></li></ul>";

                $(".card-msg-div .table-top").append(_cardList_html_);

                let lis =  $(".card-msg-div .table-top ul .card_li");
                for (let cardIndex=0;cardIndex<card.length;cardIndex++) {
                    $(lis[cardIndex]).css('background-image',"url('" + card[cardIndex].cardUrl + "')");
                }
                $(".card-msg-div .table-top .more .noMore").click(function () {
                    window.open("${global_url}navTo?url=home/businessProcess/createIc");
                });

                $(".card-msg-div .table-top ul .card_li").click(function () {

                    var clickLiId = $(this).prop("id");
                    getMsgOfCardByCardId(clickLiId.substr(6,clickLiId.length-1));
                });

            }
            function setCardsError() {
                let _cardList_html_ =" <ul>";
                $(".card-msg-div .table-top ul").remove();

                _cardList_html_ += " <li class='error_li'>" +
                    "    <span class='error e_l_t'>没</span><!--" +
                    "    --><span class='error e_r_t'>有</span><!--" +
                    "    --><span class='error e_l_b'>数</span><!--" +
                    "    --><span class='error e_r_b'>据</span>" +
                    "    <span class='move-target'></span>" +
                    "</li></ul>";

                $(".card-msg-div .table-top").append(_cardList_html_);
            }


            function getMsgOfCardByCardId(cId) {
                $.ajax({
                    url:'${global_url}cardLg/getMsg',
                    dataType:'json',
                    data:{
                        "cardId": cId
                    },
                    method:'post',
                    success:function (data) {
                        if(data.succeed == true){
                            setCardMsg(data.data);
                        }
                        // console.log(data);
                    },error:function () {
                        my_tip.tip("网络连接错误")
                    }
                });
            }
            function setCardMsg(cardMsg) {
                $(".card-msg-div .card-msg tbody").remove();
                $(".card-msg-div .card-msg tfoot").remove();
                let _card_msg_html="";
                if(cardMsg.cStatus == "已失效" || cardMsg.cStatus == "未知状态"){
                }else{
                    _card_msg_html +="" +
                        "<tfoot>" +
                        "    <tr>" +
                        "        <td colspan='4' align='right'>" +
                        "            <input type='button' class='sure-to-logout-btn' value='确认挂失'>" +
                        "        </td>" +
                        "    </tr>" +
                        "</tfoot>";
                }

                 _card_msg_html += "<tbody>" +
                    "    <tr>" +
                    "        <td colspan='4'>" +
                    "            <div class='base-msg left-msg'>" +
                    "                <img src='"+
                    cardMsg.cIcon+"'/>" +
                    "            </div>" +
                    "            <div class='base-msg right-msg'>" +
                    "                <span>"+
                    cardMsg.uName+"<font class='iconfont icon-xingming'></font></span>" +
                    "                <span>"+
                    cardMsg.uPhone+"<font class='iconfont icon-huafei'></font></span>" +
                    "                <span>" +
                    cardMsg.uEmail+"<font class='iconfont icon-youxiang'></font></span>" +
                    "                <span>" +
                    cardMsg.uIdentify+"<font class='iconfont icon-gengxinshenfenzhengxinxi01'></font></spa'" +
                    "            </div>" +
                    "        </td>" +
                    "    </tr>" +
                    "    <tr>" +
                    "        <td colspan='4' align='center'>IC卡信息一览</td>" +
                    "    </tr>" +
                    "    <tr>" +
                    "        <td align='right'>卡号：</td>" +
                    "        <td align='left' id='_card_id'>" +
                    cardMsg.cId+"</td>" +
                    "        <td align='right'>持有人：</td>" +
                    "        <td align='left'>" +
                    cardMsg.uName+"</td>" +
                    "    </tr>" +
                    "    <tr>" +
                    "        <td align='right'>卡内余额：</td>" +
                    "        <td align='left'>" +
                    cardMsg.cBalance+"</td>" +
                    "        <td align='right'>开卡日期：</td>" +
                    "        <td align='left'>"+
                    cardMsg.cCreateDate+"</td>" +
                    "    </tr>" +
                    "    <tr>" +
                    "        <td align='right'>卡类型：</td>" +
                    "        <td align='left'>" +
                    cardMsg.cName+"</td>" +
                    "        <td align='right'>卡状态：</td>" +
                    "        <td align='left'>" +
                    cardMsg.cStatus+"</td>" +
                    "    </tr>" +
                    "</tbody>";

                $(".card-msg-div .card-msg").append(_card_msg_html);
                $(".card-msg-div .card-msg tbody").css("opacity","0");
                $(".card-msg-div .card-msg tbody").animate({opacity:1},500);

                //一键挂失==>去验证邮箱和填写备注
                $(".logout-panel .sure-to-logout-btn").click(function () {
                    $.ajax({
                        url:'${global_url}lossCard/getEmail',
                        dataType:'json',
                        method:'post',
                        data:{},
                        beforeSend:function () {
                            loading_cir.loading("body");
                        },
                        success:function (data) {
                            if(data.succeed == true){
                                $("#mine-email").val(data.data);
                                $(".loss-panel-ack-email").animate({top:'50%'},800);
                            }
                            loading_cir.loaded("body");
                        },
                        error:function () {
                            loading_cir.loaded("body");
                        }
                    });
                });
            }
        </script>
        <script>


        //取消验证邮箱和填写备注
        $(".loss-panel-ack-email .close").click(function () {
            $("#loss-mark").val("");
            $("#mine-email").val("");
            $("#email_code").val("");
            $(".loss-panel-ack-email").animate({top:'-150%'},800);
        });
        //发送邮箱验证码
        var email_send_times=0;
        var wait_time = 60;
        $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").click(function () {
            if(email_send_times > 0){
                my_tip.tip("发送次数太多了，休息一下吧！",1,'body',[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}]);
                $(" .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("pointer-events","none");
                $(" .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("cursor","no-drop");
                $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("font-size","14px");
                var set = setInterval(function(){
                    $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").val("获  取 "+wait_time+"s");
                    wait_time--;
                },1000);
                window.setTimeout(function(){
                    clearInterval(set);
                    $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("pointer-events","painted");
                    $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("cursor","pointer");
                    $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("font-size","16px");
                    $(".loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").val("获  取");
                    wait_time=60;
                    email_send_times=0;
                },60000);
                return;
            }
            $.ajax({
                url:'${global_url}email/get',
                method:'post',
                dataType:'json',
                data:{
                    'email':$("#mine-email").val(),
                    'target':"办理IC卡注销业务"
                },
                beforeSend:function () {
                    loading_cir.loading("body");
                },
                success:function (data) {
                    loading_cir.loaded("body");
                    if(data.succeed = true){
                        my_tip.tip(data.data,1,".loss-panel-ack-email");
                        email_send_times++;
                    }else {
                        my_tip.tip(""+data.msg+data.code,1,".loss-panel-ack-email");
                    }
                },
                error:function () {
                    loading_cir.loaded("body");
                    my_tip.tip("数据加载异常！",1,".loss-panel-ack-email");
                }
            })
        });


        //确认信息
        $(".sure-loss-btn").click(function () {
            var _email_code = $("#email_code").val();
            var _mark = $("#loss-mark").val();
            if(_email_code == "" || _mark == ""){
                my_tip.tip("填写内容不能为空！",1,"body",[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}]);
                return;
            }

            alter_layer.show("注销确认","确认注销这张卡吗？注销后卡被永久销毁，不可恢复！",function () {
                $.ajax({
                    url:'${global_url}email/ack',
                    method:'post',
                    dataType:'json',
                    data:{
                        code:_email_code
                    },
                    beforeSend:function () {
                        loading_cir.loading("body");
                    },
                    success:function (data) {
                        if(data.succeed == true){
                            $.ajax({
                                url:'${global_url}cardLg/logout',
                                method:'post',
                                dataType:'json',
                                data:{
                                    'mark':_mark,
                                    'cardId':$("#_card_id").html()
                                },
                                beforeSend:function () {

                                },
                                success:function (d) {
                                    loading_cir.loaded('body');
                                    if (d.succeed == true){
                                        my_tip.tip(d.data,1, 'body');
                                        $(".loss-panel-ack-email .close").click();
                                        getMsgOfCardByCardId($("#_card_id").html());
                                    }else {
                                        my_tip.tip(d.data,1, 'body', [{
                                            cssName: 'background-color',
                                            cssValue: '#c7254e'
                                        }, {cssName: 'color', cssValue: '#fff'}]);
                                    }
                                },
                                error:function () {
                                    loading_cir.loaded('body');
                                    my_tip.tip("访问异常",1,'body',[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}])
                                }
                            });
                        }
                        else{
                            loading_cir.loaded('body');
                            my_tip.tip(data.msg+":"+data.data,1,'body',[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}])
                        }
                    },
                    error:function () {
                        loading_cir.loaded('body');
                        my_tip.tip("访问异常",1,'body',[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}])
                    }
                });
            });
        });
    </script>
        <script>
            hasLossMsg = false;
            hasLossHistory = false;

            $("#logout-seeHistory-btn").click(function () {
                dataGrid.reload($(".card-history-div .loss-recording-panel .table-loss"),historyData);
            });
            var historyData = {
                ajac: {
                    url: "${global_url}lossCard/getCardList",//请求地址
                    method: "post",//请求方法
                    data: {

                    },//请求条件
                    dataType: "json",
                    beforeSend:function () {
                    },
                    overSend:function () {
                    }
                },
                columnId:true,//显示列表序号（自增）
                columns:[
                    {title:"IC卡号", name:"cardId",       width:"30",hidden:false,align:"center"},
                    {title:"持有人", name:"uName",       width:"30",hidden:false,align:"center"},
                    {title:"当前卡状态", name:"cardStatus",   width:"30",hidden:false,align:"center"}
                ],//数据集合
                btns:[
                    {
                        id:"see_history",
                        txt:"查看历史",
                        icon:"add-icon",
                        btn_style:"normal",//normal、alter、msg
                        click:function () {
                            // seeHistory();
                        }
                    },
                    // {
                    //     id:"back_loss",
                    //     txt:"撤回",
                    //     icon:"add-icon",
                    //     btn_style:"alter",//normal、alter、msg
                    //     click:function () {
                    //         // lossBack();
                    //     }
                    // },
                    {
                        id:'reflush_history',
                        txt:"刷新",
                        icon:"add-icon",
                        btn_style:"msg",//normal、alter、msg
                        click:function () {
                        }
                    }
                ],
                multi_select:false,//是否多选
                pages:[5,10,20,50,100],//每页多少天，选项
            };

            //绑定把表格数据
            dataGrid.grid($(".card-history-div  .loss-recording-panel .table-loss"),historyData);
            $("#reflush_history").click(function () {
                dataGrid.reload($(".card-history-div .loss-recording-panel .table-loss"),historyData)
                // alert(dataGrid.getSelection($(".sub-6 .table-bottom")));
            });
            $("#see_history").click(function () {
                if(hasLossHistory){
                    my_tip.tip("正在加载中，请不要重复点击");
                    return;
                }
                getHistory();
            });
            function getHistory() {
                var cardId=dataGrid.getSelection(".card-history-div .loss-recording-panel .table-loss",2);
                if(cardId.length>1){
                    my_tip.tip("一次只能查看一条数据！",1,'body');
                    return;
                }
                if(cardId.length<1){
                    my_tip.tip("请先选择需要查看的信息！",1,'body');
                    return;
                }
                hasLossHistory = true;

                $.ajax({
                    url:"${global_url}lossCard/getHistory",
                    method:"post",
                    dataType:"json",
                    data:{
                        cardId: cardId[0]
                    },
                    success:function (data) {
                        if(data.succeed ==true) {
                            setHistory(data.data);
                            hasLossHistory = false;
                        }
                    },
                    error:function () {

                        hasLossHistory = false;
                    }
                });
            }
            function setHistory(history) {
                // console.log(history);
                $(".loss-history").remove();
                let _history_html = "";
                if(history.length<1){
                    my_tip.tip("翻遍了数据库都没看到你要的数据~~~~~",1,"body");
                    _history_html = " <div class='loss-history'>" +
                        "           <div class='loss-history-sub'>" +
                        " <input type='button'  id='konwHistory' value='离开' style='position: absolute;top:50%;left:50%;transform: translate(-50%,-50%);'>"+
                        "</div></div>";
                }
                else {
                    _history_html = " <div class='loss-history'>" +
                        "           <div class='loss-history-sub'>" +
                        "               <div class='history-left'>" +
                        "                    <ul>" +
                        "                        <li>" +
                        "                            <img src='"+history[0].cardIcon+"' class='card_img'>" +
                        "                        </li>" +
                        "                        <li>" +
                        "                            <font class='history-font'>创建日期</font>" + history[0].cardCreareDate+
                        "                        </li>" +
                        "                        <li>" +
                        "                            <font class='history-font'>IC卡号</font>" +history[0].cardId+
                        "                        </li>" +
                        "                        <li>" +
                        "                            <font class='history-font'>卡内余额</font>" +history[0].cardBalance+"￥"+
                        "                        </li>" +
                        "                        <li>" +
                        "                            <font class='history-font'>付款折扣</font>" +history[0].cardCount *10+"折"+
                        "                        </li>" +
                        "                        <li>" +
                        "                            <font class='history-font'>IC卡类型</font>" + history[0].cardType+
                        "                        </li>" +
                        "                        <li>" +
                        "                            <input type='button' value='已 了 解' id='konwHistory'>" +
                        "                        </li>" +
                        "                    </ul>" +
                        "               </div><!--" +
                        "               --><span class='mid-line'></span><!--" +
                        "               --><div class='history-right'>";

                    for (let historyIndex = 0; historyIndex < history.length; historyIndex++) {
                        _history_html +=
                            "                    <ul>" +
                            "                   <li>" +
                            "                       <font class='history-font'>操作类型</font>" +history[historyIndex].handleType+"卡"+
                            "                   </li>" +
                            "                   <li></li>" +
                            "                   <li>" +
                            "                       <font class='history-font'>操作日期</font>" +history[historyIndex].handleDate+
                            "                   </li>" +
                            "                   <li>" +
                            "                       <font class='history-font'>备注</font>" +history[historyIndex].handleMark+
                            "                   </li>" +
                            "                   <li>" +
                            "                       <font class='history-font'>操作结果</font>" +history[historyIndex].handleResult+
                            "                   </li>" +
                            "               </ul>";
                    }

                    _history_html +=
                        "               </div>" +
                        "           </div>" +
                        "        </div>";
                }

                $(".card-history-div").append(_history_html);
                $(".card-history-div .loss-history *").css("opacity","1");
                $(".card-history-div .loss-history").animate({width:'100%',height:'100%'},800);

                // 关闭历史
                $("#konwHistory").click(function () {
                    $(".card-history-div .loss-history *").remove();
                    $(".card-history-div .loss-history").animate({width:'0',height:'0'},800);
                });
            }

            $("#back_loss").click(function () {
                var cardId=dataGrid.getSelection(".card-history-div .loss-recording-panel .table-loss",2);
                if(cardId.length>1){
                    my_tip.tip("选择太多了！",1,'body');
                    return;
                }
                if(cardId.length<1){
                    my_tip.tip("请先选择需要查看的信息！",1,'body');
                    return;
                }
                let cardType = dataGrid.getSelection(".card-history-div .loss-recording-panel .table-loss",4);
                console.log(cardId[0]);
                if(cardType[0] == "已挂失"){
                    $.ajax({
                        url:'${global_url}lossCard/lossBack',
                        method:'post',
                        dataType:'json',
                        data:{
                            'card_id':cardId[0]
                        },
                        beforeSend:function(){
                            loading_cir.loading('body');
                        },
                        success:function (data) {
                            loading_cir.loaded('body');
                            my_tip.tip(data.data);
                            if(data.succeed == true){
                                $(".loss-operator .loss-recording").click();
                            }
                        },
                        error:function () {
                            loading_cir.loaded('body');
                            my_tip.tip("操作异常！");
                        }
                    });
                }else {
                    my_tip.tip("选择的记录不是挂失记录，无法撤回！");
                }
            });

        </script>
    </body>
</html>
