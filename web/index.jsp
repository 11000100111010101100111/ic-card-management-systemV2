
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>login</title>
  <link rel="icon shortcut" href="http://localhost:8080/nchkkjxy/theame/img/favicon.ico" type="img/x-icon">
  <link rel="stylesheet" type="text/css" href="theame/css/ataticAll.css">
  <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/myLayer.css">
  <style>
    body{
      /* 主题色 */
      --main_color:#2a3fff;
      /* 次主题色 */
      --sub_color: rgb(4, 167, 140);
    }
    a{
      text-decoration: none;
      /*color: rgba(29, 44, 96, 0.9) !important;*/
      color: rgba(29, 44, 96, 0.9) !important;
      font-size: 13px !important;
      margin-right: 15px;
    }
  </style>
  <!--        login-->
  <style>
    /** {*/
    /*    margin: 0;*/
    /*    padding: 0;*/
    /*}*/
    body::-webkit-scrollbar{
      display: none;
    }
    /*b/*/

    .login {
      position: absolute;
      width: 400px;
      top: 50%;
      /*left: 20%;*/
      transform: translate(-20%, -50%);
      background-color: #eee;
      border-radius: 5px;
      box-shadow: 0 0 12px #666;
    }

    .login h3 {
      padding-top: 10px;
      padding-bottom: 10px;
      width: 100%;
      text-align: center;
      /*background-color: #872940;*/
      background-color:  rgba(29, 44, 96, 0.9);
      /* color: #084299; */
      color: #fff;
      font-size: 32px;
      font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
      border-radius: 5px 5px 0 0;
    }

    .login .from,
    .login .but {
      margin-left: 18%;
      margin-top: 20px;
    }

    .login .from {
      width: 60%;
    }

    .login .from .input {
      margin-top: 10px;
      outline: none;

    }

    .login .from .input>div {
      width: 100%;
      border-radius: 3px;
    }

    #uid,
    #upwd,
    #ucode{
      font-size: 13px;
      caret-color: rgba(29, 44, 96, 0.9);
    }

    input::-webkit-input-placeholder {
      color: #8f9ebf;
    }
    /* 火狐 Mozilla Firefox 4 to 18 */
    input:-moz-placeholder {
      color: #8f9ebf;
    }
    /* 火狐 Mozilla Firefox 19+ */
    input::-moz-placeholder {
      color: #8f9ebf;
    }
    /* Internet Explorer 10+ */
    input:-ms-input-placeholder {
      color: #8f9ebf;
    }

    .login .from .input * {
      vertical-align: top;
    }

    .login .from .input .clean,
    .login .from .input .font {

      width: 25px;
      height: 25px;
      background-color: #fff;
    }

    .login .from .input .notfocus {
      border: 1px solid #666;
    }

    @keyframes show-clean {
      0% {
        background-size: 50% 50%;
      }

      50% {
        background-size: 60% 60%;
      }

      100% {
        background-size: 50% 50%;
      }
    }

    .login .from .input .font {
      background-size: 100% 100%;

      background-repeat: no-repeat;
      border-radius: 3px 0 0 3px;
    }

    .login .from .input .clean {
      border-radius: 0 3px 3px 0;
    }

    .login .from .inline-ele .inline-block-ele {
      display: inline-block;
      font-size: 12px;
    }

    .login .from .input .inline-ele {
      display: block;
    }

    .login .from .input label {
      opacity: 0;
      font-size: 10px;
      color: brown;
      margin-left: 5px;

      transition: all 0.3s;
    }

    .login .from .input input:focus {
      outline: none;
    }

    .focus-left {
      border: 1px solid #337ab7;
      border-right: none;
    }

    .getFocus {
      border: 1px solid #117ad6;
      animation: getFocus 3s ease-in;
    }

    @keyframes getFocus {
      0% {
        border-color: rgba(0, 0, 0, 0);
        box-shadow: 0 0 8px rgba(0, 0, 0, 0);
      }

      25% {
        border-color: #117ad6;
        box-shadow: 0 0 10px #117ad6;
      }

      100% {
        box-shadow: 0 0 8px rgba(0, 0, 0, 0);
      }
    }

    .inerror {
      border: 1px solid #666;
      animation: inerror 3s ease-in;
    }

    @keyframes inerror {
      0% {
        border-color: rgba(0, 0, 0, 0);
      }

      25% {
        border-color: crimson;
      }

      100% {
        border-color: #666;
      }
    }

    .insucced {
      border: 1px solid #666;
      animation: insucced 3s ease-in;
    }

    @keyframes insucced {
      0% {
        border-color: rgba(0, 0, 0, 0);
      }

      25% {
        border-color: green;
      }

      100% {
        border-color: #666;
      }
    }


    .errorlabel {
      transition: error-label 2s initial linear;
    }


    @keyframes error-label {
      0% {
        color: rgba(0, 0, 0, 0);
      }

      25% {
        color: brown;
      }

      100% {
        color: rgba(0, 0, 0, 0);
      }
    }



    .succeedlabel {
      transition: succed-label 2s initial linear;
    }

    @keyframes succeed-label {
      0% {
        color: rgba(0, 0, 0, 0);
      }

      25% {
        color: green;
      }

      100% {
        color: rgba(0, 0, 0, 0);
      }
    }


    .login .from .input input {
      width: 85%;
      height: 25px;
      font-size: 16px;
      border: none;
    }

    .but {
      float: right;
      margin-right: 20%;
      margin-top: 10px;
      margin-bottom: 20px;
    }

    .but * {
      font-size: 16px;
      color: #fff;
      border-radius: 3px;
      padding: 3px;
      border: none;
    }

    .but .sure {
      width: 90px;
      border: 2px solid rgba(0, 0, 0, 0);
      /*background-color: #337ab7;*/
      background-color:  rgba(29, 44, 96, 0.9);
    }

    .but .sure:hover {
      transition: all 0.5s;
      cursor: pointer;
      border: 2px solid #f0ad4e;
    }

    .but .agine {
      width: 60px;
      border: 2px solid rgba(0, 0, 0, 0);
      background-color: #f0ad4e;
    }

    .but .agine:hover {
      transition: all 0.5s;
      cursor: pointer;
      /*border: 2px solid #337ab7;*/
      border: 2px solid  rgba(29, 44, 96, 0.9);
    }

    .code-img {
      /*width: 80px;*/
      /*height: 30px;*/
      /* display: inline-block; */
      /*float: right;*/
      margin-top: 10px;
    }

    .code-img a{
      display: inline-block;
      text-decoration: none;
      font-size: 14px;
      color:#666;
    }

    .code-img a:hover{
      color:#f0ad4e;
    }

    .code-img canvas {
      display: inline-block;
      height: 30px;
      width: 100px;
      border: 1px solid #999;
      border-radius: 5px;
      background-color: silver;
    }

    /*.notfocus {*/
    /*    display: inline-block;*/
    /*}*/
  </style>
  <style>
    *{
      margin: 0;
      padding: 0;

      /*//设置文本无法选中*/
      -webkit-user-select:none;
      -moz-user-select:none;
      -ms-user-select:none;
      user-select:none;
    }
    a{

    }
    a:hover{
      transition: all 0.5s;
      text-decoration: underline;
      /* box-shadow: 0 1px 1px #f0ad4e; */
      color: #f0ad4e !important;
    }
    html,body{
      height: 100%;
      width: 100%;
      overflow: hidden;
    }
    /*全部区域==================================*/
    .box{
      width: 100%;


    }

    /*上部区域==================================*/
    .top-box{
      position: absolute;
      height: 15%;
      /*background-color: #398fa4;*/
      /*background-image:linear-gradient(45deg, #f09 0%, #3023AE 100%);*/
      background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);

    }
    #logo{
      position: relative;
      width: 300px;
      height: 150px;
      border: 1px solid #aaa;
      border-top: 0;
      border-left: 0;
      box-shadow: 4px 4px 6px #666;
      margin: 100px auto;
      border-radius:0 0 6px 0;
      background-position: center;
      background-size: 100% 100%;
      backdrop-filter: blur(0.9);
      background-repeat: no-repeat;
    }
    #head_title{
      position: absolute;
      display: inline-block;
      transition: all;
      transform: translate(140%,-80%);
      top: 50%;
      left: 50%;
    }
    /*// 添加伪元素*/
    /*.top-box>div::before,*/
    /*.top-box>div::after {*/
    /*       position: absolute;*/
    /*       top: 50%;*/
    /*       margin-top: -5px;*/
    /*       content: '';*/
    /*       width: 9px;*/
    /*       height: 9px;*/
    /*       background-color: rgba(0,0,0,0);*/
    /*       border: 1px solid #f60;*/
    /*       border-left-color: transparent;*/
    /*       border-bottom-color: transparent;*/
    /*       border-radius: 50%;*/
    /*   }*/

    /*.top-box>div::before {*/
    /*    left: -6px;*/
    /*    transform: rotate(45deg);*/
    /*}*/

    /*.top-box>div::after {*/
    /*    right: -6px;*/
    /*    transform: rotate(-135deg);*/
    /*}*/


    .false-box,.top-box,.bottom-box{
      z-index: 1;
      /*background-color: #fff;*/
    }
    .mid-box{
      z-index: 9;
      animation: midBoxShadow linear 10s infinite;
    }
    @keyframes midBoxShadow {
      0%{
        box-shadow: 0 50px 50px rgba(117, 153, 174, 0.1);
      }
      /*16%{*/
      /*  box-shadow: 0 0 12px #3023AE;*/
      /*}*/
      /*32%{*/
      /*  box-shadow: 0 0 6px #ff2132;*/
      /*}*/
      50%{
        box-shadow: 0 20px 20px rgba(213, 215, 255, 0.3);
      }
      /*66%{*/
      /*  box-shadow: 0 0 6px #ff2132;*/
      /*}*/
      /*82%{*/
      /*  box-shadow: 0 0 12px #3023AE;*/
      /*}*/
      100%{
        box-shadow: 0 50px 50px rgba(117, 153, 174, 0.1);
      }
    }
    #container{
      z-index: 2;
    }
    /*中部区域==================================*/

    .false-box{
      /*position: absolute;*/
      height: 85%;
      /*background-color: #a2aeb0;*/
      /*background-image: linear-gradient(to top, #fddb92 0%, #d1fdff 100%);*/
      background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
    }
    .mid-box{
      height: 70%;
      background-color: rgba(255, 255, 255, 0.2);
      /*filter: initial ;*/

      float: left;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);

      /*background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);*/
      /*box-shadow: 0 0 10px #333;*/
    }

    .login-box{
      display: inline-block;

    }
    .left-login{
      width: 65%;
      margin-right: 20px;
      height: 100%;
      opacity: 0.6;
    }
    .right-login{
      /*width: 30%;*/

      box-shadow: 0 0 8px #666;
      border-radius: 6px;
      margin-top: 20px;
      margin-bottom: 20px;

      /*background: linear-gradient(135deg, #fff 0%, #c3cfe2 100%);*/

    }
    /*.right-login>.form{*/
    /*    margin: 10px;*/
    /*    !*margin-bottom: 20px;*!*/
    /*}*/

    /*.right-login>.form>ul>li{*/
    /*    list-style: none;*/
    /*    margin-top: 10px;*/
    /*    margin-bottom: 5px;*/
    /*}*/

    #toLogin{
      /*width: 100%;*/
      text-align: center;

      text-decoration: none;
      border: 1px solid #666;
      /*width: 40px;*/
      /*height: 20px;*/
      padding: 2px 5px 2px 5px;
      border-radius: 5px;
      margin-bottom: 5px;
    }
    #toLogin:hover{
      transition: all 0.3s;
      box-shadow: 0 0 6px #666;
    }

    #toRegrister{
      float: right;
    }
    #toFindPwd{
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }
    /*中部背景==================================*/


    /*底部区域==================================*/
    .bottom-box{
      position: absolute;
      height: 15%;
      /*background-color: #398fa4;*/
      /*background-image:linear-gradient(45deg, #3023AE 0%, #f09 100%);*/
      background-image: linear-gradient(135deg, #c3cfe2 0%, #f5f7fa 100%);
    }

  </style>
  <style>
    body{
      /*background-color: #151515;*/
      width: 100%;
      height: 100%;
      margin: 0px;
      /*overflow: hidden;*/


      --blue: #c2bdc3;
      --lightBlue: #0ff;
      /*animation: linear;*/
      /*--spinAnimation: spin 23s cubic-bezier(.39,-0.52,.53,.98) 0s infinite;*/
      --spinAnimation: spin 10s linear infinite;
    }


    #container{
      width: 100vw;
      height: 100vw;
      max-width: 100vh;
      max-height: 100vh;
      /*width: 90vw;*/
      /*height: 90vw;*/
      /*max-width: 90vh;*/
      /*max-height: 90vh;*/
      margin: auto;
      position: absolute;
      top: 0; right: 0; bottom: 0; left: 0;
      transform: translateX(-50%);
      /*animation: tranlation 1s ;*/
      /*transition: all 1s linear;*/
      /*transform: translateX(-50%);*/
    }

    .back-con{
      position: absolute;
      width: 78%;
      height: 78%;
      float: left;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      border-radius: 50%;
    <%--background: url("${pageContext.request.contextPath}/theame/img/gril.JPG") no-repeat;--%>
    <%--background-position: center;--%>
    <%--background-size: 100% 100%;--%>
      /*background-color:#3023AE ;*/

      /*animation: shadow 5s linear infinite;*/
      /*background-image:linear-gradient(45deg, #3023AE 0%, #f09 100%);*/
      /*background-color: #735290;*/



      border: 1px solid #2b92d4;

      text-align: center;
      cursor: pointer;
      /*margin:150px auto;*/
      /*box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);*/
      overflow: hidden;
      -webkit-animation-timing-function: ease-in-out;
      -webkit-animation-name: breathe;
      -webkit-animation-duration: 1.5s;
      -webkit-animation-iteration-count: infinite;
      -webkit-animation-direction: alternate;
    }
    @keyframes shadow {
      0%{
        box-shadow: 0 0 0px #3023AE;
      }
      9%{
        box-shadow: 0 0 12px #3023AE;
      }
      10%{
        box-shadow: 0 0 0px #ff2132;
      }
      50%{
        box-shadow: 0 0 100px #ff2132;
      }
      90%{
        box-shadow: 0 0 0px #ff2132;
      }
      91%{
        box-shadow: 0 0 12px #3023AE;
      }
      100%{
        box-shadow: 0 0 0px #3023AE;
      }
    }


    @-webkit-keyframes breathe {
      0% {
        opacity: 0.8;
        box-shadow: 0 1px 2px rgba(0, 147, 223, 0.4), 0 1px 1px rgba(0, 147, 223, 0.1) inset;
      }

      100% {
        opacity: 1;
        border: 1px solid rgba(59, 235, 235, 0.7);
        box-shadow: 0 1px 100px #0093df, 0 1px 1000px #0093df inset;
      }
    }


    #portal{
      width: 100%;
      height: 100%;
      position: relative;
      /*box-shadow: 0 0 16px #5e427a;*/
    }

    #portal > #mainGear{
      position: absolute;
      top:0px;
      left:0px;
      right: 0px;
      bottom: 0px;
      z-index: 2;
      animation: var(--spinAnimation);
      will-change: transform;
      /*z-index: 100;*/
      /*box-shadow: 0 0 16px #5e427a;*/
    }
    #mainGear > path{
      /*fill:#735290;*/
      fill: rgba(29, 44, 96, 0.9);
    }




    #mainGear .decoration{
      fill: var(--blue);
      stroke: var(--blue);
      stroke-width:1px;
    }


    #mainGear .runes path, #mainGear .runes circle{
      fill: none;
      /*fill: #2a3fff;*/
      /*stroke: var(--blue);*/
      /*stroke: #2a3fff;*/
      stroke: #ff1010;
      stroke-width:4px;
      /*animation:lighting_circle 4s infinite ;*/
    }

    @keyframes lighting_circle {
      from{stroke:#2a3fff;}
      to{
        stroke: #ff1010;
      }
    }


    #portal > #innerGears{
      position: absolute;
      top:14.5%;
      left:14.5%;
      right: 14.5%;
      bottom: 14.5%;
      border-radius: 50%;
      -webkit-clip-path: circle(50%);
      overflow: hidden;
    }


    #portal > #innerGears > .innerGear{
      position: absolute;
      transform-origin: center;
      animation: var(--spinAnimation);
      will-change: transform;
    }
    .innerGear .runes path{
      fill: var(--lightBlue);
    }


    @keyframes spin{
      from{transform: rotate(0deg);}
      to{transform: rotate(360deg);}
    }

    @keyframes tranlation {
      0%{}
      100%{
        transform: translateX(-50%);
      }
    }
  </style>
<%--  弹窗--%>
<%--  <style>--%>
<%--    /* 遮罩层 */--%>
<%--    .msg-show {--%>
<%--      display: none;--%>
<%--      position: fixed;--%>
<%--      top: 0;--%>
<%--      left: 0;--%>
<%--      width: 200px;--%>
<%--      height: 250px;--%>
<%--      background-color: rgba(0, 0, 0, 0.2);--%>
<%--      z-index: 99;--%>
<%--    }--%>
<%--    *{--%>
<%--      transition: all 0.5s;--%>
<%--    }--%>
<%--    /* 弹窗 */--%>
<%--    .msg-content {--%>
<%--      display: none;--%>
<%--      position: fixed;--%>
<%--      top: 20%;--%>
<%--      left: 65%;--%>
<%--      margin-left: -30%;--%>
<%--      width: 350px;--%>
<%--      height: 350px;--%>
<%--      min-width: 31.125rem;--%>
<%--      min-height: 18.625rem;--%>
<%--      border-radius: 5px;--%>
<%--      background-color: white;--%>
<%--      z-index: 99;--%>
<%--      box-shadow: 0 0 10px #666;--%>
<%--    }--%>
<%--    .msg-content>.logo{--%>
<%--      display: inline-block;--%>
<%--      position: fixed;--%>
<%--      transform: translate(315px,10px);--%>
<%--      margin: 0;--%>
<%--      padding: 1px 2px 1px 2px;--%>
<%--      border-radius: 5px;--%>
<%--      /*border: 1px solid #fff;*/--%>
<%--      background-color: #2b92d4;--%>
<%--      color: #fff;--%>
<%--      font-weight: 800;--%>
<%--    }--%>
<%--    .msg-body {--%>
<%--      position: relative;--%>
<%--      width: 100%;--%>
<%--      height: 100%;--%>
<%--    }--%>

<%--    .mb_revise {--%>
<%--      padding: .625rem 0 0 1.5625rem;--%>
<%--    }--%>

<%--    .mb_revise>p {--%>
<%--      padding-left: .25rem;--%>
<%--      margin-top: 2.125rem;--%>
<%--      font-family: 'FangSong', Times, serif;--%>
<%--      font-size: 15px;--%>
<%--      border-left: solid .125rem royalblue;--%>
<%--    }--%>
<%--    .mb_revise .icon{--%>
<%--       position:relative;--%>
<%--       width: 200px;--%>
<%--       height: 200px;--%>
<%--       left: 50%;--%>
<%--      box-shadow: 0 0 100px #e1f0ff;--%>
<%--      transform: translateX(-50%) translateY(-80px);--%>
<%--       margin-top: 45px;--%>
<%--       background: url("${pageContext.request.contextPath}/pic/login/忘记密码.png") no-repeat center;--%>
<%--       background-size: cover;--%>
<%--    }--%>
<%--    /* 确定和取消 */--%>
<%--    .determine,--%>
<%--    .cancen {--%>
<%--      position: absolute;--%>
<%--      width: 9.625rem;--%>
<%--      height: 4.1875rem;--%>
<%--      color: #fff;--%>
<%--      font-size: 18px;--%>
<%--      border: 0;--%>
<%--      outline: none;--%>
<%--      border-radius: 5px;--%>
<%--      box-shadow: 0 .125rem .125rem rgb(107, 96, 96);--%>
<%--      cursor: pointer;--%>
<%--    }--%>

<%--    .determine {--%>
<%--      right: 12.5rem;--%>
<%--      bottom: .725rem;--%>
<%--      background-color: rgba(9, 139, 245, 0.788);--%>
<%--    }--%>

<%--    .cancen {--%>
<%--      right: 2rem;--%>
<%--      bottom: .725rem;--%>
<%--      background-color: rgba(212, 37, 37, 0.788);--%>
<%--    }--%>

<%--    .determine:hover,--%>
<%--    .cancen:hover {--%>
<%--      color: #fff;--%>
<%--      box-shadow: 0 .134rem .1275rem rgb(58, 57, 57);--%>
<%--    }--%>

<%--    .determine:active,--%>
<%--    .cancen:active {--%>
<%--      box-shadow: 0 .134rem .1275rem rgba(230, 227, 227, .758);--%>
<%--    }--%>
<%--  </style>--%>
</head>
<body>
<%--<div class="msg-show">--%>
  <div class="msg-content">
    <div class="logo">msg</div>
    <div class="msg-body">
      <div class="mb_revise">
        <p class="msg-txt">消息：</p>
        <div class="icon"></div>
      </div>
      <button class="determine">确定</button>
      <button class="cancen">取消</button>
    </div>
  </div>
<%--</div>--%>
<div  style="width: 100%;height: 100%;">
  <div class="box top-box">
    <%--        <span style="width: 100%;height: 100%">1</span>--%>
    <div id ="logo" style="background-image: url('${pageContext.request.contextPath}/theame/img/logo.png');width: 90px;height: 40px;margin-top: 20px;margin-left: 20px;"></div>
    <div id="head_title">
        <span></span>
    </div>
  </div>
  <div class="box mid-box">
    <div class="left-login login-box"><span style="width: 100%;height: 100%"></span></div>
    <div class="right-login login-box">
      <form class="login" action="${pageContext.request.contextPath}/go/login">
        <h3>登 录</h3>
        <div class="from">
          <div class="input">
            <div class="inline-ele notfocus">
              <div class="font inline-block-ele" style="background-image: url('${pageContext.request.contextPath}/theame/img/user.png');"></div><!--
                            --><input name="easy_id" contenteditable="true" type="text" class="inline-block-ele" id="uid" placeholder="请输入账号" autocomplete="off" required>
            </div>
<%--            <label class="lab-id inline-ele" >error:12323!</label>--%>
          </div>
          <div class="input">
            <div class="inline-ele notfocus">
              <div class="font inline-block-ele" style="background-image: url('${pageContext.request.contextPath}/theame/img/password.png');"></div><!--
                            --><input name="password" contenteditable="true" type="password" class="inline-block-ele" id="upwd" placeholder="请输入密码" autocomplete="off" required>
            </div>
<%--            <label class="lab-pwd inline-ele" >error:12323!</label>--%>
          </div>
          <div class="input" style="">

            <div class="inline-ele notfocus" style="width: 52%;height: 31px;display: inline-block;">
              <div class="font inline-block-ele" style="background-image: url('${pageContext.request.contextPath}/theame/img/code.png');"></div><!--
                            --><input name="code" contenteditable="true" type="text" style="height:100%;width:75%;font-size: 11px;" class="inline-block-ele" id="ucode" placeholder="请输入验证码" autocomplete="off" required>
            </div>
            <div class="code-img inline-ele" style="width: 30%;display: inline;">
              <!-- <img src="#" alt="" title="单击换一张!!!"> -->
              <canvas title="单击换一张!!!" id="cav" onclick="getCodeImg()">
              </canvas>
            </div>
<%--            <label class="lab-code inline-ele" >error:12323!</label>--%>

          </div>

        </div>
        <div class="but">
          <input type="submit" class="sure" value="登  录">
          <input type="button" class="agine" value="重  置">

          <div class="help">
            <a href="#" id="wjmm" >忘记密码</a>
            <a href="${pageContext.request.contextPath}/go/toRegister">账号注册</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="box false-box">
    <%--        <div class="left-panel"><span style="width: 100%;height: 100%">2-1</span></div>--%>
    <%--        <div class="right-panel"><span style="width: 100%;height: 100%">2-2</span></div>--%>
  </div >
  <div id="container">
    <canvas class="back-con"   id="number_rain" ></canvas>
    <div id="portal">
      <svg id="mainGear"  viewBox="-10 -10 532 532" version="1.1" xmlns="http://www.w3.org/2000/svg" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;">
        <filter id="shaddowMain" x="-20%" y="-20%" width="200%" height="200%"  >
          <feOffset result="offOut" in="SourceAlpha" dx="0" dy="0" />
          <feGaussianBlur result="blurOut" in="offOut" stdDeviation="5"/>
          <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
        </filter>
        <path filter="url(#shaddowMain)" d="M281.426,1.266c-16.909,-1.688 -33.943,-1.688 -50.852,0l-5.24,47.066c-15.965,2.358 -31.605,6.548 -46.611,12.489l-28.071,-38.14c-15.487,6.992 -30.239,15.51 -44.039,25.426l18.996,43.38c-12.648,10.024 -24.098,21.474 -34.122,34.122l-43.38,-18.996c-9.916,13.8 -18.434,28.552 -25.426,44.039l38.14,28.071c-5.941,15.006 -10.131,30.646 -12.489,46.611l-47.066,5.24c-1.688,16.909 -1.688,33.943 0,50.852l47.066,5.24c2.358,15.965 6.548,31.605 12.489,46.611l-38.14,28.071c6.992,15.487 15.51,30.239 25.426,44.039l43.38,-18.996c10.024,12.648 21.474,24.098 34.122,34.122l-18.996,43.38c13.8,9.916 28.552,18.434 44.039,25.426l28.071,-38.14c15.006,5.941 30.646,10.131 46.611,12.489l5.24,47.066c16.909,1.688 33.943,1.688 50.852,0l5.24,-47.066c15.965,-2.358 31.605,-6.548 46.611,-12.489l28.071,38.14c15.487,-6.992 30.239,-15.51 44.039,-25.426l-18.996,-43.38c12.648,-10.024 24.098,-21.474 34.122,-34.122l43.38,18.996c9.916,-13.8 18.434,-28.552 25.426,-44.039l-38.14,-28.071c5.941,-15.006 10.131,-30.646 12.489,-46.611l47.066,-5.24c1.688,-16.909 1.688,-33.943 0,-50.852l-47.066,-5.24c-2.358,-15.965 -6.548,-31.605 -12.489,-46.611l38.14,-28.071c-6.992,-15.487 -15.51,-30.239 -25.426,-44.039l-43.38,18.996c-10.024,-12.648 -21.474,-24.098 -34.122,-34.122l18.996,-43.38c-13.8,-9.916 -28.552,-18.434 -44.039,-25.426l-28.071,38.14c-15.006,-5.941 -30.646,-10.131 -46.611,-12.489l-5.24,-47.066Zm-25.426,78.094c97.49,0 176.64,79.15 176.64,176.64c0,97.49 -79.15,176.64 -176.64,176.64c-97.49,0 -176.64,-79.15 -176.64,-176.64c0,-97.49 79.15,-176.64 176.64,-176.64Z"/>
        <g class="runes">
          <g id="_11">

            <!--                                <path d="M137.832,47.21c4.022,-2.236 8.751,-1.415 10.556,1.832c1.804,3.246 0.005,7.697 -4.016,9.932c-4.021,2.235 -8.751,1.414 -10.556,-1.832c-1.804,-3.247 -0.005,-7.697 4.016,-9.932Z"/>-->
            <!--                                <path d="M134.525,41.66c8.038,-4.832 17.768,-3.422 21.715,3.145c3.948,6.568 0.626,15.822 -7.412,20.653c-8.039,4.831 -17.769,3.421 -21.716,-3.146c-3.947,-6.567 -0.626,-15.821 7.413,-20.652Z" />-->
            <!--                                <path class="filled" d="M126.278,60.627l-5.502,4.854l7.898,-1.128l-2.396,-3.726Z"/>-->
            <!--                                <path class="filled" d="M154.545,42.628l6.524,-2.141l-4.225,5.464l-2.299,-3.323"/>-->
          </g>
          <g id="_10">

            <!--                                <path d="M75.725,131.854l-5.027,15.873l-14.868,-11.133l14.868,11.133l-11.205,12.353" />-->
            <!--                                <path class="filled" d="M78.688,124.503c1.635,0.716 2.306,2.797 1.497,4.644c-0.808,1.847 -2.793,2.765 -4.428,2.049c-1.635,-0.716 -2.306,-2.797 -1.497,-4.644c0.809,-1.847 2.793,-2.765 4.428,-2.049Z"/>-->
            <!--                                <path class="filled" d="M59.452,160.086c1.274,1.386 0.98,3.733 -0.657,5.237c-1.636,1.504 -3.999,1.599 -5.273,0.212c-1.275,-1.386 -0.98,-3.733 0.656,-5.237c1.637,-1.504 4,-1.599 5.274,-0.212Z"/>-->
            <!--                                <path d="M53.279,125.007c3.844,2.696 4.315,8.663 1.051,13.319c-3.264,4.655 -9.035,6.247 -12.879,3.552c-3.844,-2.696 -4.315,-8.663 -1.051,-13.319c3.265,-4.655 9.035,-6.247 12.879,-3.552Z" />-->
            <circle cx="46.869" cy="132.749" r="1.309"/>
          </g>
          <g id="_9">

            <!--                                <path d="M38.054,234.74l0.287,40.868l-27.005,-21.188c0,0 26.646,-19.464 26.718,-19.68" />-->
            <!--                                <path class="filled" d="M31.59,246.088l-9.265,7.757l9.265,8.332l0,-16.089Z"/>-->
          </g>
          <g id="_8">
            <!--                                <path d="M54.417,358.926l8.834,4.453l-0.79,9.553c0,0 13.718,7.397 7.901,-1.581" />-->
            <!--                                <path d="M46.445,356.987l7.972,1.939c0,0 0,-15.729 5.674,-5.674" />-->
            <!--                                <path d="M62.461,372.932l-1.867,7.685l-9.265,-3.376c0,0 0.646,14.867 -4.669,6.536" />-->
            <!--                                <path d="M51.329,377.241l-7.364,-2.725l0.828,-8.479c0,0 -11.42,-6.608 -7.47,1.939" />-->
            <!--                                <path d="M54.417,358.926l-7.757,-2.155l-1.867,9.266" />-->
            <!--                                <path class="filled" d="M48.468,361.404l-1.005,10.392l9.983,3.663l1.509,-9.983l-10.487,-4.072Z"/>-->
          </g>
          <g id="_7">

            <!--                                <path d="M148.114,441.25l12.625,20.867l-18.5,13.863l-20.254,-11.348l1.221,-23.343l24.908,-0.039Z" />-->
            <!--                                <path d="M144.465,446.388l7.326,12.498l-10.845,9.121l-13.503,-7.254l0.575,-14.293l16.447,-0.072Z" />-->
          </g>
          <!--                            <path id="_6" d="M242.809,487.823l3.232,1.885l5.836,-6.015l-9.786,-6.913l-8.619,8.619l14.724,11.851l5.925,-6.375l7.991,5.656l14.903,-11.94l-9.786,-8.08l-9.696,7.631l5.566,5.925l3.771,-3.322" />-->
          <!--                            <path id="_5" class="filled" d="M373.909,436.559l-1.706,38.605l15.891,-10.594l-33.129,-18.135l18.944,-9.876Z"/>-->
          <g id="_4">

            <!--                                <path d="M463.782,359.991l2.411,16.878l-18.411,6.794l-3.069,-18.63l19.069,-5.042Z" />-->
            <!--                                <path class="filled" d="M458.974,364.669c0.269,-0.18 -8.888,3.501 -8.888,3.501l1.257,10.684l10.055,-4.489c0,0 -2.693,-9.517 -2.424,-9.696Z"/>-->
            <!--                                <path class="filled" d="M454.844,362.155l-0.449,-7.631c0,0 -3.681,-7.272 -0.359,-6.913c3.322,0.359 0.359,6.913 0.359,6.913"/>-->
            <!--                                <path class="filled" d="M445.597,374.993l-4.938,2.963c0,0 -6.015,-0.808 -5.387,1.975c0.629,2.783 5.387,-1.975 5.387,-1.975"/>-->
          </g>
          <!--                            <path id="_3" d="M471.399,247.987l0.877,-13.151l32.001,3.068l-1.096,34.194l-22.138,1.534l0,-22.357l8.987,0" style="stroke-width:4px;"/>-->
          <g id="_2">

            <!--                                <path d="M436.932,129.458l19.121,32.89l10.343,-7.571l-18.061,-33.146l12.293,-7.471" style="stroke-width:4px;"/>-->
            <!--                                <path d="M466.766,125.315l11.833,21.526" style="stroke-width:4px"/>-->
          </g>
          <!--                            <path id="_1" d="M362.988,44.27l-4.83,-8.012l8.634,-2.322l7.155,4.499l-1.114,17.195l0.876,9.037l-8.369,-0.319l-1.852,-6.66l9.345,-2.058l11.405,-11.706l7.662,3.433l1.488,9.561l-7.117,0.337" style="stroke-width:3.34px;"/>-->
          <g id="_12">

            <!--                                <path d="M258.47,33.811l16.609,-15.352l-17.776,-13.916l-16.699,14.904l21.817,18.404l12.569,-10.324" style="stroke-width:2.98px;"/>-->
            <!--                                <path class="filled" d="M257.393,9.885l-10.055,9.158l10.594,9.516l10.773,-9.875l-11.312,-8.799Z" style="stroke-width:1.55px;"/>-->
          </g>
        </g>
        <g class="decoration">
          <g>
            <!--                                <path d="M213.616,431.669c4.942,12.146 3.883,15.031 13.388,15.845c1.639,0.14 -4.585,-6.266 -5.282,-7.951c-0.617,-1.493 1.187,-5.65 5.843,-1.729c4.191,3.529 12.345,9.82 12.345,9.82l8.599,0l-19.497,-14.603c0,0 -15.698,-2.125 -15.396,-1.382Z"/>-->
            <!--                                <path d="M245.459,434.416l7.973,5.89l0,-5.674l-7.973,-0.216Z"/>-->
            <!--                                <path d="M257.878,434.416l-0.072,5.89l6.615,-5.89l-6.543,0Z"/>-->
            <!--                                <path d="M310.21,444.338l-3.017,-6.194l6.464,4.525l-3.447,1.669Z"/>-->
            <!--                                <path d="M261.114,447.654l20.383,-14.046c0,0 16.387,-2.472 16.232,-2.097c-3.157,7.607 -5.337,15.54 -14.38,16.143c-0.923,0.061 5.962,-7.898 5.761,-9.449c-0.201,-1.551 -2.514,-4.238 -6.967,0.143c-4.453,4.382 -12.21,9.306 -12.21,9.306l-8.819,0"/>-->
            <!--                                <path d="M299.508,444.321l3.017,-6.177l2.421,6.194l-5.438,-0.017Z"/>-->
          </g>
          <g>
            <!--                                <path d="M307.129,429.326c10.353,8.047 10.878,11.075 19.517,7.028c1.489,-0.698 -7.104,-3.133 -8.55,-4.244c-1.281,-0.985 -1.797,-5.487 4.196,-4.42c5.393,0.961 15.601,2.332 15.601,2.332l7.446,-4.299l-24.186,-2.898c0,0 -14.657,6.009 -14.024,6.501Z"/>-->
            <!--                                <path d="M336.08,415.783l9.849,1.114l-2.837,-4.913l-7.012,3.799Z"/>-->
            <!--                                <path d="M346.835,409.574l2.882,5.136l2.784,-8.407l-5.666,3.271Z"/>-->
            <!--                                <path d="M397.116,392l-5.709,-3.855l7.86,0.686l-2.151,3.169Z"/>-->
            <!--                                <path d="M356.255,419.42l10.63,-22.355c0,0 12.956,-10.335 13.009,-9.932c1.07,8.166 3.148,16.126 -4.382,21.17c-0.769,0.514 1.214,-9.821 0.264,-11.064c-0.949,-1.243 -4.295,-2.413 -5.961,3.608c-1.666,6.021 -5.922,14.164 -5.922,14.164l-7.638,4.409"/>-->
            <!--                                <path d="M387.84,397.336l-0.476,-6.857l5.193,4.153l-4.717,2.704Z"/>-->
          </g>
          <g>
            <!--                                <path d="M386.942,380.54c12.99,1.793 14.958,4.153 20.416,-3.672c0.941,-1.349 -7.719,0.839 -9.526,0.599c-1.602,-0.212 -4.3,-3.853 1.424,-5.925c5.151,-1.864 14.676,-5.781 14.676,-5.781l4.299,-7.446l-22.394,9.583c0,0 -9.69,12.532 -8.895,12.642Z"/>-->
            <!--                                <path d="M405.243,354.336l9.086,-3.959l-4.914,-2.837l-4.172,6.796Z"/>-->
            <!--                                <path d="M411.452,343.581l5.065,3.007l-1.794,-8.673l-3.271,5.666Z"/>-->
            <!--                                <path d="M446.21,303.222l-6.872,-0.485l7.15,-3.335l-0.278,3.82Z"/>-->
            <!--                                <path d="M424.534,347.398l-1.973,-24.675c0,0 6.054,-15.428 6.301,-15.105c5.009,6.536 10.789,12.391 6.789,20.524c-0.408,0.83 -3.859,-9.112 -5.302,-9.714c-1.444,-0.601 -4.927,0.059 -3.359,6.106c1.568,6.047 1.954,15.227 1.954,15.227l-4.41,7.637"/>-->
            <!--                                <path d="M440.845,312.481l-3.841,-5.701l6.574,1.001l-2.733,4.7Z"/>-->
          </g>
          <g>
            <!--                                <path d="M431.669,298.384c12.146,-4.942 15.031,-3.883 15.845,-13.388c0.14,-1.639 -6.266,4.585 -7.951,5.282c-1.493,0.617 -5.65,-1.187 -1.729,-5.843c3.529,-4.191 9.82,-12.345 9.82,-12.345l0,-8.599l-14.603,19.497c0,0 -2.125,15.698 -1.382,15.396Z"/>-->
            <!--                                <path d="M434.416,266.541l5.89,-7.973l-5.674,0l-0.216,7.973Z"/>-->
            <!--                                <path d="M434.416,254.122l5.89,0.072l-5.89,-6.615l0,6.543Z"/>-->
            <!--                                <path d="M444.338,201.79l-6.194,3.017l4.525,-6.464l1.669,3.447Z"/>-->
            <!--                                <path d="M447.654,250.886l-14.046,-20.383c0,0 -2.472,-16.387 -2.097,-16.232c7.607,3.157 15.54,5.337 16.143,14.38c0.061,0.923 -7.898,-5.962 -9.449,-5.761c-1.551,0.201 -4.238,2.514 0.143,6.967c4.382,4.453 9.306,12.21 9.306,12.21l0,8.819"/>-->
            <!--                                <path d="M444.321,212.492l-6.177,-3.017l6.194,-2.421l-0.017,5.438Z"/>-->
          </g>
          <g>
            <!--                                <path d="M429.326,204.871c8.047,-10.353 11.075,-10.878 7.028,-19.517c-0.698,-1.489 -3.133,7.104 -4.244,8.55c-0.985,1.281 -5.487,1.797 -4.42,-4.196c0.961,-5.393 2.332,-15.601 2.332,-15.601l-4.299,-7.446l-2.898,24.186c0,0 6.009,14.657 6.501,14.024Z"/>-->
            <!--                                <path d="M415.783,175.92l1.114,-9.849l-4.913,2.837l3.799,7.012Z"/>-->
            <!--                                <path d="M409.574,165.165l5.136,-2.882l-8.407,-2.784l3.271,5.666Z"/>-->
            <!--                                <path d="M392,114.884l-3.855,5.709l0.686,-7.86l3.169,2.151Z"/>-->
            <!--                                <path d="M419.42,155.745l-22.355,-10.63c0,0 -10.335,-12.956 -9.932,-13.009c8.166,-1.07 16.126,-3.148 21.17,4.382c0.514,0.769 -9.821,-1.214 -11.064,-0.264c-1.243,0.949 -2.413,4.295 3.608,5.961c6.021,1.666 14.164,5.922 14.164,5.922l4.409,7.638"/>-->
            <!--                                <path d="M397.336,124.16l-6.857,0.476l4.153,-5.193l2.704,4.717Z"/>-->
          </g>
          <g>
            <!--                                <path d="M380.54,125.058c1.793,-12.99 4.153,-14.958 -3.672,-20.416c-1.349,-0.941 0.839,7.719 0.599,9.526c-0.212,1.602 -3.853,4.3 -5.925,-1.424c-1.864,-5.151 -5.781,-14.676 -5.781,-14.676l-7.446,-4.299l9.583,22.394c0,0 12.532,9.69 12.642,8.895Z"/>-->
            <!--                                <path d="M354.336,106.757l-3.959,-9.086l-2.837,4.914l6.796,4.172Z"/>-->
            <!--                                <path d="M343.581,100.548l3.007,-5.065l-8.673,1.794l5.666,3.271Z"/>-->
            <!--                                <path d="M303.222,65.79l-0.485,6.872l-3.335,-7.15l3.82,0.278Z"/>-->
            <!--                                <path d="M347.398,87.466l-24.675,1.973c0,0 -15.428,-6.054 -15.105,-6.301c6.536,-5.009 12.391,-10.789 20.524,-6.789c0.83,0.408 -9.112,3.859 -9.714,5.302c-0.601,1.444 0.059,4.927 6.106,3.359c6.047,-1.568 15.227,-1.954 15.227,-1.954l7.637,4.41"/>-->
            <!--                                <path d="M312.481,71.155l-5.701,3.841l1.001,-6.574l4.7,2.733Z"/>-->
          </g>
          <g>
            <!--                                <path d="M298.384,80.331c-4.942,-12.146 -3.883,-15.031 -13.388,-15.845c-1.639,-0.14 4.585,6.266 5.282,7.951c0.617,1.493 -1.187,5.65 -5.843,1.729c-4.191,-3.529 -12.345,-9.82 -12.345,-9.82l-8.599,0l19.497,14.603c0,0 15.698,2.125 15.396,1.382Z"/>-->
            <!--                                <path d="M266.541,77.584l-7.973,-5.89l0,5.674l7.973,0.216Z"/>-->
            <!--                                <path d="M254.122,77.584l0.072,-5.89l-6.615,5.89l6.543,0Z"/>-->
            <!--                                <path d="M201.79,67.662l3.017,6.194l-6.464,-4.525l3.447,-1.669Z"/>-->
            <!--                                <path d="M250.886,64.346l-20.383,14.046c0,0 -16.387,2.472 -16.232,2.097c3.157,-7.607 5.337,-15.54 14.38,-16.143c0.923,-0.061 -5.962,7.898 -5.761,9.449c0.201,1.551 2.514,4.238 6.967,-0.143c4.453,-4.382 12.21,-9.306 12.21,-9.306l8.819,0"/>-->
            <!--                                <path d="M212.492,67.679l-3.017,6.177l-2.421,-6.194l5.438,0.017Z"/>-->
          </g>
          <g>
            <!--                                <path d="M204.871,82.674c-10.353,-8.047 -10.878,-11.075 -19.517,-7.028c-1.489,0.698 7.104,3.133 8.55,4.244c1.281,0.985 1.797,5.487 -4.196,4.42c-5.393,-0.961 -15.601,-2.332 -15.601,-2.332l-7.446,4.299l24.186,2.898c0,0 14.657,-6.009 14.024,-6.501Z"/>-->
            <!--                                <path d="M175.92,96.217l-9.849,-1.114l2.837,4.913l7.012,-3.799Z"/>-->
            <!--                                <path d="M165.165,102.426l-2.882,-5.136l-2.784,8.407l5.666,-3.271Z"/>-->
            <!--                                <path d="M114.884,120l5.709,3.855l-7.86,-0.686l2.151,-3.169Z"/>-->
            <!--                                <path d="M155.745,92.58l-10.63,22.355c0,0 -12.956,10.335 -13.009,9.932c-1.07,-8.166 -3.148,-16.126 4.382,-21.17c0.769,-0.514 -1.214,9.821 -0.264,11.064c0.949,1.243 4.295,2.413 5.961,-3.608c1.666,-6.021 5.922,-14.164 5.922,-14.164l7.638,-4.409"/>-->
            <!--                                <path d="M124.16,114.664l0.476,6.857l-5.193,-4.153l4.717,-2.704Z"/>-->
          </g>
          <g>
            <!--                                <path d="M125.058,131.46c-12.99,-1.793 -14.958,-4.153 -20.416,3.672c-0.941,1.349 7.719,-0.839 9.526,-0.599c1.602,0.212 4.3,3.853 -1.424,5.925c-5.151,1.864 -14.676,5.781 -14.676,5.781l-4.299,7.446l22.394,-9.583c0,0 9.69,-12.532 8.895,-12.642Z"/>-->
            <!--                                <path d="M106.757,157.664l-9.086,3.959l4.914,2.837l4.172,-6.796Z"/>-->
            <!--                                <path d="M100.548,168.419l-5.065,-3.007l1.794,8.673l3.271,-5.666Z"/>-->
            <!--                                <path d="M65.79,208.778l6.872,0.485l-7.15,3.335l0.278,-3.82Z"/>-->
            <!--                                <path d="M87.466,164.602l1.973,24.675c0,0 -6.054,15.428 -6.301,15.105c-5.009,-6.536 -10.789,-12.391 -6.789,-20.524c0.408,-0.83 3.859,9.112 5.302,9.714c1.444,0.601 4.927,-0.059 3.359,-6.106c-1.568,-6.047 -1.954,-15.227 -1.954,-15.227l4.41,-7.637"/>-->
            <!--                                <path d="M71.155,199.519l3.841,5.701l-6.574,-1.001l2.733,-4.7Z"/>-->
          </g>
          <g>
            <!--                                <path d="M80.331,213.616c-12.146,4.942 -15.031,3.883 -15.845,13.388c-0.14,1.639 6.266,-4.585 7.951,-5.282c1.493,-0.617 5.65,1.187 1.729,5.843c-3.529,4.191 -9.82,12.345 -9.82,12.345l0,8.599l14.603,-19.497c0,0 2.125,-15.698 1.382,-15.396Z"/>-->
            <!--                                <path d="M77.584,245.459l-5.89,7.973l5.674,0l0.216,-7.973Z"/>-->
            <!--                                <path d="M77.584,257.878l-5.89,-0.072l5.89,6.615l0,-6.543Z"/>-->
            <!--                                <path d="M67.662,310.21l6.194,-3.017l-4.525,6.464l-1.669,-3.447Z"/>-->
            <!--                                <path d="M64.346,261.114l14.046,20.383c0,0 2.472,16.387 2.097,16.232c-7.607,-3.157 -15.54,-5.337 -16.143,-14.38c-0.061,-0.923 7.898,5.962 9.449,5.761c1.551,-0.201 4.238,-2.514 -0.143,-6.967c-4.382,-4.453 -9.306,-12.21 -9.306,-12.21l0,-8.819"/>-->
            <!--                                <path d="M67.679,299.508l6.177,3.017l-6.194,2.421l0.017,-5.438Z"/>-->
          </g>
          <g>
            <!--                                <path d="M82.674,307.129c-8.047,10.353 -11.075,10.878 -7.028,19.517c0.698,1.489 3.133,-7.104 4.244,-8.55c0.985,-1.281 5.487,-1.797 4.42,4.196c-0.961,5.393 -2.332,15.601 -2.332,15.601l4.299,7.446l2.898,-24.186c0,0 -6.009,-14.657 -6.501,-14.024Z"/>-->
            <!--                                <path d="M96.217,336.08l-1.114,9.849l4.913,-2.837l-3.799,-7.012Z"/>-->
            <!--                                <path d="M102.426,346.835l-5.136,2.882l8.407,2.784l-3.271,-5.666Z"/>-->
            <!--                                <path d="M120,397.116l3.855,-5.709l-0.686,7.86l-3.169,-2.151Z"/>-->
            <!--                                <path d="M92.58,356.255l22.355,10.63c0,0 10.335,12.956 9.932,13.009c-8.166,1.07 -16.126,3.148 -21.17,-4.382c-0.514,-0.769 9.821,1.214 11.064,0.264c1.243,-0.949 2.413,-4.295 -3.608,-5.961c-6.021,-1.666 -14.164,-5.922 -14.164,-5.922l-4.409,-7.638"/>-->
            <!--                                <path d="M114.664,387.84l6.857,-0.476l-4.153,5.193l-2.704,-4.717Z"/>-->
          </g>
          <g>
            <!--                                <path d="M131.46,386.942c-1.793,12.99 -4.153,14.958 3.672,20.416c1.349,0.941 -0.839,-7.719 -0.599,-9.526c0.212,-1.602 3.853,-4.3 5.925,1.424c1.864,5.151 5.781,14.676 5.781,14.676l7.446,4.299l-9.583,-22.394c0,0 -12.532,-9.69 -12.642,-8.895Z"/>-->
            <!--                                <path d="M157.664,405.243l3.959,9.086l2.837,-4.914l-6.796,-4.172Z"/>-->
            <!--                                <path d="M168.419,411.452l-3.007,5.065l8.673,-1.794l-5.666,-3.271Z"/>-->
            <!--                                <path d="M208.778,446.21l0.485,-6.872l3.335,7.15l-3.82,-0.278Z"/>-->
            <!--                                <path d="M164.602,424.534l24.675,-1.973c0,0 15.428,6.054 15.105,6.301c-6.536,5.009 -12.391,10.789 -20.524,6.789c-0.83,-0.408 9.112,-3.859 9.714,-5.302c0.601,-1.444 -0.059,-4.927 -6.106,-3.359c-6.047,1.568 -15.227,1.954 -15.227,1.954l-7.637,-4.41"/>-->
            <!--                                <path d="M199.519,440.845l5.701,-3.841l-1.001,6.574l-4.7,-2.733Z"/>-->
          </g>
        </g>
      </svg>
    </div>
  </div>
  <div class="box bottom-box">
    <span style="margin-top:20px;float: right;margin-right: 20px;text-align: center;">南昌航空大学科技学院 信息电子学部 2021 课程设计 </br> 2021-09-22@strat IC卡管理@project</span>
  </div>
</div>
<%--<script href="${pageContext.request.contextPath}/theame/js/jquery-3.6.0.js"></script>--%>
<script src="http://localhost:8080/nchkkjxy/theame/js/jquery-3.6.0.js"></script>
<script src="http://localhost:8080/nchkkjxy/theame/js/myLayer.js"></script>
<%--清空输入框、忘记密码--%>
<script>
  //重置
  $(".agine").click(function () {
    $("#uid").val("");
    $("#upwd").val("");
    $("#ucode").val("");
    getCodeImg();
  });


  $("#wjmm").click(function () {
    showMessage_myLayer("请联系<h2 style='color: #04a78c;'>管理员<font style='font-size:16px;font-weight: 200;color: #000;border-bottom: 1px solid #04a78c;'>先生</font></h2>或致电<p style='color: #04a78c;'>15770674965</p>联系开发人员!" +
              "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
              "--温馨小提示<font style='color: crimson;font-size: 14px;'>&hearts;</font>");
  });
  // $(".msg-content .determine").click(function () {
  //   closeMessage();
  // });
  // $(".msg-content .cancen").click(function () {
  //   closeMessage();
  // });
  // function showMessage(msg) {
  //   let height = $(".msg-content").css("height");
  //   $("body> div").css("opacity","0.3");
  //   $("body> div").css("pointer-events","none");
  //   $(".msg-content").css("opacity","1");
  //   $(".msg-content").css("pointer-events","painted");
  //   $(".msg-content .msg-txt").html(msg);
  //   $(".msg-content").css("height",0);
  //   $(".msg-content").css("display","block");
  //   $(".msg-content").css("height",height);
  // }
  // function closeMessage() {
  //   let height = $(".msg-content").css("height");
  //   $(".msg-content").css("height",0);
  //   $("body> div").css("opacity","1");
  //   $("body> div").css("pointer-events","painted");
  //   $(".msg-content").css("display","none");
  //   $(".msg-content").css("height",height);
  // }

</script>
<%--验证码--%>
<script>
  var code_now = ["1","2","3","a","A"];//存放验证码
  var colors = ["slateblue",
    "teal",
    "tomato",
    "purple",
    "navy",
    "mediumvioletred",
    "darkviolet",
    "darkslateblue",
    "darkorange",
    "crimson",
    "darkviolet",
    "mediumpurple",
    "mediumseagreen",
    "slategray",
    "yellowgreen",
    "red"];
  var fonts = ["58px Times New Roman",
    "78px Georgia",
    "72px Verdana",
    "78px Arial",
    "78px 宋体",
    "86px 楷体",
    "78px LiSu",
    "78px YouYuan",
    "89px PmingLiu",
    "74px Impact",
    "78px Tahoma",
    "78px Courier New",
    "78px Times New Roman",
    "87px Georgia",
    "79px Verdana",
    "88px Arial",
    "72px 宋体",
    "86px 楷体",
    "76px LiSu",
    "72px YouYuan",
    "82px PmingLiu",
    "72px Impact",
    "76px Tahoma",
    "90px Courier New"];
  function drawCode(){
    var cs = document.getElementById("cav").getContext("2d");

    cs.fillStyle="silver";
    cs.clearRect(0, 0, 300, 150);

    for (i = 0; i < code_now.length; i++) {

      cs.font = fonts[Math.floor(Math.random() * fonts.length)];

      cs.fillStyle = colors[Math.floor(Math.random() * colors.length)];

      var lineType = Math.floor(Math.random() * 4);

      if (lineType == 1) {
        cs.textBaseline = "bottom";
      } else if (lineType == 2) {
        cs.textBaseline = "top";
      } else if (lineType == 3) {
        cs.textBaseline="middle"
      }

      var x =Math.floor(Math.random()*10 -5) / 100+1;
      var y = Math.floor(Math.random()*5 -5) / 100+1;
      cs.scale(x,y);

      cs.fillText(code_now[i], 50 + i * 30, 90 + (Math.floor(Math.random() * 2 - 2)));
      cs.scale(1/x,1/y);
    }
  }
  <%--//获取验证码--%>
  function getCodeImg() {
      $.ajax({
        type: "post",                //数据提交方式（post）
        url: "${pageContext.request.contextPath}/go/getCode", //提交的数据
        dataType: "json",           //返回的数据类型格式
        success: function (data) {
          if (  data.msg == "succeed") {
            code_now = data.val.split('');
            drawCode();
          }
          else{alert("验证码获取失败了：数据连接异常！")}
        }
      });
  }

  getCodeImg();
  // drawCode();
</script>
<%--login--%>
<script type="text/javascript">
  // 大写锁定提示
  (
          function($){
            $.fn.extend({
              capsLockTip:function(){
                return this.each(function(){
                  var ins=new $.CapsLockTip($(this));
                  $(this).data(this.id,ins)
                })
              }
            });
            $.CapsLockTip=function(___target){
              this.target=___target;
              var _this=this;
              $(document).ready(function(){
                _this.target.bind("keypress",function(_event){
                  var e=_event||window.event;
                  var kc=e.keyCode||e.which;
                  var isShift=e.shiftKey||(kc==16)||false;
                  $.fn.capsLockTip.capsLockActived=false;
                  if((kc>=65&&kc<=90&&!isShift)||(kc>=97&&kc<=122&&isShift))
                    $.fn.capsLockTip.capsLockActived=true;
                  _this.showTips($.fn.capsLockTip.capsLockActived)
                });
                _this.target.bind("keydown",function(_event){
                  var e=_event||window.event;
                  var kc=e.keyCode||e.which;
                  if(kc==20&&null!=$.fn.capsLockTip.capsLockActived){
                    $.fn.capsLockTip.capsLockActived=!$.fn.capsLockTip.capsLockActived;
                    _this.showTips($.fn.capsLockTip.capsLockActived)
                  }
                });
                _this.target.bind("focus",function(_event){
                  if(null!=$.fn.capsLockTip.capsLockActived)
                    _this.showTips($.fn.capsLockTip.capsLockActived)});
                _this.target.bind("blur",function(_event){
                  _this.showTips(false)
                })
              });
              this.createTooltip=function(){
                if(null!=$.fn.capsLockTip.divTip)
                  return $.fn.capsLockTip.divTip;
                $("body").append("<div id='divTip__985124855558842555' style='width:100px;display:none; position:absolute; z-index:9999999999999; text-align:center; background-color:#FDF6AA; color:Red; font-size:12px; border:solid 1px #DBC492; border-bottom-color:#B49366; border-right-color:#B49366;'>大写锁定已打开</div>");
                $.fn.capsLockTip.divTip=$("#divTip__985124855558842555");
                return $.fn.capsLockTip.divTip
              };
              this.showTips=function(display){
                var divTip=_this.createTooltip();
                if(display){
                  var offset=_this.target.offset();
                  divTip.css("left",offset.left+"px");
                  divTip.css("top",offset.top+_this.target[0].offsetHeight+3+"px");
                  divTip.show()
                }else{
                  divTip.hide()
                }
              };
              $.fn.capsLockTip.divTip=null;
              $.fn.capsLockTip.capsLockActived=null
            }
          })(jQuery);

  $(function () {
    $("#password").capsLockTip();

    $(window).resize(function () {
      var myDivHeight = $(window).height() - 60;
      $(".log-jumbotron").css("height", myDivHeight);
    }).resize();

    particlesJS('particles-js', {
      particles: {
        color: '#fff',
        shape: 'triangle', // "circle", "edge" or "triangle"
        opacity: 0.5,
        size: 5,
        size_random: true,
        nb: 150,
        line_linked: {
          enable_auto: true,
          distance: 150,
          color: '#fff',
          opacity: 0.5,
          width: 1,
          condensed_mode: {
            enable: false,
            rotateX: 600,
            rotateY: 600
          }
        },
        anim: {
          enable: true,
          speed: 2
        }
      },
      interactivity: {
        enable: true,
        mouse: {
          distance: 300
        },
        detect_on: 'canvas', // "canvas" or "window"
        mode: 'grab',
        line_linked: {
          opacity: 0.5
        },
        events: {
          onclick: {
            enable: true,
            mode: 'push', // "push" or "remove"
            nb: 4
          }
        }
      },
      /* Retina Display Support */
      retina_detect: true
    });
    if (location.href.indexOf("is_reg=1") > 0) {
      $("#reg_block").show();
    }
    //浏览器兼容
    if (!!window.ActiveXObject || "ActiveXObject" in window) {
      $('.browser-check').slideDown();
    }
  });
  var is_sso = 0;
  if(location.href.indexOf('gsxs.bysjy.com.cn/login') > -1){
    location.href  = '/login/index_gs';
  }

  var showKefu = function() {
    $('#kefu-box').show();
  }
  $(document).on('click', function() {
    $('#kefu-box').hide();
  })

</script>
<script>
  function read() {
    document.querySelector('.background').style.width = document.querySelector('.background').style.height;
  }
  read();
</script>
<%--//文本--%>
<script>
  var value_rows =[[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下',' '
  ],[
    '海','内','存','知','己','天','涯','若','比','邻',' '
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '打','工','这','辈','子','是','不','可','能','打','工','了','代','码','又','不','会','写',' '
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ],[
    '大','丈','夫','生','于','天','地','之','间','岂','能','郁','郁','久','居','人','下'
  ]];
  var key_cells=Array(18).join(0).split('');
</script>
<script>
  var cav = document.getElementById('number_rain');
  var w = window.screen.width;
  var h = window.screen.height;

  var yPositions = Array(18).join(0).split('');
  var ctx = cav.getContext('2d');
  let index_str=0;
  var draw = function(){

    ctx.fillStyle = 'rgba(29,44,96,0.05)';
    ctx.fillRect(0,0,w,h);

    yPositions.map(function(y,index){
      //随机生成字符
      // text = String.fromCharCode(1e2+Math.random()*330);

      //取用定义好的字符
      var text = value_rows[index][key_cells[index]>=value_rows[index].length?key_cells[index]=0:key_cells[index]];
      key_cells[index]++;

      x = (index+2)*15;

      let font_size = Number.parseInt(Math.random()*8+8);

      ctx.font = font_size+ "px " + (font_size>14?"楷体":"宋体");
      ctx.fillStyle = font_size > 14?'#f0ad4e':'#fff';

      cav.getContext('2d').fillText(text,x,y+Number.parseInt(Math.random()*10));
      // Math.random()*1e4
      if(y>Math.random()*300){
        yPositions[index]=0;
      }else{
        yPositions[index]=y+10;
      }

    });
  }

  // function sleep (time) {
  //   return new Promise((resolve) => setTimeout(resolve, time));
  // }
  // sleep(500).then((arr,x,y) => {
  //   // 这里写sleep之后需要去做的事情
  //
  // });
  setInterval('draw()',50);
</script>

</body>
</html>