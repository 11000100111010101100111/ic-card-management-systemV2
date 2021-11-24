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
            transform: translate(-50%,0);
        }
        .loss-panel  .start-panel .start-back li:nth-child(1){
            /*border: 1000px solid;*/
            border-width: 1000px 1000px 1000px 1000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(4, 167, 140, 0.5) rgba(0,0,0,0);
            animation: move-start-panel 2s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .2s;
            z-index: 10;
        }
        .loss-panel  .start-panel .start-back li:nth-child(2){
            border-width:  1000px 1500px  1000px 1500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) #81e1b3 rgba(0,0,0,0);
              animation: move-start-panel 1.8s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .5s;
            z-index: 9;
        }
        .loss-panel  .start-panel .start-back li:nth-child(3){
            border-width:  1000px 2000px 1000px 2000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(76, 199, 140, 0.81) rgba(0,0,0,0);
              animation: move-start-panel 1.6s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .8s;
            z-index: 8;
        }
        .loss-panel  .start-panel .start-back li:nth-child(4){
            border-width:  1000px 2500px 1000px 2500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(53, 199, 170, 0.6) rgba(0,0,0,0);
              animation: move-start-panel 1.4s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 1.1s;
            z-index: 7;
        }
        .loss-panel  .start-panel .start-back li:nth-child(5){
            border-width:  1000px 3000px 1000px 3000px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(85, 191, 199, 0.4) rgba(0,0,0,0);
              animation: move-start-panel 1.2s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 1.4s;
            z-index: 6;
        }
        .loss-panel  .start-panel .start-back li:nth-child(6){
            border-width: 1000px 3500px 1000px 3500px;
            border-style: solid solid solid solid;
            border-color: rgba(0,0,0,0) rgba(0,0,0,0) rgba(129, 191, 199, 0.2) rgba(0,0,0,0);
              animation: move-start-panel .8s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: 1.7s;
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
        }
        .loss-panel .start-panel .move-ul li:nth-child(2){
            left:21%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .4s;
        }
        .loss-panel .start-panel .move-ul li:nth-child(3){
            left:34%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .2s;
        }
        .loss-panel .start-panel .move-ul li:nth-child(4){
            left: 47.5%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
        }

        .loss-panel .start-panel .move-ul li:nth-child(5){
            left: 61%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .2s;
        }
        .loss-panel .start-panel .move-ul li:nth-child(6){
            left: 74%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .4s;
        }
        .loss-panel .start-panel .move-ul li:last-child{
            left: 87%;
            animation: move-down-lis .5s var(--animate-style);
            animation-fill-mode: forwards;
            animation-delay: .6s;
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
            transform: translate(-50%,-100%);
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 400;
            color: var(--sub_color);
        }
        .loss-msg .loss-return-panel .loss-back{
            cursor: pointer;
        }
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
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 308 308"><defs><style>.cls-1{opacity:0.3;fill:url(#未命名的渐变_24);}</style><linearGradient id="未命名的渐变_24" x1="20.61" y1="231.01" x2="287.39" y2="76.99" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#00e7ff"/><stop offset="0.49" stop-color="#49bac8"/><stop offset="1" stop-color="#6583f7"/></linearGradient></defs><g id="图层_2" data-name="图层 2"><g id="图层_1-2" data-name="图层 1"><path class="cls-1" d="M154,0A154,154,0,1,0,308,154,154,154,0,0,0,154,0Zm0,274A120,120,0,1,1,274,154,120,120,0,0,1,154,274Z"/></g></g></svg>
    </div>
    <div class="loss-msg">

        <div class="loss-return-panel">
            <span class="iconfont loss-back icon-xiangshang"> </span>
        </div>
    </div>
<script>
    $("#quick-loss").click(function () {
        $(".loss-msg").animate({top:'50%',opacity:1},800);
    });

    $(".loss-msg .loss-return-panel .loss-back").click(function () {
        $(".loss-msg").animate({top:'-100%',opacity:0},800);
    });
</script>
</body>
</html>
