<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/24
  Time: 10:31
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${global_url}pic/page-home.ico" type="image/x-icon">
    <link rel="stylesheet" href="${global_url}font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/baseCss.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/mySelect.css">
    <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
    <script src="${global_url}theame/js/baseJs.js"></script>
    <title>主页</title>
    <style>
        body{
             overflow-x:hidden;
             overflow-y: visible;
            /* 登录按钮长宽 */
            --login_WH:100px;/*20%;*/

            /* //栏目宽度 */
            --panel_width:80%;
        }
    </style>
    <style>
        .top-contain{
            position: fixed;
            width: 100%;
            height: 15%;
            background-color: rgba(4, 167, 140,0);
            box-shadow: 0 3px 6px #666;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            z-index: 5;
        }
        .top-contain-item{
            width: 100%;
            height: 15%;
            background-color: rgba(4, 167, 140,0.8);
        }
        .top-contain .top{
            width: 88%;
            height: 30%;
            position: relative;
            margin-left: 1%;
            /* background-color: #2a3fff; */
        }
        .top-contain .top .left{
            display: inline-block;
            background-color: rgba(4, 167, 140,0.2);
            padding-right: 10px;
            padding-left: 10px;
            /* width: 100%; */

        }
        .top-contain .top .left ul{
            list-style:none;
            /* float: left; */
        }
        .top-contain .top .left ul li{
            text-align: center;
            width: 150px;
            /* height: 30px; */
            margin-top: 5px;
            margin-bottom: 10px;
            /* background-color: rgba(4, 167, 140,0.1); */
            display: inline-block;
            cursor: pointer;
        }
        .top-contain .top .right{
            display: inline-block;
            float: right;
        }
        .top-contain .top .right .head-img{
            position: absolute;
            width: 50px;
            height: 50px;
            background-color: var(--sub_color);
            margin-top: 5px;
            margin-right: 5px;
            border-radius: 50%;
            cursor: pointer;
            background-image: url('${global_url}pic/login/no_login.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100% 100%;
            border: 2px solid #fff;
        }
        .top-contain .top .right .head-img:hover{
            /*transform: translateY(5px) translateZ(5px) scale(1.1);*/
            /*transition: all var(--transform_slowily);*/
        }

        .top-contain .bottom{
            /*position: relative;*/
            /*!* background-color: #2a3fff; *!*/
            /*width: 80%;*/
            /*height: 30px;*/
            /*top: 100%;*/
            /*left: 50%;*/
            /*margin-top: 20px;*/
            /*transform: translate(-50%,-20%);*/

            position: relative;
            /*background-color: #2a3fff;*/
            width: 80%;
            height: 30px;
            /* top: 50%; */
            left: 50%;
            margin-top: 40px;
            transform: translate(-50%);
        }
        #searching{
            /* position: absolute; */
            float:right;
            height: 30px;
            width: 40px;
            /* font-size: 12px; */
            border-left: 0;
            /* padding: 2px; */
            box-sizing: border-box;
            border-radius:  0 2px 2px 0 ;
            margin-right: 100px;
            /* background-color: #ddd; */
            /* background: url('./img/搜索.png') center no-repeat;
            background-size: 50% 50%; */
            cursor: pointer;
            transition: all 0.3s;
            color:var(--sub_color);
            font-weight: bold;
            font-size: 10px;
        }
        #searching:hover,
        #seach-lab:hover {
            background-color: var(--sub_color);
            color: #fff;
            cursor: pointer;
        }

        #search-btn{
            /* position: absolute; */
            float:right;
            width: 200px;
            height: 30px;
            border-right: 0;
            /* padding: 2px; */
            box-sizing: border-box;
            border-radius: 0;
            border-left: 0px solid var(--sub_color);
            font-size: 14px;
            padding-left: 5px;

            transition: width 0.8s;
        }
        #search-btn:focus{
            width: 400px;
        }
        #seach-lab{
            height: 28px;
            width: 29px;
            border-radius:  2px 0 0 2px ;
            text-align: center;
            border: 1px solid var(--sub_color);
            border-right: 0px solid var(--sub_color);
            font-size: 25px;
            float: right;
            transition: all 0.3s;
            color: #fff;
            background-color: var(--sub_color);
            transform: translateY(0px);
        }
        /* #seach-lab:hover{
            color: var(--sub_color);
        } */
        #searching:focus,#search-btn:focus{
            outline: 0px solid var(--sub_color);
            /* border-top:1px solid var(--sub_color);
            border-bottom:1px solid var(--sub_color); */
            /*box-shadow: 0 0 8px var(--sub_color);*/
        }
        #searching:hover,#search-btn:hover{
            box-shadow: 0 0 0 var(--sub_color);
        }
    </style>
    <style>
        .bottom-contain{
            position: relative;
            width: 100%;
            margin-top: 5px;
        }
        .bottom-contain .box{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: var(--panel_width);
            /* background-color: wheat; */
            /* height: 1000px; */
        }
        /* .center-elem{
            left: 50%;
            transform: translateX(-50%);
        } */
        .bottom-contain .box .top{
            position: relative;

            width: 100%;
            height: 100px;
        }
        .inline{
            display: inline-block;
        }
        .bottom-contain .box .top .mid-line{
            position: absolute;
            height: 60%;
            width: 1px;
            background-color: #aaa;

            top:50%;
            transform: translateY(-50%);
        }
        .bottom-contain .box .top .left,
        .bottom-contain .box .top .right{
            width: calc(25% - 1px);
            height: 100%;
        }
        .bottom-contain .box .top .mid{
            width: 50%;
            height: 100%;
        }
    </style>
    <style>
        .bottom-contain .box .ramdon-msg{
            width: 100%;
            height: 200px;

            position: relative;
            /* left: 50%;
            transform: translateX(-50%); */

            /* background-color: #666; */
            margin-bottom: 10px;
        }
        .bottom-contain .box .ramdon-msg .run-bo{
            position: relative;
            width: 40%;
            height: 100%;
            background: url('${global_url}pic/main_page/tuijian.jpg') center no-repeat;
            background-size: 100% 100%;
            /* background-color: #666; */
        }
        .bottom-contain .box .ramdon-msg .tui-jian{
            width: 60%;
            height: 100%;
            /* background-color: #666; */
            /* background-color: #111; */
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-sub{
            position: absolute;
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-logo{
            width: 40px;
            /* height: 20px; */
            border-radius: 20px;
            border:2px solid #fff;
            background-color: var(--sub_color);
            top: 5px;
            left: 5px;
            padding-top: 1px;
            padding-bottom: 1px;
            text-align: center;
            font-weight: 400;
            color: #fff;
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-points{
            /* width: 100px; */
            bottom: 5px;
            right: 5px;
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-points ul{
            list-style: none;
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-points ul li{
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 10px;
            border:1px solid #fff;
            background-color: var(--sub_color);
            cursor: pointer;
            transition: all var(--transform_slowily);
        }
        .bottom-contain .box .ramdon-msg .run-bo .xinwen-points ul li:hover{
            box-shadow: 0 0 8px var(--sub_color);
            transform: scale(1.4);
        }
        .bottom-contain .box .ramdon-msg .tui-jian ul{
            list-style: none;
            width: 100%;
            height: 100%;
        }
        .bottom-contain .box .ramdon-msg .tui-jian ul li{
            margin-left: 3%;
            display: inline-block;
            width: 30%;
            height: 46%;
            /* background-color: yellowgreen; */
            background: url('${global_url}pic/main_page/card.png') center no-repeat;
            background-size: 100% 100%;
        }
        .bottom-contain .box .ramdon-msg .tui-jian ul .bottom-li{
            margin-top: 2%;
        }
        .bottom-contain .box .ramdon-msg .tui-jian ul .left-li{
            margin-left: 4%;
        }

        .bottom-contain .box .goods-title{
            position:relative;
            height: 50px;
            width: 100%;
            /*background-color: aquamarine;*/
            margin-bottom: 2px;
            border-bottom: 2px solid #aaa;
        }
        .bottom-contain .box .goods-title ul{
            list-style: none;
        }
        .bottom-contain .box .goods-title ul li {
            display: inline-block;
            width: 50px;
            height: 50px;
            /*background-color: blueviolet;*/
            margin-right: 5px;
        }
        .bottom-contain .box .goods-title ul li svg{
            width: 40px;
            height: 40px;
            margin: 5px;
        }
        .bottom-contain .box .goods-title ul .font{
            position: absolute;
            width: 200px;
            line-height: 50px;
            top: 0;
            /*background-color: #4e65c7;*/
        }
        .bottom-contain .box .goods-title ul li span{
            font-size: 16px;
            font-weight: 800;
            text-align: center;
            padding: 3px 5px;
            border-radius: 5px;
            border: 2px solid #fff;
            color: #fff;

            background-color: var(--sub_color);
        }
        .bottom-contain .box .goods-title ul li a{
            width: 100%;
            height: 100%;
            background-color: brown;
        }
        .bottom-contain .box .goods-title a{
            position: absolute;
            /* float: right; */
            right: 1px;
            bottom: 1px;
            text-decoration: none;
            color:#aaa;
            font-size: 14px;
            transition: all var(--transform_slowily);
        }
        .bottom-contain .box .goods-title a:hover{
            color: var(--sub_color);
        }
    </style>

    <style>
        .bottom-contain .box .ending{
            position: absolute;
            width: 125%;
            height: 200px;
            left: 50%;
            transform: translateX(-50%);
            margin-bottom: 0;
            margin-top: 5px;
        }
        .bottom-contain .box .ending .more-goods{
            position: absolute;
            top:0;
            left:50%;
            width: 40px;
            height: 40px;
            font-size: 16px;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            box-shadow: inset 0 0 6px #666,0 6px 6px #666;
            color:var(--sub_color);
            transform: translateX(-50%);
            margin-bottom: 10px;
            cursor: pointer;
        }
        .bottom-contain .box .ending .ending-msg{
            position: absolute;
            top:55px;
            width:100%;
            background-color: #777;
            height: calc(100% - 42px);
        }
        .ramdon-goods .ending .more-goods:hover{
            animation: moreGoods 0.4s cubic-bezier(0,1.17,1,.67);
            animation-fill-mode: forwards;
        }
        @keyframes moreGoods {
            from{
                box-shadow: inset 0 0 6px #666,0 6px 6px #666;
            }
            25%{
                box-shadow: inset 0 0 6px #666,-6px 0 6px #666;
            }
            50%{
                box-shadow: inset 0 0 6px #666,0 -6px 6px #666;
            }
            75%{
                box-shadow: inset 0 0 6px #666,6px 0 6px #666;
            }
            to{
                box-shadow: inset 0 0 6px #666,0 6px 6px #666;
            }
        }
    </style>

    <style>
        /*.good-list-panel{*/
        /*    position: absolute;*/
        /*    width: 100%;*/
        /*    top:5%;*/
        /*    left: 50%;*/
        /*    transform: translate(-50%,0);*/
        /*    background: #4e65c7;*/
        /*}*/
        .ramdon-goods{
            width: 100%;
            height: 200px;

            position: relative;
            /* left: 50%;
            transform: translateX(-50%); */

            /* background-color: #666; */
            margin-bottom: 10px;
        }
        .good-table{
            /*position: absolute;*/
            width: 100%;
        }
        .good-table tr{
            /*position: absolute;*/
            width: 100%;
            height: 150px;
        }
        .good-table tr td{
            /*position: initial;*/
            /*width: 250px;*/
            /*height: 150px;*/
            width: 100%;
            height: 100%;
            /*background-color: var(--sub_color);*/
            /*padding: 20px;*/
        }
        /*.good-table tr td a{*/
        /*    !*position: absolute;*!*/
        /*    display: inline-block;*/
        /*    height: 130px;*/
        /*    !*top: 50%;*!*/
        /*    !*left: 50%;*!*/
        /*    !*transform: translate(-50%,-50%);*!*/
        /*    width: calc(20% - 20px);*/
        /*    !*height: calc(20% - 20px);*!*/
        /*    max-width: 250px;*/
        /*    max-height: 150px;*/
        /*    background-color: var(--sub_color);*/

        /*    background-position: center;*/
        /*    background-repeat: no-repeat;*/
        /*    background-size: 100% 100%;*/
        /*    background-image: url("http://localhost:8080/nchkkjxy/pic/main_page/card.png");*/
        /*    transition: all var(--transform_slowily);*/
        /*    filter: blur(1px);*/
        /*    margin-left: 10px;*/
        /*}*/
        /*.good-table tr td a:hover{*/
        /*    background-size: 120% 120%;*/
        /*    filter: blur(0);*/
        /*    box-shadow: 0 6px 6px var(--sub_color);*/
        /*    transform: scale(1.01) translateY(-5px) translateZ(-5px);*/
        /*}*/
    </style>

    <style>
        .goods-item{
            /*position: absolute;*/
            display: inline-block;
            height: 130px;
            /*top: 50%;*/
            /*left: 50%;*/
            /*transform: translate(-50%,-50%);*/
            width: calc(20% - 20px);
            /*height: calc(20% - 20px);*/
            max-width: 250px;
            max-height: 150px;
            background-color: var(--sub_color);

            background-position: center;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-image: url("http://localhost:8080/nchkkjxy/pic/main_page/card.png");
            transition: all 0.8s;
            backdrop-filter: blur(1px);
            margin-left: 10px;
            box-shadow: 0 0 10px #666;
        }
        .goods-item:hover{
            background-size: 120% 120%;
            backdrop-filter: blur(0);
            box-shadow: 0 3px 6px var(--sub_color);
            transform: scale(1.01) translateY(-5px) translateZ(-5px);

        }
        .goods-item:hover .goods-msg{
            opacity: .9;
            top:50%;
            height: 50%;
        }
        .goods-item .goods-msg{
            position: absolute;
            width: 100%;
            height: 20%;
            top: 80%;
            left:0;
            opacity: .5;
            background-color: #fff;
            transition: all 0.8s;
            filter: blur(0);
            border-top: 1px solid #666;
            box-shadow: 0 -5px 5px #666;
        }
        .goods-item:hover .goods-line1{
            position: absolute;
            /*width: 100%;*/
            opacity: 1;
            top:40%;
            transition: all 0.8s;
        }
        .goods-item:hover .goods-line2{
            position: absolute;
            /*width: 100%;*/
            opacity: 1;
            top:65%;
            transition: all 0.8s;
        }
        .goods-item:hover .goods-line3{
            position: absolute;
            /*width: 100%;*/
            opacity: 1;
            top:85%;
            transition: all 0.8s;
        }
        .goods-item .good-line{
            position: absolute;
            /*width: 100%;*/
            opacity: 0;
            top:100%;
            left:0;
            transition: all 0.8s;
        }
        .goods-item .goods-line1{
            top:80%;
            opacity: 1;
        }
        .goods-item .goods-line1 .goodName{
            font-size: 14px;
            padding:3px 5px;
            margin: 2px 0 2px 2px;
            color: #fff;
            font-weight: 800;
            background-color: var(--sub_color);
            border-radius: 5px;
            opacity: 1 !important;
        }
        .goods-item .goods-line2 .goodPrice{
            padding:3px 5px;
            margin: 2px ;
            border-radius: 5px;
            font-size: 14px;
            color: #fff;
            background-color: #c7254e;
        }
        .goods-item .goods-line2 .goodPersonal{
            font-size: 12px;
            color: #999;
        }

        .goods-item .goods-line3 .goods-line4 .goods-title{
            padding: 2px 3px;
            background-color: var(--sub_color);
            font-size: 13px;
            font-weight: 600;
            color: #fff;
            margin: 5px 0 5px 5px;
            border-radius: 5px;
        }

        .goods-item .goods-line3{
            width: 100%;
        }
        .goods-item .goods-line3 .goods-line4{
            display: inline-block;
        }
        .goods-item .goods-line3 .right{
            float: right;
            color: #666;
            font-size: 16px;
            margin-right: 5px;
            margin-bottom: 5px;
        }
        .goods-item .goods-line3 .left{
            float: left;
        }
    </style>
</head>
<body>
<div class="top-contain">
    <div class="top">
        <div class="left">
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <div class="right">
            <div class="head-img"></div>
        </div>
    </div>
    <div class="bottom">
        <div class="logo"></div>
        <input type="button"  value="查 找" id="searching" ><!--
            --><input type="text" id="search-btn" value=""><!--
            --><label for="searching" class="iconfont icon-sousuo" id="seach-lab"></label><!--
        --></div>
</div>
<div class="top-contain-item"></div>
<%--//导航栏--%>
<script>

    // console.log(lis);
    // for(i=0;i<lis.length;i++){
    //     mySelect.list = [{url:"#",title:"选项1"},{url:"#",title:"选项2"},{url:"#",title:"选项3"},{url:"#",title:"选项4"}];
    //     mySelect.dataGruid($(lis[i]),'菜单'+i,mySelect.list);
    // }
    // var titles=[
    //     {title:'主   页',icon:'icon-shouye'},
    //     {title:'个人消费',icon:'icon-gouwuche'},
    //     {title:'业务办理',icon:'icon-bumengaikuang'},
    //     {title:'我   的',icon:'icon-chanxueyanhezuo'},
    //     {title:'系   统',icon:'icon-shezhi'}];
    // var lists=[
    //     [],
    //     [
    //         {url:"#",title:"余额",    icon:"icon-wodezijin"},
    //         {url:"#",title:"消费记录",icon:"icon-shouxinxiangqing-xiaofeijilu"},
    //         {url:"#",title:"充值提现", icon:"icon-chongzhi"}
    //     ]
    //     ,
    //     [
    //         {url:"http://localhost:8080/nchkkjxy/createCard/toCreateCard",title:"IC卡申领",icon:"icon-kexuejishu"},
    //         {url:"#",title:"IC卡挂失",icon:"icon-301guashishenqing-lv"},
    //         {url:"#",title:"IC卡注销",icon:"icon-chonghong-21"},
    //         {url:"#",title:"业务记录",icon:"icon-shouxinxiangqing-xiaofeijilu"}],
    //     [
    //         {url:"http://localhost:8080/nchkkjxy/balance/go",title:"个人信息",icon:"icon-xueshengziliao"},
    //         {url:"#",title:"登录选项",font:"icon-huidaodingbu"},
    //         {url:"http://localhost:8080/nchkkjxy/go/toLogin",title:"退出系统",   icon:"icon-tuichudenglu"}
    //         ],
    //     [
    //         {url:"#",title:"关于我们",icon:"icon-dollar-symbol"},
    //         {url:"#",title:"使用手册",icon:"icon-shiyongshouce_icon"},
    //         {url:"#",title:"开发者", icon:"icon-kaifazhe"},
    //         {url:"#",title:"法律",icon:"icon-falvshengmingfalv"}
    //     ]
    // ];
    // mySelect.dataGruidAll(lis,data.data.titles,data.data.lists);
    

    $.ajax({
        url:"${global_url}getNav",
        method:"post",
        dataType:"json",
        data:{router_type:"主页"},
        beforeSend:function () {
            // loading_cir.loading('body');
        },
        success:function (data) {
            if(data.succeed  == true){

                $(".top-contain .top .left ul li").remove();
                let sub_ids = new Array();
                for (let ul_index = 0;ul_index<data.data.titles.length;ul_index++){
                    $(".top-contain .top .left ul").append("<li></li>");
                    sub_ids.push("ul_sub_"+ul_index);
                }
                var lis = $(".top-contain .top .left ul").children();
                mySelect.dataGruidAll(lis,sub_ids,data.data.titles,data.data.lists,false);
            }else{
                my_tip.tip("导航栏加载失败...（数据异常）");
            }
            // loading_cir.loaded('body');
        },
        error:function () {
            // loading_cir.loaded('body');
            my_tip.tip("导航栏加载失败...（网络繁忙）",1,"body",[{cssName:"opacity",cssValue:"1"}]);
        }
    });
    $.ajax({
        url:"${global_url}getLoginUser",
        method:"post",
        dataType:"json",
        data:{},
        success:function (data) {
            $(".top-contain .top .right .head-img").css("background-image","url('"+data.data.head_url+"')");

            elemTitle.gridTitle(".top-contain .top .right .head-img",typeof (data.data.name)!="undefined"?data.data.name:"未登录");
            // user_name = data.data.name;
            // console.log(user_name+"=="+data.data.name)
            // background: url('http://localhost:8080/nchkkjxy/pic/login/no_login.png') center no-repeat;
        },error:function () {
            $(".top-contain .top .right .head-img").prop("title","没有登录信息");
            my_tip.tip("获取登录信息失败，网络瘫痪...",1,"body",[{cssName:"opacity",cssValue:"1"}]);
        }
    });

    $(".top-contain .top .right .head-img").click(function () {
       location.href = "${global_url}navTo?url=home/mine/info";
    });

    // var user_name = "";
    // $(".top-contain .top .right .head-img").hover(function () {
    //     console.log(user_name)
    //     if(typeof (user_name) !='undefined' && user_name != ""){
    //         elemTitle.title($(this),"你好,"+user_name+"!");
    //     }else{
    //         elemTitle.title($(this),"暂未登录!");
    //     }
    // });
    //
    // $(".top-contain .top .right .head-img").mouseleave(function () {
    //     elemTitle.remove($(this));
    // })
</script>
<div class="bottom-contain">
    <div class="box">
        <div class="top">
            <div class="inline left"></div><!--
                --><span class="mid-line"></span><div class="inline mid"></div><!--
                --><span class="mid-line"></span><div class="inline right"></div>
        </div>
        <div class="ramdon-msg">
            <a class="run-bo inline" href="#">
                <!--背景400*200，图片5张-->
                <div class="xinwen-logo xinwen-sub" href="#">推&nbsp;荐</div>
                <div class="xinwen-points xinwen-sub">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </a><!--
                --><div class="tui-jian inline">
            <ul>
                <!--每个里的背景图片为30*46-->
                <li class="left-li"><span></span></li><!--
                        --><li></li><!--
                        --><li></li><!--
                        --><li class="bottom-li left-li"></li><!--
                        --><li class="bottom-li"></li><!--
                        --><li class="bottom-li"></li>
            </ul>
        </div>
        </div>

        <div class="goods-title">
            <ul>
                <li>
                    <svg t="1638683915768" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="36904" width="64" height="64"><path d="M994.491259 495.674911c-35.367066-99.453374-87.213697-179.731254-155.571892-240.937638-47.654742-41.29491-92.589555-63.102334-134.82044-65.374273l-0.047998-0.039999c9.951737 33.647112 15.343595 62.702344 16.135574 87.197697 0.823978 24.471354-1.13597 42.830869-5.743849 55.046547-4.631878 12.239677-11.719691 21.999419-21.303437 29.279226-9.599747 7.255808-17.655534 11.463697-24.207361 12.615667-6.503828 1.159969-13.64764 1.727954-21.311437 1.727955-33.823107 0.75998-60.870393-7.271808-81.237855-24.079365-20.359462-16.823556-33.023128-38.422985-38.030996-64.846287-4.975869-26.423302-6.335833-55.086545-3.983895-86.053728 2.311939-30.951183 7.879792-60.414405 16.711559-88.333667 8.791768-27.919263 17.991525-51.822632 27.615271-71.686107C578.318249 20.343463 586.98202 8.479776 594.653817 4.631878c-0.783979 0-5.167864 0.399989-13.25565 1.11997a616.183729 616.183729 0 0 0-24.775345 2.863924c-8.479776 1.13597-19.399488 3.271914-32.863133 6.303834a361.398457 361.398457 0 0 0-39.774949 11.495696c-13.039656 4.599879-27.823265 11.103707-44.374828 19.495486a365.04636 365.04636 0 0 0-47.222753 28.663243c-14.975605 10.719717-30.711189 24.111363-47.254753 40.174939a476.843408 476.843408 0 0 0-46.646768 52.774606c-21.511432 31.351172-34.791081 63.286329-39.806949 95.773471-2.103944 16.023577-2.335938 13.423646 0 26.103311a1360.564073 1360.564073 0 0 1 12.719664 61.390379c3.495908 19.095496 0.983974 34.759082-7.471802 47.014758-8.495776 12.231677-9.431751 24.663349-36.319041 31.519168-17.695533 3.087918-48.398722-4.191889-58.790448-16.031577-10.367726-11.839687-16.895554-27.143283-19.575483-45.878788a334.271173 334.271173 0 0 1-3.495908-53.950575c0.399989-17.199546 2.111944-31.911157 5.231862-44.134835-12.287676-0.77598-31.119178 19.871475-56.486508 61.950364C45.364322 412.365111 6.477349 564.689089 1.853471 653.406746c-7.719796 147.572103 56.846499 251.993346 193.618887 313.151731 86.773709 38.24699 200.842696 57.390485 342.214964 57.390484 228.945954 1.543959 376.070069-62.310355 441.372345-191.586941 46.846763-90.957598 59.958417-211.234422 15.431592-336.687109zM342.804468 821.01832h-46.502772V704.989384H174.136922v116.028936h-46.502772V557.745272h46.502772v104.853231h122.164774V557.745272h46.502772v263.273048z m311.135784-75.861997c-6.895818 16.855555-16.495564 31.359172-28.79124 43.510851-12.303675 12.143679-26.935289 21.639429-43.91884 28.439249-16.991551 6.83182-35.687058 10.343727-56.110518 10.60772-20.167467 0-38.686978-3.295913-55.542534-9.85574-16.855555-6.575826-31.367172-15.871581-43.55085-27.887263-12.175678-12.015683-21.711427-26.455301-28.607244-43.310856-6.895818-16.855555-10.335727-35.575061-10.335727-56.158518 0-21.063444 3.439909-40.214938 10.335727-57.454482 6.879818-17.215545 16.423566-31.903158 28.607244-44.078836 12.183678-12.143679 26.687295-21.503432 43.55085-28.079259 16.855555-6.575826 35.367066-9.85574 55.542534-9.85574 20.423461-0.247993 39.118967 2.783926 56.110518 9.11176 16.983552 6.327833 31.615165 15.559589 43.91884 27.719268 12.295675 12.143679 21.887422 26.767293 28.79124 43.870841 6.887818 17.111548 10.327727 36.199044 10.327727 57.262488 0 20.583456-3.439909 39.302962-10.327727 56.158517z m234.737801-145.03617h-80.093885v220.882167H762.073396V600.120153H681.995511v-42.40688h206.682542v42.40688z" fill="#E64340" p-id="36905"></path><path d="M579.654214 599.46417a74.446034 74.446034 0 0 0-25.175336-17.807529c-9.823741-4.287887-20.727453-6.43183-32.711136-6.431831-12.015683 0-22.847397 2.143943-32.55914 6.431831a74.398035 74.398035 0 0 0-25.023339 17.807529 80.981862 80.981862 0 0 0-16.199573 26.543299c-3.807899 10.111733-5.727849 20.991446-5.727848 32.639139 0 12.527669 1.90395 24.063365 5.727848 34.607086 3.815899 10.543722 9.215757 19.663481 16.199573 27.359277a75.198014 75.198014 0 0 0 25.023339 18.127522c9.703744 4.407884 20.559457 6.591826 32.55914 6.591826 11.983684 0 22.887396-2.183942 32.711136-6.591826 9.815741-4.399884 18.199519-10.431725 25.175336-18.127522s12.367673-16.815556 16.191572-27.359277c3.815899-10.543722 5.735849-22.079417 5.735848-34.607086 0-11.647692-1.90395-22.527405-5.735848-32.639139s-9.215757-18.959499-16.191572-26.543299z" fill="#E64340" p-id="36906"></path></svg>
                </li>
                <li class="font">
                    <span>热销商品</span>
<%--                    <a href="#"> 热销商品</a>--%>
                </li>
            </ul>
            <a href="#">更多>></a>
        </div>
        <div class="ramdon-goods">
<%--            <div class="good-list-panel">--%>
                <table class="good-table">

                </table>
<%--            </div>--%>


            <div class="ending">
                <div class="more-goods">更多</div>
                <div class="ending-msg"></div>
            </div>
        </div>

    </div>
</div>
<script>
    $("#searching").click(function () {
        window.open("${global_url}consume/toFind?key="+$("#search-btn").val());
    });

</script>
<script>
    var host_url = "${global_url}";
    function goodsList() {
        // $(".ramdon-goods .good-table tbody").remove();
        // let good_hltm_ = "" +
        //     "<tbody><tr>" +
        //     "    <td align='center'>" +
        //     "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
        //     "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
        //     "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
        //     "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
        //     "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
        //     "    </td>" +
        //     "</tr></tbody>";
        // $(".ramdon-goods .good-table").append(good_hltm_);

        $.ajax({
            url:'${global_url}consume/hot',
            async:false,
            dataType:'json',
            method:'post',
            data:{
                off:0,
                end:50
            },
            success:function (data) {
                console.log(data)
                if(data.succeed===true) {
                    $(".ramdon-goods .good-table tbody").remove();

                    let good_hltm_ = "<tbody>" ;
                    let len =  data.data.length;
                    let row = ( parseInt(len/5) + (len%5>0?1:0) );
                    for (let index=0;index< row;index++) {
                        good_hltm_ += "<tr><td align='center'>" ;

                        for (let indexJ = 0; indexJ<5 && (indexJ + 5*index < len) ;indexJ++) {
                            good_hltm_ += "<a class='goods-item' href='" + host_url + "consume/toOrder?key=" + (data.data[index * 5 + indexJ].goodsId) + "' style='background-image: url("+
                                data.data[index * 5 + indexJ].goodsIcon+")'>" +
                                "        <span class='goods-msg'></span>" +
                                "        <span class='good-line goods-line1'>" +
                                "            <span class='goodName'>"+
                                data.data[index * 5 + indexJ].goodsName+"</span>" +
                                "        </span>" +
                                "        <span class='good-line goods-line2'>" +
                                "            <span class='goodPrice'>￥<font class='price'>"+
                                data.data[index * 5 + indexJ].goodsPrice+"</font></span>" +
                                "            <span class='goodPersonal'><font class='personal'>"+
                                (parseInt(data.data[index * 5 + indexJ].goodsInventory) - parseInt(data.data[index * 5 + indexJ].goodsExtant))+"</font>人付款</span>" +
                                "        </span>" +
                                "        <span class='good-line goods-line3'>" +
                                "            <span class='goods-line4 left'>" +
                                "                 <span class='goods-title'>包邮</span>";

                            if(data.data[index * 5 + indexJ].goodsIsSpecial =="1") {
                                good_hltm_ += "<span class='goods-title'>特价</span><span class='goods-title'>" +
                                    data.data[index * 5 + indexJ].goodsDiscount +"折</span>";
                            }

                            good_hltm_ += "</span>" +
                                "            <span class='goods-line4 right'>...</span>" +
                                "        </span>" +
                                "</a>";
                            console.log(index * 5 + indexJ);
                        }

                        good_hltm_ += "</td></tr>";
                    }
                    good_hltm_ += "</tbody>";

                    $(".ramdon-goods .good-table").append(good_hltm_);
                }
                else {
                    setGoods([]);
                    error_result.TIP(data.data);
                }
            },
            error:function () {
                setGoods([]);
                error_result.TIP();
            }
        })

    }
    goodsList();



    function addGoods(goods) {
        if($(".ramdon-goods .good-table tbody").find(".not-goods").length>0)
            $(".ramdon-goods .good-table tbody .not-goods").remove();
        let _good_list_html = ""+
                            "<tr>" +
                            "    <td align='center'>" ;
        for (let index_goods=0;index_goods<goods.length;index_goods++){
            _good_list_html +="<a class='goods-item' href='"+host_url+"consume/toOrder?key=" + goods[index_goods].goodsId +"' style='background-image: url("+
                goods[index_goods].goodsIcon+")'>" +
                "        <span class='goods-msg'></span>" +
                "        <span class='good-line goods-line1'>" +
                "            <span class='goodName'>"+
                goods[index_goods].goodsName+"</span>" +
                "        </span>" +
                "        <span class='good-line goods-line2'>" +
                "            <span class='goodPrice'>￥<font class='price'>"+
                goods[index_goods].goodsPrice+"</font></span>" +
                "            <span class='goodPersonal'><font class='personal'>"+
                (parseInt(goods[index_goods].goodsInventory) - parseInt(goods[index_goods].goodsExtant))+"</font>人付款</span>" +
                "        </span>" +
                "        <span class='good-line goods-line3'>" +
                "            <span class='goods-line4 left'>" +
                "                 <span class='goods-title'>包邮</span>";

            if(goods[index_goods].goodsIsSpecial =="1") {
                _good_list_html += "<span class='goods-title'>特价</span><span class='goods-title'>" +
                    goods[index_goods].goodsDiscount +"折</span>";
            }

            _good_list_html += "</span>" +
                "            <span class='goods-line4 right'>...</span>" +
                "        </span>" +
                "</a>";
        }
        _good_list_html +=
                        "    </td>" +
                        "</tr>";

        $(".ramdon-goods .good-table tbody").append(_good_list_html);
    }
    function no_add_goods(){
        let _good_list_html =
            "<tr class='not-goods'>" +
            "    <td align='center'><span style='font-size: 16px;color:#888;'>没有更多了</span>" +
            "    </td>" +
            "</tr>";
        if($(".ramdon-goods .good-table tbody").find(".not-goods").length<=0)
            $(".ramdon-goods .good-table tbody").append(_good_list_html);
    }
    $(".bottom-contain .box .ending .more-goods").click(function () {
        let goodsLength = $(".ramdon-goods .good-table tbody").find(".goods-item").length;
        getGoods(goodsLength+1,goodsLength+5);
    });
    function setGoods(goods) {
        if(goods.length<=0){
            no_add_goods();
        }else{
            addGoods(goods);
        }
        $('body').animate({
            scrollTop:'+=250'
        }, 800);
    }
    function getGoods(off,end) {
        $.ajax({
            url:'${global_url}consume/hot',
            async:false,
            dataType:'json',
            method:'post',
            data:{
                off:off,
                end:end
            },
            success:function (data) {
                if(data.succeed===true) {
                    setGoods( data.data);
                    error_result.TIP(data.data);
                }
                else
                    setGoods([]);
            },
            error:function () {
                setGoods([]);
                error_result.TIP();
            }
        })
    }
</script>
</body>
</html>
