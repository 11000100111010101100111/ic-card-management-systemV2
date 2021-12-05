<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/4
  Time: 10:27
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
    <title>商品搜索</title>
    <link rel="shortcut icon" href="${global_url}pic/page-home.ico" type="image/x-icon">
    <link rel="stylesheet" href="${global_url}font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/baseCss.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/mySelect.css">
    <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
    <script src="${global_url}theame/js/baseJs.js"></script>

    <style>
        body{
            overflow-y: auto;
            /*position: relative;*/
        }
        .good-panel{
            width: 100%;
            height: 100%;

            position: absolute;
            /* left: 50%;
            transform: translateX(-50%); */

             /*background-color: #666;*/
            /*margin-bottom: 10px;*/
            overflow-y: visible;
        }
        .good-panel .seach-box{
            position: fixed;
            width: 100%;
            height: 25%;
            z-index: 5;
            background-color: transparent;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        .good-panel .seach-box-item{
            width: 100%;
            height: 25%;
            background-color: var(--sub_color);
        }
        .good-panel .ramdon-goods{
            /*position: absolute;*/
            width: 100%;
            height: 75%;
        }
        .ramdon-goods .ending{
            position: absolute;
            width: 125%;
            height: 200px;
            left: 50%;
            transform: translateX(-50%);
            margin-bottom: 0;
            margin-top: 5px;
        }
        .ramdon-goods .ending .more-goods{
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
            cursor: pointer;
        }
        .ramdon-goods .ending .ending-msg{
            position: absolute;
            top:42px;
            width:100%;
            background-color: #777;
            height: calc(100% - 42px);
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
        .good-table tr td a{
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
            transition: all var(--transform_slowily);
            filter: blur(1px);
            margin-left: 10px;
        }
        .good-table tr td a:hover{
            background-size: 120% 120%;
            filter: blur(0);
            box-shadow: 0 6px 6px var(--sub_color);
            transform: scale(1.01) translateY(-5px) translateZ(-5px);
        }
    </style>

    <style>
        .good-panel .seach-box>div{
            position: absolute;
            left:10%;
            top:50%;
            transform: translateY(-50%);
            background-color: rgba(4, 167, 140, 0.8);
            border-radius: 10px;
            padding: 5px 10px;
        }
        /*.good-panel .seach-box>div>table,*/
        /*.good-panel .seach-box>div>input{*/
        /*    display: inline-block;*/
        /*}*/
        .good-panel .seach-box td {
            padding-top: 5px;
        }
        .good-panel .seach-box .find-title{
            font-size: 14px;
            font-weight: 800;
            color: #fff;
        }
        #goodsName{}
        #goodPrice{}
        #goodsName input{
            width: 300px;
            height:30px;
            font-size: 14px;
            color:var(--sub_color);
            padding-left: 5px;
        }
        #goodPrice input{
            width: 100px;
            height:30px;
            font-size: 14px;
            color:var(--sub_color);
            text-align: center;
            padding-left: 5px;
        }
        #find-btn{

            width: 80px;
            height: 30px;
            /*margin: 20px;*/
            background-color: #c75558;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            transition: all var(--transform_slowily);
        }
        #find-btn:hover{
            box-shadow: 0 0 6px #666;
        }
    </style>

    <style type="text/css">

        .chiose_content{
            /*position: absolute;*/
            /*top: 50%;*/
            /*left:50%;*/
            /*transform:translate(-50%,-50%);*/
            /*background-color: #c7254e;*/
            /*border-radius: 5px 5px 0 0;*/
            /*box-shadow: 0 0 10px #fff;*/
            /*border: 3px solid var(--sub_color);*/
            /*border-bottom: none;*/
            /*width: 800px;*/
        }
        .good-class {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            width: 500px;
            height: 50px;
            border-radius: 10px;
            background-color: #fff;
            margin: 5px;
        }


        .chiose_content .wrap {
            position: relative;
            margin: 10px;
        }

        .chiose_content .item {
            width: 80px;
            height: 30px;
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
            width: 30px;
            height: 30px;
            position: absolute;
            transform: translate(5px,9px);
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
            font-size: 16px;
            text-align: center;
            line-height: 30px;
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
        }

    </style>
</head>
<body>
    <div class="good-panel">
        <div class="seach-box">
            <div>
                <table>
                    <tr>
                        <td><font class="find-title">商品名称：</font></td>
                        <td colspan="2">
                            <div id="goodsName">
                                <input type="text" value="${key}">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><font  class="find-title">单价区间：</font></td>
                        <td colspan="2">
                            <div id="goodPrice">
                                <input type="text" ><font class="find-title">&nbsp;元 - </font><input type="text"><font class="find-title">&nbsp;元</font>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><font class="find-title">商品种类：</font></td>
                        <td class="chiose_content">
                            <input type="hidden" value="" id="goodClass">
                            <div class="good-class">
                                <div class="wrap">
                                    <input type="radio" name="1" id="item6" />
                                    <label for="item6">
                                        <div class="item">
                                            <div class="content">
                                                生活用品
                                            </div>
                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                                        </div>
                                    </label>
                                </div>
                                <div class="wrap">
                                    <input type="radio" name="1" id="item7" />
                                    <label for="item7">
                                        <div class="item">
                                            <div class="content">
                                                食品
                                            </div>
                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                                        </div>
                                    </label>
                                </div>
                                <div class="wrap">
                                    <input type="radio" name="1" id="item8" />
                                    <label for="item8">
                                        <div class="item">
                                            <div class="content">
                                                电子产品
                                            </div>
                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                                        </div>
                                    </label>
                                </div>
                                <div class="wrap">
                                    <input type="radio" name="1" id="item9" />
                                    <label for="item9">
                                        <div class="item">
                                            <div class="content">
                                                学习用品
                                            </div>
                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                                        </div>
                                    </label>
                                </div>
                                <div class="wrap">
                                    <input type="radio" name="1" id="item10" />
                                    <label for="item10">
                                        <div class="item">
                                            <div class="content">
                                                其他
                                            </div>
                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </td>
                        <td align="right" style="padding-left: 50px;">
                            <input type="button" value="搜 索" id="find-btn">
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div class="seach-box-item"></div>
        <div class="ramdon-goods">
            <table class="good-table">

            </table>
            <div class="ending">
                <div class="more-goods">更多</div>
                <div class="ending-msg"></div>
            </div>
        </div>
    </div>

    <script>

        var host_url = "${global_url}";
        function goodsList() {
            $(".ramdon-goods .good-table tbody").remove();
            let good_hltm_ = "" +
                "<tbody>" +
                "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>"  +
                "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>" +
                    "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>"  +
                "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>"  +
                "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>"  +
                "<tr>" +
                "    <td align='center'>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "        <a href='"+host_url+"consume/toOrder?key=1"+"'></a>" +
                "    </td>" +
                "</tr>" +
                "</tbody>";
            $(".ramdon-goods .good-table").append(good_hltm_);
        }
        goodsList();



        function addGoods(goods) {
            if($(".ramdon-goods .good-table tbody").find(".not-goods").length>0)
                $(".ramdon-goods .good-table tbody .not-goods").remove();
            let _good_list_html = ""+
                "<tr>" +
                "    <td align='center'>" ;
            for (let index_goods=0;index_goods<goods.length;index_goods++){
                _good_list_html +="<a href='"+host_url+"consume/toOrder?key=1"+"'></a>\n";
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
        $(".ramdon-goods .ending .more-goods").click(function () {
            getGoods();
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
        function getGoods() {
            $.ajax({
                url:'${global_url}test/getGoods',
                async:false,
                dataType:'json',
                method:'post',
                data:{},
                success:function (data) {
                    if(data.succeed===true) {
                        setGoods( data.data);
                    }
                    else
                        setGoods([]);
                },
                error:function () {
                    setGoods([]);
                }
            })
        }
    </script>

    <script>
        $(".chiose_content .good-class .item").click(function () {
            my_tip.tip($(this).val());
        });
        $(".chiose_content .good-class .content").click(function () {
           $("#goodClass").val($.trim($(this).html()));
        });
        $(".chiose_content .good-class .item img").click(function () {
            $(this).parent(".item").find(".content").click();
        });
    </script>
</body>
</html>
