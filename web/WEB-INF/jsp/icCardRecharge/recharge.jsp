<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/17
  Time: 15:00
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
    <title>充值</title>
    <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
    <script src="${global_url}theame/js/baseJs.js"></script>
    <link type="text/css" rel="stylesheet" href="${global_url}font/iconfont.css">
    <link type="text/css" rel="stylesheet" href="${global_url}theame/css/baseCss.css">
    <%--    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>--%>
    <script src="${global_url}theame/js/echarts.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${global_url}theame/css/page-minePage.css">
    <link rel="shortcut icon" href="${global_url}pic/page-charageRecharage.ico" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
    <style>
        .recharge-content{
            position: relative;
            width: 800px;
            height: 500px;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);

            background-color: #fff;
            box-shadow: 0 0 5px #999;
            border-radius: 5px;
        }
        .recharge-content .recharge-top{
            position: relative;
            width: 100%;
            height: 80%;
            border-radius: 5px 5px  0 0 ;

            /*background-color: #c7254e;*/
        }
        .recharge-content .recharge-top .card-balance-panel{
            position: absolute;
            height: calc(100% - 10px);
            width: 90%;
            top: calc(50% + 10px);
            left: 50%;
            transform: translate(-50%,calc(-50% - 5px));
            /*background-color: #c7254e;*/
            border-bottom: 2px solid #ccc;
            /*background-color: #a2aeb0;*/
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box{
            position: absolute;

            width: 300px;
            height: 350px;
            top: 50%;
            left:50%;
            transform: translate(-50%,-50%);
            /*background-color: #4e65c7;*/
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .img-box{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 280px;
            height: 280px;

            /*background-color: #4e65c7;*/
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .img-box img{
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box{
            position: absolute;
            height: 40px;
            /*width: 100px;*/
            top:100%;
            left: 50%;
            transform: translate(-50%,-100%);
            /*background-color: #c7254e;*/
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box ul{
            list-style: none;
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box ul li{
            margin: 0;
            /*width: 30px;*/
            /*height: 30px;*/
            /*background-color: #c7254e;*/
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box ul li:first-child{
            text-align: center;
            font-size: 20px;
            font-weight: 400;
            background-color: var(--sub_color);
            color: #fff;
            padding: 0 5px;
            border-radius: 5px;
            border: 2px #fff;
            transition: all var(--transform_slowily);
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box ul li:first-child:hover{
            box-shadow: 0 0 6px var(--sub_color);
        }
        .recharge-content .recharge-top .card-balance-panel .balance-box .font-box ul li:nth-child(2){
            padding: 3px 5px;
            border-bottom: 1px solid #ccc;
            text-align: left;
            font-size: 20px;
            font-weight: 800;
            color: var(--sub_color);
        }

        .recharge-content .recharge-top .detile{
            display: flex;
            float: right;
            margin-top: 10px;
            /*margin-right: 10px;*/
            width: 5%;
            height: 200px;
            /*background-color: #c7254e;*/
        }
        .recharge-content .recharge-top .detile ul{
            width: 100%;
            list-style: none;
        }
        .recharge-content .recharge-top .detile ul li{
            width: calc(100% - 2px);
            background-color: #fff;
            color: var(--sub_color);
            font-size: 18px;
            font-weight: 400;
            text-align: center;
            transition: all var(--transform_slowily);
            padding-top: 10px;
            padding-bottom: 10px;
            border-left: 2px solid #fff;
            cursor: pointer;
        }
        .recharge-content .recharge-top .detile ul li svg{
            width: 30px;
            height: 30px;
        }
        .recharge-content .recharge-top .detile ul li:first-child{
            border-top: 2px solid #59ADF8;
            border-left:2px solid #59ADF8;
            border-radius: 5px 0 0 0 ;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(2){
            border-left: 2px solid #8486F8;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(3){
            border-left: 2px solid #8486F8;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(4){
            border-left: 2px solid #C65EDB;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(5){
            border-left: 2px solid #FF9552;
        }
        .recharge-content .recharge-top .detile ul li:last-child{
            border-radius: 0 0 0 5px ;
            border-left:2px solid #FF9552;
            border-bottom: 2px solid #FF9552;
        }

        .recharge-content .recharge-top .detile ul li:nth-child(1):hover{
            background-color: #59ADF8;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(2):hover{
            background-color: #8486F8;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(3):hover{
            background-color: #8486F8;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(4):hover{
            background-color: #C65EDB;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(5):hover{
            background-color: #FF9552;
        }
        .recharge-content .recharge-top .detile ul li:nth-child(6):hover{
            background-color: #FF9552;
        }
        .recharge-content .recharge-bottom{
            position: absolute;
            top:100%;
            left:50%;
            transform: translate(-50%,-100%);
            /*width: 100%;*/
            /*height: 20%;*/
            border-radius: 0 0 5px 5px;
            /*background-color: #4e65c7;*/
        }
        .recharge-content .recharge-bottom .recharge-btn{
            width: 80px;
            height: 30px;
            background-color: var(--sub_color);
            color: #fff;
            font-size: 14px;
            font-weight: 400;
            margin: 20px 20px;
            cursor: pointer;
            transition: var(--transform_slowily);
        }
        /*.inline_block{*/
        /*    display: inline-block;*/
        /*}*/
    </style>

    <style type="text/css">
        .chiose_content{
            position: absolute;
            top: 50%;
            left:50%;
            transform:translate(-50%,-50%);
            background-color: #fff;
            border-radius: 5px 5px 0 0;
            border: 3px solid var(--sub_color);
            border-bottom: none;
            opacity: 0;
            z-index: 1;
            display: none;
            box-shadow: 0 0 10px var(--sub_color);
        }
        .chiose_content .main {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            width: 800px;
            height: 235px;
            background-color: #fff;
            margin: 5px;
        }

        .chiose_content .wrap {
            position: relative;
            margin: 10px;
        }

        .chiose_content .item {
            width: 150px;
            height: 80px;
            background-color: #aaa;
            position: relative;
            box-shadow: 0 0 0 3px #dbe0e3;
            transition: all 0.5s;
            color: #eee;
            cursor: pointer;
            border-radius: 3px;
        }
        .chiose_content .other_item{
            color: #c7ddef;
        }

        .chiose_content .item img {
            width: 50px;
            height: 50px;
            position: absolute;
            transform: translate(8px,16px);
            bottom: 0px;
            right: 0px;
            opacity: 0;
            pointer-events: none;
        }

        .chiose_content input[type="radio"],
        .chiose_content input[type="checkbox"] {
            display: none;
        }

        .chiose_content input:checked+label .item {
            box-shadow: 0 0 0 3px var(--sub_color);
            color: var(--sub_color);
            background-color: #fff;
        }

        .chiose_content input:checked+label .item img {
            opacity: 1;
        }

        .chiose_content .content {
            font-size: 30px;
            text-align: center;
            line-height: 80px;
        }

        .chiose_content .input_group{
            float: right;
            width: 100%;
            background-color: var(--sub_color);
        }
        .chiose_content .input_group .entry{
            float: right;
            width: 100px;
            height: 40px;
            font-size: 16px;
            transition: all var(--transform_slowily);
            margin: 10px;
            background-color: #4e65c7;
            border-radius: 5px;
            color:#fff;
            cursor: pointer;
        }
        .chiose_content .input_group .entry:hover{
            box-shadow: 0 0 15px #555;
        }

        .chiose_content .input_group .close{
            background-color: #c7254e;
        }
        .chiose_content .input_group .entry:hover{
            box-shadow: 0 0 15px #c7254e;
        }
        .chiose_content .input_money{
            height: 70px;
            font-size: 32px;
            padding-left: 0;
            border: none;
            width: 0;
            color:var(--sub_color);
        }



        .chiose_content .box{
            width: 100%;
        }
        .chiose_content .mark_write{
            position: relative;
        }
        .chiose_content .mark_write span,
        .chiose_content .money_chiose span{
            font-size: 14px;
            margin-top: 5px;
            /*position: absolute;*/
            /*width: 100%;*/
            display: block;
            padding: 3px 5px 3px 10px;
            border-radius: 5px;
            color: var(--sub_color);
            font-weight: 800;
        }
        .chiose_content .mark_write .mark{
            padding: 5px;
            margin: 10px;
            font-size: 14px;
            /*height: ;*/
            resize: none;
            color:var(--sub_color);
        }

    </style>
</head>
<body>
    <input type="hidden" id="card_id" value="">
    <div class="recharge-content">
        <div class="recharge-top">
            <div class="card-balance-panel">
                <div class="balance-box">
                    <div class="img-box">
                        <img src="${global_url}pic/main_page/money_icon.png" alt="">
                    </div>
                    <div class="font-box">
                        <ul>
                            <li class="inline_block">￥</li>
                            <li class="inline_block" id="card_balance">0.00</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="detile">
                <ul>
                    <!--返回首页-->
                    <li title="返回首页">
                        <svg t="1637592170007" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="33947" width="128" height="128">
                            <path d="M515.072 511.3856m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#59ADF8" p-id="33948"></path>
                            <path d="M517.5296 338.688c58.88 51.2512 117.1456 102.0416 175.4624 152.832 18.6368 16.2304 37.0688 32.7168 55.9616 48.64 10.3936 8.7552 15.1552 19.0464 15.104 32.8704-0.4096 63.6928 0 127.3856-0.256 191.0272-0.1024 30.5664-8.2944 38.4-38.2976 38.7072-45.7728 0.4096-91.5456 0.3584-137.3184 1.4336-12.9024 0.3072-17.2032-3.1232-16.9984-16.5376 0.768-46.2848 0.3072-92.6208 0.3072-138.9568v-18.4832H462.0288v41.1648c0 38.9632-0.3584 77.8752 0.2048 116.8384 0.1536 11.3152-2.7648 16.0768-14.848 15.9744-47.36-0.4608-94.72 0.1024-142.0288-0.3072-26.2144-0.256-34.816-9.3184-34.8672-35.7376-0.2048-66.816-0.3584-133.6832 0.3072-200.4992 0.0512-7.424 3.4816-17.152 8.8576-21.9136C356.864 477.3888 434.5856 409.6 512.2048 341.76c1.1264-1.024 2.6624-1.5872 5.3248-3.072z" fill="#FFFFFF" p-id="33949"></path>
                            <path d="M653.6704 313.2928c0-27.1872-0.0512-50.0736 0-73.0112 0.1024-26.8288 2.2528-29.0304 28.416-29.0816 17.8688-0.0512 35.7888 0 53.6576 0 26.3168 0.0512 28.16 1.8432 28.1088 28.9792-0.1536 48.9472 0.1024 97.8944-0.9216 146.7904-0.3584 17.3056 5.12 29.9008 18.5344 40.9088 23.1936 18.944 45.4144 39.1168 67.84 59.0336 16.128 14.3872 16.5376 18.6368 3.6864 35.4816-29.44 38.6048-27.2384 38.6048-62.3616 7.2192-86.3232-77.056-172.9536-153.8048-259.4816-230.656-4.2496-3.7888-8.6528-7.4752-14.0288-12.032-11.264 9.6768-22.0672 18.6368-32.5632 27.9552-85.0432 75.3664-170.0352 150.784-255.0272 226.0992-17.8176 15.8208-21.1456 15.4624-36.5056-3.0208-28.3136-33.9968-28.416-34.0992 4.4032-63.1296C289.1264 393.5744 380.8768 312.32 472.7296 231.168c33.0752-29.2352 55.1936-29.0816 88.4736 0.1536 23.7056 20.8384 47.104 42.0352 70.656 63.0272 6.0416 5.5808 12.3392 10.8032 21.8112 18.944z" fill="#FFFFFF" p-id="33950"></path>
                        </svg>
                    </li>
                    <!--提现规则-->
                    <li title="提现规则">
                        <svg t="1637592239001" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34095" width="128" height="128">
                            <path d="M512.512 513.1264m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#8486F8" p-id="34096"></path>
                            <path d="M841.0112 434.0736L536.576 174.2336c-15.6672-13.3632-39.4752-13.3632-55.1424 0L176.9472 434.0736c-28.16 24.0128-10.24 68.352 27.5968 68.352h68.3008v242.8416c0 37.376 31.8976 67.6864 71.2192 67.6864h329.8816c39.3216 0 71.2192-30.3104 71.2192-67.6864V502.4768h68.3008c37.8368 0 55.7056-44.3392 27.5456-68.4032z m-232.6016 178.176c18.5856 0 33.6384 14.2848 33.6384 31.9488s-15.0528 31.9488-33.6384 31.9488h-63.3344v31.5392c0 17.664-15.0528 31.9488-33.6384 31.9488-18.5856 0-33.6384-14.2848-33.6384-31.9488v-31.5392H414.5152c-18.5856 0-33.6384-14.2848-33.6384-31.9488s15.0528-31.9488 33.6384-31.9488h63.3344v-20.6336H414.5152c-18.5856 0-33.6384-14.2848-33.6384-31.9488s15.0528-31.9488 33.6384-31.9488h31.4368l-43.6224-52.0192c-11.5712-13.824-9.1648-33.8944 5.3248-44.9024 14.5408-11.008 35.6864-8.704 47.2576 5.0688l55.4496 66.1504 55.3472-68.5568c11.3152-13.9776 32.4096-16.64 47.1552-5.888 14.7456 10.752 17.5104 30.8224 6.1952 44.8l-44.6976 55.3472h33.9968c18.5856 0 33.6384 14.2848 33.6384 31.9488s-15.0528 31.9488-33.6384 31.9488h-63.3344v20.6336h63.3856z" fill="#FFFFFF" p-id="34097"></path>
                        </svg>
                    </li>
                    <!--业务统计-->
                    <li title="业务统计">
                        <svg t="1637592260594" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34242" width="128" height="128">
                            <path d="M519.3728 512.4096m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#8486F8" p-id="34243"></path>
                            <path d="M748.3392 771.6864h-425.472c-40.6528 0-73.728-33.0752-73.728-73.728V273.3568c0-13.4656 10.9056-24.3712 24.3712-24.3712s24.3712 10.9056 24.3712 24.3712v424.5504c0 13.7728 11.2128 24.9856 24.9856 24.9856h425.472c13.4656 0 24.3712 10.9056 24.3712 24.3712a24.3712 24.3712 0 0 1-24.3712 24.4224z" fill="#FFFFFF" p-id="34244"></path>
                            <path d="M433.7664 693.2992H356.7616a16.6912 16.6912 0 0 1-16.6912-16.6912V483.0208c0-9.216 7.4752-16.6912 16.6912-16.6912h77.056c9.216 0 16.6912 7.4752 16.6912 16.6912v193.5872a16.77312 16.77312 0 0 1-16.7424 16.6912zM588.1856 693.2992H511.1296a16.6912 16.6912 0 0 1-16.6912-16.6912V276.1216c0-9.216 7.4752-16.6912 16.6912-16.6912h77.056c9.216 0 16.6912 7.4752 16.6912 16.6912v400.4864a16.72704 16.72704 0 0 1-16.6912 16.6912zM742.5536 693.2992h-77.056a16.6912 16.6912 0 0 1-16.6912-16.6912V330.4448c0-9.216 7.4752-16.6912 16.6912-16.6912h77.056c9.216 0 16.6912 7.4752 16.6912 16.6912v346.1632c0 9.216-7.4752 16.6912-16.6912 16.6912z" fill="#FFFFFF" p-id="34245"></path>
                        </svg>
                    </li>
                    <!--攻略-->
                    <li title="攻略">
                        <svg t="1637592285593" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34390" width="128" height="128">
                            <path d="M514.6112 510.1568m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#C65EDB" p-id="34391"></path>
                            <path d="M673.9968 198.8096H380.928c-49.9712 0-90.6752 40.6528-90.6752 90.6752v10.0352c-20.1728 9.8816-34.1504 30.5152-34.1504 54.528v400.2304c0 33.536 27.1872 60.672 60.672 60.672h293.0688c29.7984 0 54.528-21.504 59.648-49.8688h4.4544c49.9712 0 90.6752-40.6528 90.6752-90.6752V289.4848c0.0512-49.9712-40.6528-90.6752-90.624-90.6752z m-84.5312 324.3008l-31.3856 30.6176 7.424 43.264c2.816 16.4864-3.84 32.8192-17.3568 42.6496a43.33568 43.33568 0 0 1-45.9264 3.328l-38.8096-20.4288-38.8096 20.4288a43.776 43.776 0 0 1-20.3264 5.0688 43.264 43.264 0 0 1-25.6-8.3968 43.4176 43.4176 0 0 1-17.3568-42.7008l7.424-43.2128-31.4368-30.6176a43.33568 43.33568 0 0 1-11.0592-44.6976 43.37664 43.37664 0 0 1 35.2256-29.696l43.4176-6.2976 19.4048-39.3216a43.35616 43.35616 0 0 1 39.1168-24.32c16.7424 0 31.6928 9.3184 39.1168 24.32l19.4048 39.3216 43.4176 6.2976c16.5376 2.4064 30.0544 13.7728 35.2256 29.696s0.8704 33.024-11.1104 44.6976z m115.2512 151.296c0 16.9472-13.7728 30.72-30.72 30.72h-3.4304V353.9968c0-33.536-27.1872-60.672-60.672-60.672H350.208v-3.84c0-16.9472 13.7728-30.72 30.72-30.72h293.0688c16.9472 0 30.72 13.7728 30.72 30.72v384.9216z" fill="#FFFFFF" p-id="34392"></path>
                            <path d="M471.9104 476.6208L463.36 459.264l-8.5504 17.3568a43.50464 43.50464 0 0 1-32.8704 23.8592l-19.1488 2.7648 13.8752 13.5168a43.66848 43.66848 0 0 1 12.544 38.6048l-3.2768 19.0976 17.152-9.0112c6.3488-3.328 13.312-5.0176 20.3264-5.0176s13.9264 1.6896 20.3264 5.0176l17.152 9.0112-3.2768-19.0976c-2.4064-14.1312 2.2528-28.5696 12.544-38.6048l13.8752-13.5168-19.1488-2.7648c-14.336-2.048-26.624-10.9568-32.9728-23.8592z" fill="#C65EDB" p-id="34393"></path>
                            <path d="M448.7168 429.568z" fill="#BD50D3" p-id="34394"></path>
                        </svg>
                    </li>
                    <!--我的资产-->
                    <li title="我的资产">
                        <svg t="1637592316387" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34539" width="128" height="128">
                            <path d="M512 510.1568m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#FF9552" p-id="34540"></path>
                            <path d="M677.1712 197.1712h-319.488c-18.9952 0-36.1472 11.264-43.7248 28.672L217.088 449.2288a47.40608 47.40608 0 0 0-3.9424 18.944v243.9168c0 26.3168 21.3504 47.6672 47.6672 47.6672h505.9072c26.3168 0 47.6672-21.3504 47.6672-47.6672V469.1456c0-6.0416-1.1776-12.032-3.3792-17.664l-89.5488-224.256a47.73888 47.73888 0 0 0-44.288-30.0544z m51.1488 467.1488a28.8768 28.8768 0 0 1-28.8768 28.8768H323.072a28.8768 28.8768 0 1 1 0-57.7536h376.3712c15.9232 0 28.8768 12.9536 28.8768 28.8768z m-117.0432-186.5216l-27.2384 49.8688c-2.816 5.12-8.192 8.2944-14.0288 8.2944H466.2272c-5.4784 0-10.5984-2.816-13.5168-7.4752L420.3008 476.672a22.44096 22.44096 0 0 0-19.0976-10.5984H319.488c-12.2368 0-20.736-12.2368-16.4864-23.7056l64-171.776a47.6672 47.6672 0 0 1 44.6464-31.0272h211.8144c19.6608 0 37.3248 12.0832 44.4416 30.464l66.6624 172.1344c4.4544 11.52-4.0448 23.9104-16.384 23.9104h-87.1424c-8.2432 0-15.8208 4.5056-19.7632 11.7248z" fill="#FFFFFF" p-id="34541"></path>
                            <path d="M597.0944 397.7216h-52.6848v-16.2304h52.6848c14.1312 0 25.6-11.4688 25.6-25.6s-11.4688-25.6-25.6-25.6h-27.1872l19.8656-28.4672a25.56928 25.56928 0 0 0-6.3488-35.6352 25.56928 25.56928 0 0 0-35.6352 6.3488l-29.4912 42.24-31.2832-42.752a25.60512 25.60512 0 1 0-41.3184 30.2592l20.48 27.9552h-25.6512c-14.1312 0-25.6 11.4688-25.6 25.6s11.4688 25.6 25.6 25.6h52.6848v16.2304H440.576c-14.1312 0-25.6 11.4688-25.6 25.6s11.4688 25.6 25.6 25.6h52.6848v23.552c0 14.1312 11.4688 25.6 25.6 25.6s25.6-11.4688 25.6-25.6v-23.552h52.6848c14.1312 0 25.6-11.4688 25.6-25.6s-11.4688-25.5488-25.6512-25.5488z" fill="#FFFFFF" p-id="34542"></path>
                        </svg>
                    </li>
                    <!--帮助-->
                    <li title="帮助">
                        <svg t="1637592340632" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="34687" width="128" height="128">
                            <path d="M512 515.84m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z" fill="#FF9552" p-id="34688"></path>
                            <path d="M721.408 756.736c-4.352-7.168-3.1232-16.3328 2.8672-22.1696 59.4432-57.6512 96.4608-138.3424 96.4608-227.6864 0-180.224-150.272-325.3248-332.3392-316.8256-161.8944 7.5264-293.4784 138.5472-301.6704 300.3904-9.1136 180.7872 133.2224 330.496 311.3472 333.5168l-0.0512 0.1536h232.5504c13.9776 0 22.5792-15.2576 15.3088-27.1872l-24.4736-40.192z m-212.8384-27.4432c-20.4288 0-36.9664-16.5376-36.9664-36.9664 0-20.4288 16.5376-36.9664 36.9664-36.9664 20.4288 0 36.9664 16.5376 36.9664 36.9664 0 20.4288-16.5376 36.9664-36.9664 36.9664z m38.2464-179.1488c-1.9968 0.6144-4.0448 2.1504-4.0448 4.3008v43.9296c0 18.8416-15.3088 34.1504-34.1504 34.1504-18.8416 0-34.1504-15.3088-34.1504-34.1504v-43.9296c0-32.4096 21.3504-60.4672 53.0432-69.8368 29.7472-8.7552 49.3568-36.608 47.7184-67.6864-1.7408-33.5872-29.44-61.2352-63.0272-63.0272-18.5856-0.9728-36.1472 5.4784-49.5616 18.2272s-20.8384 29.952-20.8384 48.4352c0 18.8416-15.3088 34.1504-34.1504 34.1504-18.8416 0-34.1504-15.3088-34.1504-34.1504 0-36.864 15.36-72.6016 42.0864-97.9968 27.136-25.7536 62.6688-38.8608 100.1472-36.864 67.9936 3.584 124.0576 59.648 127.6416 127.6416 3.3792 62.8224-36.4032 119.0912-96.5632 136.8064z" fill="#FFFFFF" p-id="34689"></path>
                        </svg>
                    </li>
                </ul>
            </div>
        </div>
        <div class="recharge-bottom">
            <input type="button" value="我要充值" class="recharge-btn charge">
<%--            <input type="button" value="提现" class="recharge-btn recharge">--%>
        </div>
    </div>

    <div class="chiose_content">
        <div class="box money_chiose">
            <span><font class="iconfont icon-chongzhi2" style="color: #ff5342;"></font>选择金额</span>
            <div class="main">
                <div class="wrap">
                    <input type="radio" name="1" id="item6" />
                    <label for="item6">
                        <div class="item">
                            <div class="content number_money">10.00</div>
                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                        </div>
                    </label>
                </div>
                <div class="wrap">

                    <input type="radio" name="1" id="item7" />
                    <label for="item7">
                        <div class="item">
                            <div class="content number_money">20.00</div>
                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                        </div>
                    </label>
                </div>
                <div class="wrap">

                    <input type="radio" name="1" id="item8" />
                    <label for="item8">
                        <div class="item">
                            <div class="content number_money">50.00</div>
                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                        </div>
                    </label>
                </div>
                <div class="wrap">
                    <input type="radio" name="1" id="item9" />
                    <label for="item9">
                        <div class="item">
                            <div class="content number_money">100.00</div>
                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                        </div>
                    </label>
                </div>
                <div class="wrap">
                    <input type="radio" name="1" id="item10" />
                    <label for="item10">
                        <div class="item other_item">
                            <div class="content">其他</div>
                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                        </div>
                    </label>
                </div>
                <input class="input_money" type="text" placeholder="请输入充值金额">
            </div>
        </div>
        <div class="box mark_write">
            <span><font class="iconfont icon-xiugai" style="color:var(--sub_color);"></font>填写备注</span>
            <textarea name="mark" class="mark" cols="80" rows="5"></textarea>
        </div>
        <div class="input_group">
            <input type="button" class="entry close" value="取消">
            <input type="button" class="entry accept-money" value="确定">
        </div>
    </div>
   <script>
       getCardId();
       function getCardId() {
           $.ajax({
               url:'${global_url}charge/get',
               method:"post",
               dataType:"json",
               data:{},
               success:function (data) {
                   if(data.succeed == true){
                       $("#card_id").val(data.data);
                       getMsg(data.data);
                   }else{
                       $("#card_id").val("0");
                   }
               },
               error:function () {
                   error_result.NO_RESULT();
                   $("#card_id").val("0");
               }
           });
       }

       function getMsg(cardId) {
           $.ajax({
               url:'${global_url}charge/msg',
               method:"post",
               dataType:"json",
               data:{
                   cardId:cardId,
               },
               success:function (data) {
                   if(data.succeed == true){
                       $("#card_balance").html(data.data.cBalance);
                       console.log(data.data)
                   }else{
                       $("#card_balance").html("****.**");
                   }
               },error:function () {
                   // error_result.NO_RESULT();
               }
           });
       }
       function recharge(money,mark,cid) {
           $.ajax({
               url:'${global_url}charge/recharge',
               method:"post",
               dataType:"json",
               data:{
                   cardId:cid,
                   money:money,
                   mark:mark
               },
               success:function (data) {
                   my_tip.tip(data.data);
                   getMsg($("#card_id").val());
                   $(".chiose_content .close").click();
               },error:function () {
                  error_result.TIP();
               }
           });
       }

       $(".recharge-bottom .charge").click(function () {
           $(".chiose_content").css("display","block");
           $(".chiose_content").animate({opacity:'1','z-index':"10"},800);
       });
   </script>

    <script>
        $(".chiose_content .close").click(function () {
            $(".chiose_content").animate({opacity:'0','z-index':"0"},{
                duration: 800,
                complete:function () {
                    $(".chiose_content").css("display","none");
                    $(".chiose_content .mark").val("");
                }
            });
        });
        $(".chiose_content .accept-money").click(function () {
            let money = $.trim($(".chiose_content .input_money").val());
            let mark = $.trim($(".chiose_content .mark").val());
            let cid = $("#card_id").val();

            if(isNaN(money)){
                error_result.TIP("输入金额有误！充值失败！");
                $(".chiose_content .input_money").val("");
                return;
            }
            if(money == ""){
                error_result.TIP("请选择金额");
                return;
            }

            if (typeof (cid)=="undefined" || isNaN(cid) || parseInt(cid)<=0){
                error_result.TIP("IC卡信息已失效，请刷新页面或重新登录");
                return 0;
            }
            if(typeof (mark) =="undefined" || mark==""){
                alter_layer.show("没有填写备注","确认不想填写备注就提交吗！",function () {
                    recharge(money,"",cid);
                });
                return ;
            }
            recharge(money,mark,cid);
        });

        var is_other_money = false;
        $(".chiose_content .other_item").click(function () {
            if(is_other_money){
                return;
            }
            $(".chiose_content .input_money").val("");
            $(".chiose_content .input_money").css("border","2px solid var(--sub_color)");
            $(".chiose_content .input_money").animate({width:'300px','padding-left':'5px'},800);
            is_other_money = true;
        });
        $(".chiose_content .number_money").click(function () {
            $(".chiose_content .input_money").val("");
            $(".chiose_content .input_money").css("border","none");
            var tex = $(this).html();
            $(".chiose_content .input_money").animate({width:'0','padding-left':'0'},{
                duration:800,
                complete:function () {
                    $(".chiose_content .input_money").val(tex);
                }
            });
            is_other_money = false;
        });

        $(".chiose_content .item img").click(function () {
            $(this).parent(".item").find(".content").click();
        })
    </script>
</body>
</html>
