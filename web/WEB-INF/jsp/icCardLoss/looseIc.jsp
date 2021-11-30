<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/17
  Time: 14:58
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
    <link rel="shortcut icon" href="${global_url}pic/page-loss.ico" type="image/x-icon">
    <title>挂失</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .loss-panel{
            position: relative;
            width: 100%;
            height: 100%;
            --animate-style: ease-in;
        }
        .loss-panel .start-panel{
            position: absolute;
            width: 100%;
            height: 100%;
            /*background-color: #a2aeb0;*/
        }
        .loss-panel .cloud{
            position: absolute;
            width: 5%;
            height: 5%;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center;
        }
        .loss-panel .cloud-left{
            top: 15%;
            left: 20%;
            animation: loss-move-cloud 1.5s infinite linear;
            background-image: url("${global_url}pic/main_page/cloud.png");
            z-index: 0;
        }
        .loss-panel .cloud-right{
            top: 25%;
            left: 80%;
            background-image: url("${global_url}pic/main_page/red-cloud.png");
            animation: loss-move-cloud 1.5s infinite linear;
            /*animation-delay: 1s;*/
        }
        @keyframes loss-move-cloud {
            from{
                transform: translateX(0px);
            }
            25%{
                transform: translateX(10px);
            }
            50%{
                transform: translateX(0px);
            }
            75%{
                transform: translateX(-10px);
            }
            to{
                transform: translateX(0px);
            }
        }
        .loss-panel  .start-panel .start-back{
            /*position: absolute;*/
            /*top: 50%;*/
            /*left: 50%;*/
            list-style: none;
        }
        .loss-panel  .start-panel .start-back li{
            position: fixed;
            width: 0;
            height: 0;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-30%);
        }
        .loss-panel  .start-panel .start-back li:nth-child(1){
            /*border: 1000px solid;*/
            border-width: 1000px 1000px 1000px 1000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(4, 167, 140, 0.5) rgba(0,0,0,0);
            animation: move-start-panel 2s var(--animate-style);
            animation-fill-mode: forwards;
            /*animation-delay: .2s;*/
            z-index: 10;
        }
        .loss-panel  .start-panel .start-back li:nth-child(2){
            border-width:  1000px 1500px  1000px 1500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) #81e1b3 rgba(0,0,0,0);
              animation: move-start-panel 1.8s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .3s;
            z-index: 9;
        }
        .loss-panel  .start-panel .start-back li:nth-child(3){
            border-width:  1000px 2000px 1000px 2000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(76, 199, 140, 0.81) rgba(0,0,0,0);
              animation: move-start-panel 1.6s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .6s;
            z-index: 8;
        }
        .loss-panel  .start-panel .start-back li:nth-child(4){
            border-width:  1000px 2500px 1000px 2500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(53, 199, 170, 0.6) rgba(0,0,0,0);
              animation: move-start-panel 1.4s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .9s;
            z-index: 7;
        }
        .loss-panel  .start-panel .start-back li:nth-child(5){
            border-width:  1000px 3000px 1000px 3000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(85, 191, 199, 0.4) rgba(0,0,0,0);
              animation: move-start-panel 1.2s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 1.2s;
            z-index: 6;
        }
        .loss-panel  .start-panel .start-back li:nth-child(6){
            border-width: 1000px 3500px 1000px 3500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(129, 191, 199, 0.2) rgba(0,0,0,0);
              animation: move-start-panel .8s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 1.6s;
            z-index: 5;
        }
        @keyframes move-start-panel {
            from{}
            to{
                transform:translateX(-50%) translateY(-50%);
            }
        }
        .loss-panel .start-panel .move-ul{
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%,0);
            list-style: none;
            width: 100%;
            height: 45%;
            z-index: 11;
            /*background-color: #c7254e;*/
        }
        .loss-panel .start-panel .move-ul li{
            position: fixed;
            width: 5%;
            border-radius: 100px 100px 0 0;
            background-color: #4e65c7;
            top: 100%;
            /*z-index: 11;*/
        }
        .loss-panel .start-panel .move-ul li:first-child,
        .loss-panel .start-panel .move-ul li:last-child{
            height: 25%;
            z-index: 7;
        }
        .loss-panel .start-panel .move-ul li:nth-child(2),
        .loss-panel .start-panel .move-ul li:nth-child(6){
            height: 50%;
            z-index: 8;
        }
        .loss-panel .start-panel .move-ul li:nth-child(3),
        .loss-panel .start-panel .move-ul li:nth-child(5){
            height: 75%;
            z-index: 9;
        }
        .loss-panel .start-panel .move-ul li:nth-child(4){
            height: 100%;
            z-index: 10;
        }


        .loss-panel .start-panel .move-ul li:first-child{
            left: 8%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .6s;
            background-color: var(--sub_color);
        }
        .loss-panel .start-panel .move-ul li:nth-child(2){
            left:21%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .4s;
            background-color: var(--sub_color);
        }
        .loss-panel .start-panel .move-ul li:nth-child(3){
            left:34%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .2s;
            background-color: var(--sub_color);
        }
        .loss-panel .start-panel .move-ul li:nth-child(4){
            left: 47.5%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            background-color: var(--sub_color);
        }

        .loss-panel .start-panel .move-ul li:nth-child(5){
            left: 61%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .2s;
            background-color: var(--sub_color);
        }
        .loss-panel .start-panel .move-ul li:nth-child(6){
            left: 74%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .4s;
            background-color: var(--sub_color);
        }
        .loss-panel .start-panel .move-ul li:last-child{
            left: 87%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .6s;
            background-color: var(--sub_color);
        }
        @keyframes move-down-lis {
            from{}
            to{
                transform: translateY(-100%);
            }
        }
        .loss-panel .to-loss{
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%,-70%);
            width: 130px;
            height: 130px;
            z-index: 10;
        }
        .loss-panel .to-loss *{
            animation: loss-show-btn var(--transform_slowily) var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 2.5s;
        }
        .loss-panel .loss-input-style{
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);
            /*background-color: #a2aeb0;*/
            background-image: url("${global_url}pic/main_page/mu.png");
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            z-index: 10;
            border-radius: 50%;
            animation: row-back-input 3s infinite linear;
            opacity: 0;
        }
        @keyframes row-back-input {
            from{}
            to{
                transform: translate(-50%,-50%) rotate(360deg);
            }
        }
        #quick-loss{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            align-items: center;
            justify-items: center;
            width: 80px;
            height: 80px;
            padding: 5px;
            text-align: center;
            font-size: 18px;
            font-weight: bolder;
            border-radius: 50%;
            /*animation: loss-show-btn var(--transform_slowily) var(--animate-style);*/
            background-color: var(--sub_color);
            color: #fff;
            /*animation: loss-show-btn var(--transform_slowily) var(--animate-style);*/
            /*animation-fill-mode: forwards;*/
            /*animation-delay: 2.5s;*/
            z-index: 11;
            opacity: 0;
            box-shadow: 0 0 20px var(--sub_color);
            transition: all var(--transform_slowily);
            cursor: pointer;
        }
        @keyframes loss-show-btn {
            from{}
            to{
                opacity: 1;
            }
        }
        .loss-panel .to-loss svg{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-100%);
            animation: row-svg 1s infinite ease-in;
        }
        #quick-loss:hover {
            box-shadow: 0 0 30px var(--sub_color);
        }
        #quick-loss:hover ~div{
            opacity: 1;
        }
        @keyframes row-svg {
            from{}
            to{
                transform: translate(-50%,-85%) rotate(360deg);
            }
        }
        .loss-msg{
            position: absolute;
            width: 70%;
            height: 70%;
            top: -50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background-color: #fff;
            box-shadow: 0 0 6px #666;
            border-radius: 5px;
            /*display: none;*/
            opacity: 0;
            transition: all var(--transform_slowily);
            z-index: 15;
        }
        .loss-msg .loss-return-panel{
            position: absolute;
            top:100%;
            left:50%;
            width: 50px;
            height: 20px;
            transform: translate(-50%,-100%);
            padding: 5px 20px;
            font-size: 16px;
            font-weight: 400;
            color: var(--sub_color);
            border-radius: 5px 5px 0 0;
            transition: all var(--transform_slowily);
            cursor: pointer;
        }
        .loss-msg .loss-return-panel:hover{
            color: #fff;
            background-color: var(--sub_color);
        }
        .loss-msg .loss-return-panel:hover .loss-back{
            animation: loos-back-move 1.5s ease-in-out;
            animation-fill-mode: forwards;
        }
        @keyframes loos-back-move {
            from{
                top:50%;
                transform: translate(-50%,-50%);
            }
            50%{
                top:0;
                transform: translate(-50%,-100%);
                opacity: 0;
            }
            75%{
                top:100%;
                transform: translate(-50%,-100%);
            }
            to{
                top:50%;
                opacity: 1;
                transform: translate(-50%,-50%);
            }
        }
        .loss-msg .loss-return-panel .loss-back{
            position: absolute;
            left: 50%;
            top:50%;
            transform: translate(-50%,-50%);
            cursor: pointer;
        }
    </style>

    <style>
        .loss-msg .loss-panel-ack-email{
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
        .loss-msg .loss-panel-ack-email .close{
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
        .loss-msg .loss-panel-ack-email .close:hover{
            background-color: #c7254e;
            color: #fff;
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 90%;
            height: 90%;
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .sub-title{
            border-left: 3px solid var(--sub_color);
            margin: 20px 0;
            padding-left: 5px;
            color: var(--sub_color);
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email{
            width: 100%;
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .div{
            width: 100%;
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email h3{
            border-left: 2px solid var(--sub_color);
            margin: 10px 0;
            padding-left: 5px;
            color: var(--sub_color);
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .email{
            width: 100%;
            text-align: center;
            font-size: 16px;
            padding: 5px 0;
            color: var(--sub_color);
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .ack-email-code{
            width: calc(100% - 96px);
            text-align: center;
            font-size: 16px;
            padding: 5px 0;
            margin: 5px 5px 5px 0;
            color: var(--sub_color);
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email{
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
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email:hover{
            box-shadow: none;
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email:focus{
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

        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email textarea{
            width: 100%;
            max-width: 100%;
            min-width: 100%;
            resize: none;
            padding: 5px;
            font-size: 12px;
            text-align: left;
            color: var(--sub_color);
        }

        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .bottom-btn-panel{
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translate(-50%,-100%);
        }
        .loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .bottom-btn-panel .sure-loss-btn{
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
        .loss-msg .loss-operator{
            position: absolute;
            top:0;
            left:50%;
            transform: translateX(-50%);
            border-radius: 0 0 5px 5px;
            /*border: 1px dashed var(--sub_color);*/
            padding: 0 10px;
            z-index: 5;
        }
        .loss-msg .loss-operator .loss-nav{
            list-style: none;

        }
        .loss-msg .loss-operator .loss-nav li{
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-top: 5px;
            background-position: center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            /*border-radius: 50%;*/
            transition: all var(--transform_slowily);
            z-index: 6;
            cursor: pointer;
        }
        .loss-msg .loss-operator .loss-nav li:hover{
            /*background-color: #666;*/
            transform: translateY(5px) scale(1.1);
            border-bottom: 2px solid var(--sub_color);
            box-shadow: 0 5px 5px var(--sub_color);
        }
        .loss-msg .loss-operator .loss-nav .loss-approve{
            <%--background-image: url("${global_url}pic/main_page/loss-approve.png");--%>
        }
        .loss-msg .loss-operator .loss-nav .loss-ing{
            <%--background-image: url("${global_url}pic/main_page/loss-ing.png");--%>
        }
        .loss-msg .loss-operator .loss-nav .loss-recording{
            <%--background-image: url("${global_url}pic/main_page/loss-recording.png");--%>
        }
        .loss-msg .loss-operator .loss-nav .loss-tip{
            <%--background-image: url("${global_url}pic/main_page/loss-tip.png");--%>
        }
        .loss-msg .loss-operator-panel{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 80%;
            height: 75%;
            border-top: 1px solid var(--sub_color);
        }
        .loss-msg .loss-operator-panel>div{
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            z-index: 1;
        }
        .loss-msg .loss-operator-panel .loss-approve-panel{
            /*background-color: #a2aeb0;*/
        }
        .loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg{
            width: 100%;
            font-size: 16px;
            font-weight: 400;
            color: var(--sub_color);
        }
        .loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg .loss-card{
            width: 80px;
            height: 30px;
            background-color: var(--sub_color);
            color: #fff;
            font-size: 12px;
            font-weight: 400;
            transition: all var(--transform_slowily);
            cursor: pointer;
        }
        .loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg .loss-card:hover{
            color: var(--sub_color);
            background-color: #fff;
        }
        .loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg .loss-card-tip{
            color: crimson;
            background-color: #fff;
            font-weight: 800;
            font-size: 14px;
            border-radius: 50%;
            cursor: help;
        }
        .loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg td{
            padding-top: 10px;
        }
        .loss-msg .loss-operator-panel .loss-ing-panel{
            /*background-color: #c7254e;*/
        }
        .loss-msg .loss-operator-panel .loss-recording-panel{
            /*background-color: #4e65c7;*/
        }
        .loss-msg .loss-operator-panel .loss-tip-panel{
            position: relative;
            width: 100%;
            height: 100%;
        }
        .loss-msg .loss-operator-panel .loss-tip-panel ul{
            position: absolute;
            width: fit-content;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            list-style-type: none;
        }
        .loss-msg .loss-operator-panel .loss-tip-panel ul li{
            border-left: 5px solid var(--sub_color);
            font-size: 16px;
            color: var(--sub_color);
            font-weight: bold;
            margin-top: 10px;
            padding-left:5px;
        }
        .loss-msg .loss-global{
            position: absolute;
            top: 100%;
            left: 100%;
            transform: translate(-100%,-100%);
            margin-right: 50px;
        }
        .loss-msg .loss-global .loss-global-nav{
            list-style: none;
            width: 120px;
            margin: 0 5px 5px 0;
        }
        .loss-msg .loss-global .loss-global-nav li{
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-top: 5px;
            background-position: center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            border-radius: 50%;
            transition: all var(--transform_slowily);
            z-index: 6;
            cursor: pointer;
        }
        .loss-msg .loss-global .loss-global-nav li:hover{
            /*background-color: #666;*/
            /*transform: translateY(5px) scale(1.1);*/
            /*border-bottom: 2px solid var(--sub_color);*/
            box-shadow: 0 0px 5px var(--sub_color);
        }

    </style>

    <style>

        .loss-msg .loss-history{
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
        .loss-msg .loss-history .loss-history-sub{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 90%;
            height: 90%;
        }
        .loss-msg .loss-history .loss-history-sub .history-left{
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
        .loss-msg .loss-history .loss-history-sub .mid-line{
            float: left;
            height: 100%;
            width: 2px;
            border-radius: 1px;
            background-color: #aaa;
        }
        .loss-msg .loss-history .loss-history-sub .history-right{
            position: relative;
            float: right;
            width: calc(50% - 1px);
            height: 100%;
            overflow: auto;
            /*background-color: #4e65c7;*/
        }
        .loss-msg .loss-history .loss-history-sub .history-font{
            font-size: 13px;
            padding: 3px;
            margin: 3px;
            border-radius: 5px;
            border: 1px solid var(--sub_color);
            float: left;
        }
        .loss-msg .loss-history .loss-history-sub .card_img{
            width: 100px;
            height: 60px;
        }
        .loss-msg .loss-history .loss-history-sub ul{
            list-style: none;
        }
        .loss-msg .loss-history .loss-history-sub .history-right ul{
            padding: 10px 5px;
            box-shadow: 0 0 8px #999;
            margin: 5px;
            /*background-color: #4e65c7;*/
        }
        .loss-msg .loss-history .loss-history-sub ul li{
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

</head>
<body>
    <div class="loss-panel">
        <div class="start-panel">
            <ul class="start-back">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
            <ul class="move-ul">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <div  class="to-loss">
            <input type="button" id="quick-loss" value="立即挂失">
            <div class="loss-input-style">
            </div>
        </div>
        <div class="cloud cloud-left"></div>
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 308 308"><defs><style>.cls-1{opacity:0.3;fill:url(#未命名的渐变_24);}</style><linearGradient id="未命名的渐变_24" x1="20.61" y1="231.01" x2="287.39" y2="76.99" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#00e7ff"/><stop offset="0.49" stop-color="#49bac8"/><stop offset="1" stop-color="#6583f7"/></linearGradient></defs><g id="图层_2" data-name="图层 2"><g id="图层_1-2" data-name="图层 1"><path class="cls-1" d="M154,0A154,154,0,1,0,308,154,154,154,0,0,0,154,0Zm0,274A120,120,0,1,1,274,154,120,120,0,0,1,154,274Z"/></g></g></svg>
        <div class="cloud cloud-right"></div>
    </div>
    <div class="loss-msg">
        <div class="loss-history">
            <div class="loss-history-sub">
                <div class="history-left">
                    <ul>
                        <li>
                            <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/nomal.png" class="card_img" alt="">
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
        <div class="loss-operator">
            <ul class="loss-nav">
                <li class="loss-approve" value="1">
                    <svg t="1637762475363" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="31570" width="30" height="30"><path d="M810.666667 515.541333c-13.866667-2.346667-28.138667-3.541333-42.666667-3.541333-141.376 0-256 114.624-256 256 0 89.045333 45.461333 167.466667 114.432 213.333333H128a85.333333 85.333333 0 0 1-85.333333-85.333333V128a85.333333 85.333333 0 0 1 85.333333-85.333333h597.333333a85.333333 85.333333 0 0 1 85.333334 85.333333v387.541333zM426.666667 554.666667a192 192 0 1 0 0-384 192 192 0 0 0 0 384zM160 618.666667a32 32 0 0 0 0 64h277.333333a32 32 0 0 0 0-64h-277.333333z m0 149.333333a32 32 0 0 0 0 64h192a32 32 0 0 0 0-64h-192z m194.325333-369.28l-51.52-52.992a14.442667 14.442667 0 0 1-3.370666-14.784c1.706667-5.184 6.186667-8.96 11.605333-9.749333l70.784-10.666667 31.850667-67.541333a14.592 14.592 0 0 1 26.389333 0.064l31.616 67.733333 70.656 10.88a14.442667 14.442667 0 0 1 11.584 9.813333 14.442667 14.442667 0 0 1-3.413333 14.72l-51.626667 52.821334 11.648 72.490666a14.570667 14.570667 0 0 1-13.802667 19.157334h-0.192a15.466667 15.466667 0 0 1-6.762666-1.642667l-63.232-35.157333-63.146667 34.752a14.549333 14.549333 0 0 1-21.397333-15.125334l12.330666-74.752zM768 981.333333c-117.824 0-213.333333-95.509333-213.333333-213.333333s95.509333-213.333333 213.333333-213.333333 213.333333 95.509333 213.333333 213.333333-95.509333 213.333333-213.333333 213.333333z m28.437333-199.850666v-26.517334c21.077333-9.92 35.562667-30.528 35.562667-54.336C832 667.136 803.349333 640 768 640s-64 27.136-64 60.629333c0 23.808 14.485333 44.416 35.562667 54.336v26.517334H704a42.666667 42.666667 0 0 0-42.666667 42.666666v38.186667h213.333334v-38.186667a42.666667 42.666667 0 0 0-42.666667-42.666666h-35.562667z m-128 94.293333V896h199.125334v-20.202667h-199.125334z" fill="#2BC59F" p-id="31571"></path></svg>
                </li>
<%--                <li class="loss-ing" value="2">--%>
<%--                    <svg t="1637762664858" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="46101" width="30" height="30"><path d="M636.09856 284.99968a296.55552 296.55552 0 0 0-420.65408 269.35808c0 8.96 0.384 17.85344 1.20832 26.624a296.54016 296.54016 0 0 0 590.6944-0.06144 283.392 283.392 0 0 0 1.20832-26.56256 296.5248 296.5248 0 0 0-172.45696-269.35808zM512 681.472a127.0528 127.0528 0 0 1-127.08352-127.08864v-0.128A127.08352 127.08352 0 1 1 512 681.472z" fill="#7AEACA" p-id="46102"></path><path d="M643.32288 702.62272a127.08864 127.08864 0 1 0 254.17216 0.11264v-0.11264a127.08864 127.08864 0 1 0-254.17216-0.10752zM126.50496 702.62272a127.08352 127.08352 0 1 0 0-0.0512zM384.91648 257.82272a127.08864 127.08864 0 1 0 0-0.10752z" fill="#2BD181" p-id="46103"></path></svg>--%>
<%--                </li>.loss-operator .loss-recording--%>
                <li class="loss-recording" value="2">
                    <svg t="1637762605892" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="43242" width="30" height="30"><path d="M814.08 128H716.8c-20.48 0-35.84 15.36-35.84 35.84V225.28H343.04V168.96c0-10.24 0-20.48-10.24-30.72-5.12-5.12-15.36-10.24-25.6-10.24H209.92c-46.08 0-81.92 35.84-81.92 87.04v650.24c0 46.08 35.84 87.04 81.92 87.04h604.16c46.08 0 81.92-35.84 81.92-87.04V209.92c0-46.08-35.84-81.92-81.92-81.92zM281.6 721.92c-10.24 0-20.48-5.12-20.48-15.36-5.12-10.24 0-20.48 5.12-25.6 5.12-5.12 15.36-10.24 25.6-5.12s15.36 10.24 15.36 20.48c0 5.12 0 15.36-5.12 15.36-5.12 10.24-15.36 10.24-20.48 10.24z m0-148.48c-10.24 0-20.48-5.12-20.48-15.36-5.12-10.24 0-20.48 5.12-25.6 5.12-5.12 15.36-10.24 25.6-5.12 10.24 0 15.36 10.24 15.36 20.48 0 5.12 0 15.36-5.12 15.36-5.12 10.24-15.36 10.24-20.48 10.24z m0-148.48c-10.24 0-25.6-10.24-25.6-25.6s10.24-25.6 25.6-25.6 25.6 10.24 25.6 25.6c0 5.12 0 15.36-5.12 15.36-5.12 5.12-15.36 10.24-20.48 10.24z m455.68 296.96H404.48c-10.24 0-15.36-5.12-20.48-10.24-5.12-10.24-5.12-15.36 0-25.6s10.24-10.24 20.48-10.24h337.92c10.24 0 15.36 5.12 20.48 10.24 5.12 10.24 5.12 15.36 0 25.6-10.24 5.12-15.36 10.24-25.6 10.24z m0-148.48H404.48c-10.24 0-15.36-5.12-20.48-10.24-5.12-10.24-5.12-15.36 0-25.6s10.24-10.24 20.48-10.24h337.92c10.24 0 15.36 5.12 20.48 10.24 5.12 10.24 5.12 15.36 0 25.6-10.24 5.12-15.36 10.24-25.6 10.24z m0-148.48H404.48c-10.24 0-15.36-5.12-20.48-10.24-5.12-10.24-5.12-15.36 0-25.6s10.24-10.24 20.48-10.24h337.92c15.36 0 25.6 10.24 25.6 25.6-5.12 10.24-15.36 20.48-30.72 20.48z m0 0" fill="#f35757" p-id="43243"></path><path d="M419.84 199.68h179.2c25.6 0 40.96-20.48 40.96-40.96v-40.96c0-20.48-20.48-40.96-40.96-40.96H419.84c-25.6 0-40.96 20.48-40.96 40.96v40.96c0 25.6 15.36 40.96 40.96 40.96z m0 0" fill="#f35757" p-id="43244"></path></svg>
                </li>
                <li class="loss-tip" value="3">
                    <svg t="1637762435548" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="29704" width="30" height="30"><path d="M514.048 106.496c-233.472 0-422.912 189.44-422.912 422.912 0 233.472 189.44 422.912 422.912 422.912 233.472 0 422.912-189.44 422.912-422.912 0-233.472-189.44-422.912-422.912-422.912z m0 816.128" fill="#37C882" opacity=".2" p-id="29705"></path><path d="M465.92 307.2h95.744l-5.12 326.656H471.552zM471.552 688.64h84.992v81.92H471.552z" fill="#37C882" p-id="29706"></path></svg>
                </li>
            </ul>
        </div>
        <div class="loss-panel-ack-email">
            <div class="close iconfont icon-jiaoyi"></div>
            <div class="loss-panel-ack-email-sub">
                <h1 class="sub-title">确认挂失</h1>
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
        <div class="loss-operator-panel">
            <!--申请挂失-->
            <div class="loss-approve-panel">
            </div>
            <!--查看正在挂失流程中的挂失信息-->
<%--            <div class="loss-ing-panel">--%>
<%--            </div>--%>
            <!--查看挂失记录列表-->
            <div class="loss-recording-panel">
                <div style="position: relative;width: 100%;height: 100%;" class="table-loss">

                </div>
            </div>
            <!--查看挂失流程须知-->
            <div class="loss-tip-panel" >
                <ul>
                    <li style="border-left: 5px solid #4e65c7;font-size: 20px;margin-bottom:30px;font-weight: 800;color: #c7254e;">挂失须知<font class="iconfont icon-gantanhao"></font></li>
                    <li>你在线申请挂失，填写挂失信息（需保证<font style="color: #c7254e;border: 1px solid #c7254e;border-radius: 1px;">邮箱</font>正常使用）</li>
                    <li>管理员收到你的申请后处理</li>
                    <li>挂失<font style="color: #2f9833;border: 1px solid #2f9833;border-radius: 1px;">成功</font>，卡内余额自动转入你的账户余额，并以邮件形式通知你</li>
                    <li>挂失<font style="color: #c7254e;border: 1px solid #c7254e;border-radius: 1px;">失败</font>，卡内余额不变，卡继续使用，并以邮件形式通知你</li>
                </ul>
            </div>
        </div>

        <div class="loss-return-panel">
            <span class="iconfont loss-back icon-xiangshang"></span>
        </div>

        <div class="loss-global">
            <ul class="loss-global-nav">
                <li class="to-home">
                    <svg t="1637592170007" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="33947" width="30" height="30">
                        <path d="M515.072 511.3856m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#59ADF8" p-id="33948"></path>
                        <path d="M517.5296 338.688c58.88 51.2512 117.1456 102.0416 175.4624 152.832 18.6368 16.2304 37.0688 32.7168 55.9616 48.64 10.3936 8.7552 15.1552 19.0464 15.104 32.8704-0.4096 63.6928 0 127.3856-0.256 191.0272-0.1024 30.5664-8.2944 38.4-38.2976 38.7072-45.7728 0.4096-91.5456 0.3584-137.3184 1.4336-12.9024 0.3072-17.2032-3.1232-16.9984-16.5376 0.768-46.2848 0.3072-92.6208 0.3072-138.9568v-18.4832H462.0288v41.1648c0 38.9632-0.3584 77.8752 0.2048 116.8384 0.1536 11.3152-2.7648 16.0768-14.848 15.9744-47.36-0.4608-94.72 0.1024-142.0288-0.3072-26.2144-0.256-34.816-9.3184-34.8672-35.7376-0.2048-66.816-0.3584-133.6832 0.3072-200.4992 0.0512-7.424 3.4816-17.152 8.8576-21.9136C356.864 477.3888 434.5856 409.6 512.2048 341.76c1.1264-1.024 2.6624-1.5872 5.3248-3.072z" fill="#FFFFFF" p-id="33949"></path>
                        <path d="M653.6704 313.2928c0-27.1872-0.0512-50.0736 0-73.0112 0.1024-26.8288 2.2528-29.0304 28.416-29.0816 17.8688-0.0512 35.7888 0 53.6576 0 26.3168 0.0512 28.16 1.8432 28.1088 28.9792-0.1536 48.9472 0.1024 97.8944-0.9216 146.7904-0.3584 17.3056 5.12 29.9008 18.5344 40.9088 23.1936 18.944 45.4144 39.1168 67.84 59.0336 16.128 14.3872 16.5376 18.6368 3.6864 35.4816-29.44 38.6048-27.2384 38.6048-62.3616 7.2192-86.3232-77.056-172.9536-153.8048-259.4816-230.656-4.2496-3.7888-8.6528-7.4752-14.0288-12.032-11.264 9.6768-22.0672 18.6368-32.5632 27.9552-85.0432 75.3664-170.0352 150.784-255.0272 226.0992-17.8176 15.8208-21.1456 15.4624-36.5056-3.0208-28.3136-33.9968-28.416-34.0992 4.4032-63.1296C289.1264 393.5744 380.8768 312.32 472.7296 231.168c33.0752-29.2352 55.1936-29.0816 88.4736 0.1536 23.7056 20.8384 47.104 42.0352 70.656 63.0272 6.0416 5.5808 12.3392 10.8032 21.8112 18.944z" fill="#FFFFFF" p-id="33950"></path>
                    </svg>
                </li>
                <li class="to-my-page">
                    <svg t="1637763743958" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="57020" width="30" height="30"><path d="M512 0a512 512 0 1 0 512 512A512 512 0 0 0 512 0zM455.214545 427.287273h113.57091a12.567273 12.567273 0 0 1 8.843636 21.410909 93.090909 93.090909 0 0 1-131.258182 0 12.567273 12.567273 0 0 1 8.843636-21.410909z m272.756364 369.570909H296.029091a46.545455 46.545455 0 0 1-34.443636-82.850909 348.625455 348.625455 0 0 1 500.82909 0 46.545455 46.545455 0 0 1-34.443636 82.850909z" fill="#F55E55" p-id="57021"></path><path d="M512 210.850909A162.909091 162.909091 0 1 0 674.909091 372.363636 162.909091 162.909091 0 0 0 512 210.850909z m65.629091 237.847273a93.090909 93.090909 0 0 1-131.258182 0 12.567273 12.567273 0 0 1 8.843636-21.410909h113.57091a12.567273 12.567273 0 0 1 8.843636 21.410909z" fill="#F9BBB8" p-id="57022"></path></svg>
                </li>
                <li class="to-help">
                    <svg t="1637763523752" class="icon" viewBox="0 0 1033 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="53119" width="30" height="30"><path d="M521.511385 0c-282.761846 0-512 229.238154-512 512s229.238154 512 512 512 512-229.238154 512-512-229.218462-512-512-512z m0.039384 789.070769c-153.147077 0-277.641846-124.396308-277.641846-277.622154 0-153.147077 124.475077-277.641846 277.641846-277.641846 153.206154 0 277.641846 124.475077 277.641846 277.641846 0 153.225846-124.416 277.622154-277.641846 277.622154z" fill="#B1DC68" p-id="53120"></path><path d="M521.550769 272.128c-132.096 0-239.320615 107.204923-239.320615 239.320615s107.224615 239.300923 239.320615 239.300923c132.115692 0 239.320615-107.185231 239.320616-239.300923s-107.204923-239.320615-239.320616-239.320615z m-5.750154 394.417231a21.031385 21.031385 0 0 1-21.031384-21.070769 21.070769 21.070769 0 1 1 21.031384 21.070769z m78.532923-168.467693l-47.872 51.692308c-11.500308 13.390769-11.500308 19.121231-11.500307 30.621539 0 5.730462-1.890462 11.500308-5.750154 15.320615-3.800615 1.929846-9.590154 3.820308-13.410462 3.820308-5.750154 0-11.460923-1.910154-15.28123-5.769846-3.84-3.820308-5.750154-9.531077-5.750154-15.261539 0-17.270154 3.800615-32.551385 19.140923-47.911385l49.762461-55.512615c11.52-13.390769 13.430154-34.461538 5.750154-49.801846-7.640615-17.211077-22.961231-24.851692-45.942154-26.781539-30.641231 0-49.762462 17.230769-55.552 49.782154-1.890462 9.550769-9.550769 17.250462-19.101538 17.250462-5.769846 0-11.52-1.910154-15.340308-7.699692-3.84-3.820308-5.730462-9.550769-5.730461-15.261539 7.660308-55.571692 45.961846-88.123077 101.454769-84.243692 36.352 1.870769 65.122462 21.031385 78.513231 51.633231 11.460923 28.731077 7.660308 65.122462-13.39077 88.123076z" fill="#B1DC68" p-id="53121"></path></svg>
                </li>
            </ul>
        </div>
    </div>

    <script>


    $(".loss-global .loss-global-nav .to-home").click(function () {
        window.open("${global_url}");
    });

    // $(".loss-global .loss-global-nav .to-home ").hover(function () {
    //     elemTitle.title($(this),"主页");
    // });
    // $(".loss-global .loss-global-nav .to-home ").mouseleave(function () {
    //     elemTitle.remove($(this));
    // });

    $(".loss-global .loss-global-nav .to-my-page").click(function () {
        window.open("${global_url}navTo?url=home/mine/info");
    });
    // $(".loss-global .loss-global-nav .to-my-page ").hover(function () {
    //     elemTitle.title($(this),"个人信息");
    // });
    // $(".loss-global .loss-global-nav .to-my-page ").mouseleave(function () {
    //     elemTitle.remove($(this));
    // });

    $(".loss-global .loss-global-nav .to-help").click(function () {
        window.open("${global_url}navTo?url=home/system/useBook");
    });
    // $(".loss-global .loss-global-nav .to-help ").hover(function () {
    //     elemTitle.title($(this),"帮助");
    // });
    // $(".loss-global .loss-global-nav .to-help ").mouseleave(function () {
    //     elemTitle.remove($(this));
    // });


    $("#quick-loss").click(function () {
        $(".loss-msg").animate({top:'50%',opacity:1},800);
    });

    $(".loss-msg .loss-return-panel .loss-back").click(function () {
        $(".loss-msg").animate({top:'-100%',opacity:0},800);
    });

    //挂失
    $(".loss-msg .loss-operator .loss-nav  .loss-approve").click(function () {
        if(hasLossMsg){
            my_tip.tip("正在加载中，请不要重复点击");
            return;
        }
        getCardMsg();
    });


    //取消验证邮箱和填写备注
    $(".loss-msg .loss-panel-ack-email .close").click(function () {
        $("#loss-mark").val("");
        $("#mine-email").val("");
        $("#email_code").val("");
        $(".loss-msg .loss-panel-ack-email").animate({top:'-150%'},800);
    });
    //发送邮箱验证码
    var email_send_times=0;
    var wait_time = 60;
    $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").click(function () {
        if(email_send_times > 0){
            my_tip.tip("发送次数太多了，休息一下吧！",1,'body',[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}]);
            $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("pointer-events","none");
            $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("cursor","no-drop");
            $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("font-size","14px");
            var set = setInterval(function(){
                $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").val("获  取 "+wait_time+"s");
                wait_time--;
            },1000);
            window.setTimeout(function(){
                clearInterval(set);
                $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("pointer-events","painted");
                $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("cursor","pointer");
                $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").css("font-size","16px");
                $(".loss-msg .loss-panel-ack-email .loss-panel-ack-email-sub .ack-email .send-email").val("获  取");
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
                'target':"办理IC卡挂失业务"
            },
            beforeSend:function () {
                loading_cir.loading("body");
            },
            success:function (data) {
                loading_cir.loaded("body");
                if(data.succeed = true){
                    my_tip.tip(data.data,1,".loss-msg .loss-panel-ack-email");
                    email_send_times++;
                }else {
                    my_tip.tip(""+data.msg+data.code,1,".loss-msg .loss-panel-ack-email");
                }
            },
            error:function () {
                loading_cir.loaded("body");
                my_tip.tip("数据加载异常！",1,".loss-msg .loss-panel-ack-email");
            }
        })
    });
    //确认信息
    $(".loss-msg .sure-loss-btn").click(function () {
        var _email_code = $("#email_code").val();
        var _mark = $("#loss-mark").val();
        if(_email_code == "" || _mark == ""){
            my_tip.tip("填写内容不能为空！",1,"body",[{cssName:'background-color',cssValue:'#c7254e'},{cssName: 'color',cssValue: '#fff'}]);
            return;
        }
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
                            url:'${global_url}lossCard/loss',
                            method:'post',
                            dataType:'json',
                            data:{
                                'mark':_mark,
                                'card_id':$("#_card_id").html()
                            },
                            beforeSend:function () {

                            },
                            success:function (d) {
                                loading_cir.loaded('body');
                                if (d.succeed == true){
                                    my_tip.tip(d.data,1, 'body');
                                    $(".loss-msg .loss-panel-ack-email .close").click();
                                    getCardMsg();
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


    //挂失历史
    // $(".loss-msg .loss-operator .loss-nav .loss-recording").click(function () {
    //
    // });




    $(".loss-msg .loss-operator .loss-nav li").click(function () {
        // console.log($(this));
        let lis= $(".loss-msg .loss-operator .loss-nav li");
        let liLen = lis.length;
        for (let liIndex = 0;liIndex<liLen;liIndex++){
            if($(this).attr("value") === $(lis[liIndex]).attr("value") ){
                open_panel($($(".loss-operator-panel>div")[liIndex]));
            }else{
                close_panel($($(".loss-operator-panel>div")[liIndex]));
            }
        }
    });



    function open_panel(panelNode) {
        if(typeof (panelNode) !="undefined" && panelNode !=""){
            $(panelNode).animate({opacity:1,'z-index':10},500);
        }
    }
    function close_panel(panelNode) {
        if(typeof (panelNode) !="undefined" && panelNode !=""){
            $(panelNode).animate({opacity:0,'z-index':1},200);
        }
    }

    cssMap = [{cssName:"width",cssValue:'100px'},
        {cssName:"background-color",cssValue:'var(--sub_color)'},
        {cssName:"color",cssValue:'#fff'}];
    elemTitle.gridTitle($(".loss-msg .loss-operator .loss-nav .loss-approve"),  "挂失申请",cssMap);
    // elemTitle.gridTitle($(".loss-msg .loss-operator .loss-nav .loss-ing"),      "挂失状态",cssMap);
    elemTitle.gridTitle($(".loss-msg .loss-operator .loss-nav .loss-recording"),"挂失记录",cssMap);
    elemTitle.gridTitle($(".loss-msg .loss-operator .loss-nav .loss-tip"),      "挂失流程",cssMap);

    elemTitle.gridTitle($(".loss-global .loss-global-nav .to-home"),   "主页",     [{cssName:"width",cssValue:'50px'}]);
    elemTitle.gridTitle($(".loss-global .loss-global-nav .to-my-page"),"个人信息", [{cssName:"width",cssValue:'100px'}]);
    elemTitle.gridTitle($(".loss-global .loss-global-nav .to-help"),   "帮助",     [{cssName:"width",cssValue:'50px'}]);


    hasLossMsg = false;
    hasLossHistory = false;
    function getCardMsg() {
        hasLossMsg = true;

        $.ajax({
            url:"${global_url}lossCard/getCards",
            method:"post",
            dataType:"json",
            data:{},
            success:function (data) {
                if(data.succeed == true){
                    setMsg(data.data[0]);
                }else {
                    setErrorMsg(data.data);
                }
                hasLossMsg = false;
            },
            error:function () {
                setErrorMsg("网络连接失败...");
                hasLossMsg = false;
            }
        });
    }
    function setMsg(msg) {

        let _loss_html_msg = " <table class='loss-approve-msg'>" +
            "<tfoot>" +
            "   <tr>" +
            "       <td align='center'>" +
            "           <input type='button' value='一键挂失' class='inline_block loss-card'>" +
            "           <span class='iconfont inline_block loss-card-tip icon-wenhao'></span>" +
            "       </td>" +
            "   </tr>" +
            "</tfoot>" +
            " <tbody><tr>" +
            "<td align='center'>" +
            "   <img src='"+msg.cardUrl+"' style='position: inherit;margin-bottom:10px;opacity:1 !important;width: 200px;height: 100px;background-color: #4e65c7;border-radius: 5px;z-index: 5;'>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'>"+msg.uName+"</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center' id='_card_id' title='IC卡号'>"+msg.cardId+"</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'>"+msg.cardType+"</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'>余额："+msg.cardBlance+"￥</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'>正在使用中</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'>开卡时间："+msg.cardCreateTime+"</td>" +
            "</tr></tbody></table>";
        $(".loss-operator-panel .loss-approve-panel .loss-approve-msg").remove();
        $(".loss-operator-panel .loss-approve-panel").append(_loss_html_msg);


        $(".loss-msg .loss-operator-panel .loss-approve-panel .loss-approve-msg .loss-card-tip").click(function () {
            $(".loss-msg .loss-operator .loss-nav .loss-tip").click();
        });
        //一键挂失==>去验证邮箱和填写备注
        $(".loss-operator-panel .loss-approve-panel .loss-approve-msg tfoot .loss-card").click(function () {
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
                        $(".loss-msg .loss-panel-ack-email").animate({top:'50%'},800);
                    }
                    loading_cir.loaded("body");
                },
                error:function () {
                    loading_cir.loaded("body");
                }
            });

        });
    }
    function setErrorMsg(msg) {
        let _loss_html_msg = " <table class='loss-approve-msg'>" +
            " <tbody>" +
            "<tr>" +
            "    <td align='center'>"+msg+"</td>" +
            "</tr>" +
            "<tr>" +
            "    <td align='center'><input type='button' value='去查看' id='toseeHistory' style='border:0;width: 80px;height: 30px;background-color: #c7254e;color: #fff;font-size: 14px;font-weight: 600;'></td>" +
            "</tr>"+
            "</tbody></table>";
        $(".loss-operator-panel .loss-approve-panel .loss-approve-msg").remove();
        $(".loss-operator-panel .loss-approve-panel").append(_loss_html_msg);

        $('#toseeHistory').click(function () {
            $('.loss-msg .loss-operator .loss-nav .loss-recording').click();
        });
    }
    $('.loss-msg .loss-operator .loss-nav .loss-recording').click(function () {
        // if (typeof ($(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss")) == "undefined"){

        // }else{
            dataGrid.reload($(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss"),historyData);
        // }
    })



</script>

    <script>
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
                {
                    id:"back_loss",
                    txt:"撤回",
                    icon:"add-icon",
                    btn_style:"alter",//normal、alter、msg
                    click:function () {
                        // lossBack();
                    }
                },
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
        dataGrid.grid($(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss"),historyData);
        $("#reflush_history").click(function () {
            dataGrid.reload($(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss"),historyData)
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
            var cardId=dataGrid.getSelection(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss",2);
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
            $(".loss-msg .loss-history").remove();
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

            $(".loss-msg").append(_history_html);
            $(".loss-msg .loss-history *").css("opacity","1");
            $(".loss-msg .loss-history").animate({width:'100%',height:'100%'},800);

            // 关闭历史
            $("#konwHistory").click(function () {
                $(".loss-msg .loss-history *").remove();
                $(".loss-msg .loss-history").animate({width:'0',height:'0'},800);
            });
        }

        $("#back_loss").click(function () {
            var cardId=dataGrid.getSelection(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss",2);
            if(cardId.length>1){
                my_tip.tip("选择太多了！",1,'body');
                return;
            }
            if(cardId.length<1){
                my_tip.tip("请先选择需要查看的信息！",1,'body');
                return;
            }
            let cardType = dataGrid.getSelection(".loss-msg .loss-operator-panel .loss-recording-panel .table-loss",4);
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
