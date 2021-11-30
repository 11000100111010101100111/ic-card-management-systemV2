<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/17
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>页面不存在</title>
    <link rel="shortcut icon" href="${global_url}pic/page-error.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body{
            overflow: hidden;
            -webkit-overflow-scrolling: unset;
        }
        .div {
            width:300px;
            height:200px;
            margin:100px auto;
            /*background:url(http://www.100sucai.com/img/demo/1373.png)*/
        }
        #animation {
            display: inline-block;
            /* -webkit-animation: fadeInUpBig 1s .2s ease both; */
            animation-iteration-count: infinite;
            background-color: rgb(4, 167, 140);
            text-align: center;
            height: auto;
            /*-moz-animation: fadeInUpBig 1s .2s ease both;*/
            animation-duration: 3s;
            position: absolute;
            top: 10%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            font-size: 32px;
            border-radius: 10px;
            color: #fff;
            box-shadow: 0 0 10px #666;
            z-index: 10;
        }
        @-webkit-keyframes fadeInUpBig {
            0% {
                opacity:0;
                -webkit-transform:translateY(2000px)
            }
            100% {
                opacity:1;
                -webkit-transform:translateY(0)
            }
        }
        @-moz-keyframes fadeInUpBig {
            0% {
                opacity:0;
                -moz-transform:translateY(2000px)
            }
            100% {
                opacity:1;
                -moz-transform:translateY(0)
            }
        }
        .cir{
            /*width: 100px;height: 100px;*/
            width: 50%;
            height: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            border-radius: 50%;
            border: 5px solid #fff;
            z-index: 5;
            background-color: #c7254e;
            animation: toBig 2s ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes toBig {
            from{
                transform:translate(-50%,-50%) scale(0.0) ;
            }to{
                 transform:translate(-50%,-50%) scale(1);
             }
        }
        .font{
            display: inline-block;
            position: absolute;
            top: 0;
            left: 100%;
            transform: translate(calc(-100% - 80px),20px);
            font-size: 40px;
            color: #fff;
            border: 10px solid;
            padding: 5px;
            border-radius: 20px;
            z-index: 20;
            text-align: center;
        }
        .sun{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50% ,-50%);
            border-radius: 50%;
            background-color: #ff3126;
            width: 20%;
            height: 20%;
            box-shadow: 0 0 8px yellow;
        }
        .xin{
            display: inline-block;
            position: absolute;
            top: 50%;
            left: 0;
            transform: translate(calc(-50% - 3px),-50%);
            width: 20px;height: 20px;
            border-radius: 50%;
            border:2px solid #fff;
            background-color: #4e65c7;
        }
        @keyframes move-jin {
            from{transform: translate(-50%,-50%) rotate(0);}
            to{transform: translate(-50%,-50%) rotate(360deg);}
        }
        @keyframes move-shui {
            from{transform: translate(-50%,-50%) rotate(0);}
            to{transform: translate(-50%,-50%) rotate(360deg);}
        }
        @keyframes move-huo {
            from{transform: translate(-50%,-50%) rotate(0);}
            to{transform: translate(-50%,-50%) rotate(360deg);}
        }
        @keyframes move-di {
            from{transform: translate(-50%,-50%) rotate(0);}
            to{transform: translate(-50%,-50%) rotate(360deg);}
        }
        @keyframes move-tu {
            from{transform: translate(-50%,-50%) rotate(0);}
            to{transform: translate(-50%,-50%) rotate(360deg);}
        }
        .tu-xin{
            animation: move-tu 13s infinite linear;animation-delay: 2s;
        }
        .jing-xin{animation: move-tu 10s infinite linear;animation-delay: 2.1s;}
        .di-qiu{animation: move-di 12s infinite linear;animation-delay: 2.2s;}
        .huo-xin{animation: move-huo 9.8s infinite linear;animation-delay: 2.3s;}
        .shui-xi{animation: move-shui 11.2s infinite linear;animation-delay: 2.4s;}
        .moon{
            border-radius: 50%;
            position: absolute;
            top:50%;left: -50%;
            transform: translate(-100%,-50%);
            animation: move-moon 6s infinite linear;
            animation-delay: 2.1s;
        }
        @keyframes move-moon {
            0%{top:50%;left: -50%;transform: translate(-100%,-50%);}
            25%{top:-50%;left: 50%;transform: translate(-50%,-100%);}
            50%{top:50%;left: 150%;transform: translate(0%,-50%);}
            75%{top:150%;left: 50%;transform: translate(-50%,0%);}
            100%{top:50%;left: -50%;transform: translate(-100%,-50%);}
        }
    </style>
</head>
<body>
<span class="font">当前<font style="color: #4e65c7;font-weight: 800;">页面</font>不存在</span>
<div class="cir" style="width: 2000px;height: 2000px;font-family: 'Adobe 楷体 Std R';">
    <div class="xin" style="background-color: #4e65c7;width: 40px;height: 40px;"></div>
    <div class="tu-xin cir">
        <div class="xin" style="background-color: #2f9833;width: 50px;height: 50px; "></div>
        <div class="jing-xin cir">
            <div class="xin" style="background-color: #2e6da4;width: 25px;height: 25px;"><div class="moon" style="background-color: yellow;width: 5px;height: 5px;border: 2px solid #fff;"></div></div>
            <div class="di-qiu cir">
                <div class="xin" style="background-color: #4c8596;"></div>
                <div class="huo-xin cir">
                    <div class="shui-xi xin"></div>
                    <div class="sun"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="animation" class="div animate__animated animate__hinge">您访问的页面不存在</div>
</body>
</html>

