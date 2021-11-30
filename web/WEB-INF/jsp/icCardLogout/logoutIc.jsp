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
                transform:translate(-50%,-50%);
                z-index: 5;
                border-radius: 5px;
                box-shadow: 0 0 10px #666;
                backdrop-filter: blur(8px);
                -webkit-backdrop-filter: blur(8px);
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
        </div>
        <div class="logout-history logout-panel">
            <div class="close">
                <span></span>
                <span></span>
            </div>
        </div>
        <div class="logout-title">
            <span>注&nbsp;&nbsp;销</span>
        </div>

        <%--//面板切换--%>
        <script>
            //去注销
            $("#logout-toLogout-btn").click(function () {
                showPanel(".logout-card");
            });
            //关闭去注销
            $(".logout-card  .close").click(function () {
                closePanel(".logout-card");
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
                window.location.href='http://localhost:8080/nchkkjxy/';
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
    </body>
</html>
