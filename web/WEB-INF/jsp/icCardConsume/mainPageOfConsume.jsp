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
            margin-bottom: 10px;
            cursor: pointer;
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
        .ramdon-goods .ending .ending-msg{
            position: absolute;
            top:55px;
            width:100%;
            background-color: #fff;
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

            box-shadow: 0 0 10px #aaa;
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
                        <td><font class="find-title">关键字：</font></td>
                        <td colspan="2">
                            <div id="goodsName">
                                <input type="text" value="${key}" id="goods_key">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><font  class="find-title">单价区间：</font></td>
                        <td colspan="2">
                            <div id="goodPrice">
                                <input type="text" id="beginPrice"><font class="find-title">&nbsp;元 - </font><input id="endPrice" type="text"><font class="find-title">&nbsp;元</font>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><font class="find-title">商品种类：</font></td>
                        <td class="chiose_content">
                            <input type="hidden" value="" id="goodClass">
                            <div class="good-class">
<%--                                <div class="wrap">--%>
<%--                                    <input type="radio" name="1" id="item6" />--%>
<%--                                    <label for="item6">--%>
<%--                                        <div class="item">--%>
<%--                                            <div class="content">--%>
<%--                                                学习用品--%>
<%--                                            </div>--%>
<%--                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                                <div class="wrap">--%>
<%--                                    <input type="radio" name="1" id="item7" />--%>
<%--                                    <label for="item7">--%>
<%--                                        <div class="item">--%>
<%--                                            <div class="content">--%>
<%--                                                蔬菜--%>
<%--                                            </div>--%>
<%--                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                                <div class="wrap">--%>
<%--                                    <input type="radio" name="1" id="item8" />--%>
<%--                                    <label for="item8">--%>
<%--                                        <div class="item">--%>
<%--                                            <div class="content">--%>
<%--                                                水果--%>
<%--                                            </div>--%>
<%--                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                                <div class="wrap">--%>
<%--                                    <input type="radio" name="1" id="item9" />--%>
<%--                                    <label for="item9">--%>
<%--                                        <div class="item">--%>
<%--                                            <div class="content">--%>
<%--                                                服装--%>
<%--                                            </div>--%>
<%--                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                                <div class="wrap">--%>
<%--                                    <input type="radio" name="1" id="item10" />--%>
<%--                                    <label for="item10">--%>
<%--                                        <div class="item">--%>
<%--                                            <div class="content">--%>
<%--                                                其他--%>
<%--                                            </div>--%>
<%--                                            <img src="http://localhost:8080/nchkkjxy/pic/card/gou.png" />--%>
<%--                                        </div>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
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

        $("#goods_key").blur(function () {
            goodsList();
        });
        $("#beginPrice").blur(function () {
            goodsList();
        });
        $("#endPrice").blur(function () {
            goodsList();
        });
        $("#find-btn").click(function () {
            goodsList();
        });


        var host_url = "${global_url}";
        function goodsList() {
            let key = $("#goods_key").val();
            let typeName = $("#goodClass").val();
            let beginPrice = $("#beginPrice").val();
            let endPrice = $("#endPrice").val();
            let order = "1";//$("#").val();

            $.ajax({
                url:'${global_url}consume/getGoods',
                async:false,
                dataType:'json',
                method:'post',
                data:{
                    key: key,
                    typeName:typeName,
                    beginPrice:beginPrice,
                    endPrice:endPrice,
                    order:order,
                    off: 0,
                    end: 50
                },
                success:function (data) {
                    if(data.succeed===true) {

                        $(".ramdon-goods .good-table tbody").remove();

                        let good_hltm_ = "<tbody>" ;
                        let len =  data.data.length;
                        if(len<=0){
                            $(".ramdon-goods .good-table").append("<tbody></tbody>");
                            setGoods([]);
                            return;
                        }
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
                            }

                            good_hltm_ += "</td></tr>";
                        }
                        good_hltm_ += "</tbody>";

                        $(".ramdon-goods .good-table").append(good_hltm_);
                    }
                    else {
                        $(".ramdon-goods .good-table tbody").remove();
                        $(".ramdon-goods .good-table").append("<tbody></tbody>");
                        setGoods([]);
                        error_result.TIP(data.data);
                    }
                },
                error:function () {
                    $(".ramdon-goods .good-table tbody").remove();
                    $(".ramdon-goods .good-table").append("<tbody></tbody>");
                    setGoods([]);
                    error_result.TIP();
                }
            })

        }

        function getGoodsTypeList(){
            $.ajax({
                url:'${global_url}consume/types',
                method:'post',
                dataType:'json',
                data:{

                },
                success:function (data) {
                    if(data.succeed === true){
                        setGoodsTypeList(data.data);
                    }
                },
                error:function () {
                    error_result.TIP();
                }
            });
        }
        function setGoodsTypeList(typeList) {
            $(".seach-box .chiose_content .good-class .wrap").remove();
            let _goodsTypeList_html ="";
            for (let listIndex = 0;listIndex<typeList.length;listIndex++){
                _goodsTypeList_html += "<div class='wrap'>" +
                                        "    <input type='radio' name='1' id='item"+listIndex+"' />" +
                                        "    <label for='item"+listIndex+"'>" +
                                        "        <div class='item'>" +
                                        "            <div class='content'>" +
                                        typeList[listIndex].typeName +
                                        "            </div>" +
                                        "            <img src='" +
                                        typeList[listIndex].typeIcon+"' />" +
                                        "        </div>" +
                                        "    </label>" +
                                        "</div>";
            }
            $(".seach-box .chiose_content .good-class").append(_goodsTypeList_html);

            $(".seach-box .chiose_content .good-class .item").click(function () {
                my_tip.tip($(this).val());
            });
            $(".seach-box .chiose_content .good-class .content").click(function () {
                $("#goodClass").val($.trim($(this).html()));
                goodsList();
            });
            $(".seach-box .chiose_content .good-class .item img").click(function () {
                $(this).parent(".item").find(".content").click();
                goodsList();
            });
        }

        goodsList();
        getGoodsTypeList();

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


        $(".ramdon-goods .ending .more-goods").click(function () {
            let goodsLength = $(".ramdon-goods .good-table tbody").find(".goods-item").length;
            let key = $("#goods_key").val();
            let typeName = $("#goodClass").val();
            let beginPrice = $("#beginPrice").val();
            let endPrice = $("#endPrice").val();
            let order = "1";//$("#").val();

            let obj = {
                key: key,
                typeName:typeName,
                beginPrice:beginPrice,
                endPrice:endPrice,
                order:order,
                off: goodsLength+1,
                end: goodsLength+5
            };
            getGoods(obj);
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
        function getGoods(obj) {
            $.ajax({
                url:'${global_url}consume/getGoods',
                async:false,
                dataType:'json',
                method:'post',
                data:{
                    key:obj.key,
                    typeName:obj.typeName,
                    beginPrice:obj.beginPrice,
                    endPrice:obj.endPrice,
                    order:obj.order,
                    off:obj.off,
                    end:obj.end
                },
                success:function (data) {
                    // console.log(data.data);
                    if(data.succeed===true) {
                        if(data.data.length<=0){
                            setGoods([]);
                            return;
                        }
                        setGoods( data.data);
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
    </script>

    <script>

    </script>
</body>
</html>
