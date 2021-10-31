<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/24
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://localhost:8080/nchkkjxy/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/mySelect.css">
    <script src="http://localhost:8080/nchkkjxy/theame/js/my-select.js"></script>
    <script src="http://localhost:8080/nchkkjxy/theame/js/jquery-3.6.0.js"></script>
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
            width: 100%;
            height: 15%;
            background-color: rgb(255, 113, 87);
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
            width: 50px;
            height: 50px;
            background-color: var(--sub_color);
            margin-top: 5px;
            margin-right: 5px;
            border-radius: 50%;
            cursor: pointer;
            background: url('http://localhost:8080/nchkkjxy/pic/main_page/defult_man.png') center no-repeat;
            background-size: 100% 100%;
            border: 2px solid #fff;
        }
        .top-contain .top .right .head-img:hover{
            transform: translateY(5px) translateZ(5px) scale(1.1);
            transition: all var(--transform_slowily);
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
            background: url('http://localhost:8080/nchkkjxy/pic/main_page/tuijian.jpg') center no-repeat;
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
            background: url('http://localhost:8080/nchkkjxy/pic/main_page/card.png') center no-repeat;
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
            background-color: aquamarine;
            margin-bottom: 2px;
        }
        .bottom-contain .box .goods-title ul{
            list-style: none;
        }
        .bottom-contain .box .goods-title ul li {
            display: inline-block;
            width: 50px;
            height: 50px;
            background-color: blueviolet;
            margin-right: 5px;
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
            color:#fff;
            transition: all var(--transform_slowily);
        }
        .bottom-contain .box .goods-title a:hover{
            color: var(--sub_color);
        }
    </style>

    <style>
        .bottom-contain .box .ending{
            position: absolute;
            margin-bottom: 0;
            width: 125%;
            height: 200px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #666;
            margin-bottom: 0;
            margin-top: 5px;
        }
    </style>

    <!-- 自定义下拉列表 -->
<%--    <style>--%>

<%--        .my-select *{--%>
<%--            transition: all 0.3s;--%>
<%--        }--%>
<%--        .my-select {--%>

<%--            position: relative;--%>
<%--            min-width: 100px;--%>
<%--            max-width: 200px;--%>
<%--            /* background-color: rgba(4, 167, 140,0.1); */--%>

<%--            /* color: rgb(4, 167, 140); */--%>
<%--            color: #fff;--%>


<%--            font-size: 16px;--%>

<%--            border: none;--%>


<%--            cursor: pointer;--%>

<%--        }--%>

<%--        .my-select >.select-main {--%>

<%--            position: relative;--%>
<%--            padding: 10px;--%>
<%--            display: inline-block;--%>
<%--            /* left: 50%;--%>
<%--            transform: translateX(-50%); */--%>
<%--            font-weight: bold;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        .my-select>.select-menu {--%>

<%--            display: none;--%>

<%--            position: absolute;--%>

<%--            min-width: 100px;--%>
<%--            max-width: 200px;--%>
<%--            left: 50%;--%>
<%--            transform: translateX(-50%);--%>
<%--            margin-top: 0;--%>
<%--            background-color: #f9f9f9;--%>

<%--            width: calc(100% - 2px);--%>

<%--            border-radius: 0 0 5px 5px;--%>
<%--            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);--%>

<%--            border-left: 1px solid rgb(4, 167, 140);--%>
<%--            border-right: 1px solid rgb(4, 167, 140);--%>
<%--            border-bottom: 1px solid rgb(4, 167, 140);--%>
<%--            z-index: 99;--%>

<%--        }--%>

<%--        .my-select>.select-menu>a {--%>

<%--            color: rgb(4, 167, 140);--%>

<%--            padding: 12px 5px;--%>

<%--            text-decoration: none;--%>
<%--            overflow:hidden;--%>
<%--            white-space:nowrap;--%>
<%--            text-overflow:ellipsis;--%>
<%--            display: block;--%>
<%--            /*text-align: center;*/--%>
<%--        }--%>
<%--        .my-select>.select-menu>a:last-child{--%>
<%--            border-radius: 0 0 5px 5px;--%>
<%--        }--%>
<%--        .my-select>.select-menu>a:hover {--%>
<%--            color: #fff;--%>
<%--            font-weight: bold;--%>
<%--            background-color: rgb(4, 167, 140) ;--%>

<%--        }--%>
<%--        .my-select:hover .select-menu {--%>

<%--            animation: unfold_menu 0.5s ease-out;--%>
<%--            display: block;--%>


<%--        }--%>
<%--        .my-select:hover{--%>
<%--            background-color: rgb(4, 167, 140);--%>
<%--            color: #fff;--%>
<%--        }--%>
<%--        .my-select:hover .select-main {--%>

<%--            /*background-color: #3e8e41;*/--%>

<%--        }--%>
<%--        @keyframes unfold_menu {--%>
<%--            0%{opacity: 0;}--%>
<%--            100%{opacity: 0.8;}--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script>--%>
<%--        var mySelect = {--%>
<%--            list:[{url:'',title:''}],--%>
<%--            open: function () {--%>

<%--            },--%>
<%--            dataGruid: function (obj,title,list) {--%>
<%--                $(obj).append("<div class='my-select'></div>");--%>
<%--                if(typeof(title)=="undefined") {--%>
<%--                    title = '按钮';--%>
<%--                }--%>
<%--                var select = $(obj).find(".my-select");--%>
<%--                $(select).append("<div class='select-main'>" +--%>
<%--                    title +--%>
<%--                    "</div>" +--%>
<%--                    "<div class='select-menu'>" +--%>
<%--                    "</div>");--%>
<%--                var menu = $(select).find(".select-menu");--%>
<%--                for(let i=0;i<list.length;i++){--%>
<%--                    $(menu).append("<a href='" +--%>
<%--                        list[i].url+--%>
<%--                        "'>" +--%>
<%--                        list[i].title+--%>
<%--                        "</a>");--%>
<%--                }--%>
<%--            },--%>
<%--            dataGruidAll:function(obj,titles,lists){--%>
<%--                for(let j=0;j<$(obj).length;j++){--%>
<%--                    // mySelect.list = [{url:"#",title:"选项1"},{url:"#",title:"选项2"},{url:"#",title:"选项3"},{url:"#",title:"选项4"}];--%>
<%--                    this.dataGruid($(obj)[j],titles[j],lists[j]);--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>
<%--    </script>--%>

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
            --><input type="text" id="search-btn" value="${userId}"><!--
            --><label for="searching" class="iconfont icon-sousuo" id="seach-lab"></label><!--
        --></div>
</div>

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

                </li>
                <li>
                    <!-- <a href="#"> </a> -->
                </li>
            </ul>
            <a href="#">更多>></a>
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

                </li>
                <li>
                    <!-- <a href="#"> </a> -->
                </li>
            </ul>
            <a href="#">更多>></a>
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

                </li>
                <li>
                    <!-- <a href="#"> </a> -->
                </li>
            </ul>
            <a href="#">更多>></a>
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

                </li>
                <li>
                    <!-- <a href="#"> </a> -->
                </li>
            </ul>
            <a href="#">更多>></a>
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

                </li>
                <li>
                    <!-- <a href="#"> </a> -->
                </li>
            </ul>
            <a href="#">更多>></a>
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


        <div class="ending">

        </div>
    </div>
</div>

<%--//导航栏--%>
<script>
    var lis = $(".top-contain .top .left ul").children();
    // console.log(lis);
    // for(i=0;i<lis.length;i++){
    //     mySelect.list = [{url:"#",title:"选项1"},{url:"#",title:"选项2"},{url:"#",title:"选项3"},{url:"#",title:"选项4"}];
    //     mySelect.dataGruid($(lis[i]),'菜单'+i,mySelect.list);
    // }
    var titles=[
        {txt:'主   页',font:'icon-shouye'},
        {txt:'个人消费',font:'icon-gouwuche'},
        {txt:'业务办理',font:'icon-bumengaikuang'},
        {txt:'我   的',font:'icon-chanxueyanhezuo'},
        {txt:'系   统',font:'icon-shezhi'}];
    var lists=[
        [],
        [
            {url:"#",title:"余额",    font:"icon-wodezijin"},
            {url:"#",title:"消费记录",font:"icon-shouxinxiangqing-xiaofeijilu"},
            {url:"#",title:"充值提现", font:"icon-chongzhi"}
        ]
        ,
        [
            {url:"http://localhost:8080/nchkkjxy/createCard/toCreateCard",title:"IC卡申领",font:"icon-kexuejishu"},
            {url:"#",title:"IC卡挂失",font:"icon-301guashishenqing-lv"},
            {url:"#",title:"IC卡注销",font:"icon-chonghong-21"},
            {url:"#",title:"业务记录",font:"icon-shouxinxiangqing-xiaofeijilu"}],
        [
            {url:"#",title:"个人信息",font:"icon-xueshengziliao"},
            {url:"#",title:"登录选项",font:"icon-huidaodingbu"},
            {url:"#",title:"退出系统",   font:"icon-tuichudenglu"}
            ],
        [
            {url:"#",title:"关于我们",font:"icon-dollar-symbol"},
            {url:"#",title:"使用手册",font:"icon-shiyongshouce_icon"},
            {url:"#",title:"开发者", font:"icon-kaifazhe"},
            {url:"#",title:"法律",font:"icon-falvshengmingfalv"}
        ]
    ]
    mySelect.dataGruidAll(lis,titles,lists);

</script>
</body>
</html>
