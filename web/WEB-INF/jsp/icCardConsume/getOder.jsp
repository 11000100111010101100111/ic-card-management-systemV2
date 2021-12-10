<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/4
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<html>
    <head>
        <link rel="shortcut icon" href="${global_url}pic/page-home.ico" type="image/x-icon">
        <link rel="stylesheet" href="${global_url}font/iconfont.css">
        <link rel="stylesheet" type="text/css" href="${global_url}theame/css/baseCss.css">
        <link rel="stylesheet" type="text/css" href="${global_url}theame/css/mySelect.css">
        <script src="${global_url}theame/js/jquery-3.6.0.js"></script>
        <script src="${global_url}theame/js/baseJs.js"></script>
        <title>下单页</title>
        <style>
            .order-page{
                position: absolute;
                width: 35%;
                left:50%;
                height: 100%;
                transform: translateX(-50%);
            }
            .order-page .contain{
                position: absolute;
                background-color: #fff;
                width: calc(100% - 10px);
                height: calc(100% - 10px);
                margin: 5px;
                border-radius: 5px;
                box-shadow: 0 0 5px #666;
                padding: 5px;
            }
            .order-page .contain .sub-contain{
                position: absolute;
                width: calc(100% - 10px);
                border-radius: 5px;
                box-shadow: 0 0 5px #666;
            }
            .order-page .contain .order-img{
                height: calc(35% - 5px);
            }
            .order-page .contain .order-img img{
                width: 100%;
                height: 100%;
            }
            .order-page .contain .order-msg{
                height: calc(40% - 5px);
                top:calc(35% + 5px);
                overflow-y: auto;
            }
            .order-page .contain .goods-msg{
                width: 100%;
                height: 100%;
            }
            .order-page .contain .order-msg .counter-box{
                /*width: 33%;*/
                /*height: 25%;*/
            }
            .order-page .contain .order-msg .counter-box .buy-counter{
                display: inline-block;
                width: 60px;
                height: 30px;
                font-size: 16px;
            }
            .order-page .contain .order-msg .goods-titles{
                padding : 5px;
            }
            .order-page .contain .order-msg .goods-titles .goods-titel{
                display: inline-block;
                font-size: 12px;
                color: #fff;
                background-color: var(--sub_color);
                border-radius: 10px;
                padding: 1px 5px;
                margin: 2px;
            }
            .order-page .contain .order-msg .bioa-qian .goods-titel{
                display: inline-block;
                font-size: 12px;
                color: #fff;
                background-color: #c7254e;
                border-radius: 10px;
                padding: 1px 5px;
                margin: 2px;
            }

            .order-page .contain .order-btn{
                top:calc(75% + 5px);
                height: calc(25% - 10px);
            }
            .order-page .contain .order-btn .order-btn-tab{
                width: 100%;
                height: 100%;
            }
            .order-page .contain .order-btn .order-btn-tab .left-td{
                padding-left: 10px;
                font-size: 16px;
                color: #666;
            }
            .order-page .contain .order-btn .order-btn-tab .right-td{
                padding-right: 10px;
            }

        </style>

        <style>
            .safe-pwd{
                position: absolute;
                width: 0; /*450px;*/
                height: 0;/*500px;*/
                top:100%;/*50%;*/
                left: 50%;
                transform: translate(-50%,-50%);
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 8px #666;
            }
            .safe-pwd *{
                opacity: 0;
            }
            .safe-pwd  .safe-pwd-sub{
                width: 100%;
            }
            .safe-pwd .keys-ul{
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                list-style: none;
                width: 95%;
                margin-top: 15%;
                background-color: #fff;
                /*justify-items: center;*/
                /*justify-content: center;*/
                /*align-items: center;*/
            }
            .safe-pwd .keys-ul li{
                width: 55px;
                height: 55px;
                background-color: #fff;
                display: inline-block;
                cursor: not-allowed;
                margin: 10px 5px;
                box-shadow:inset 0 0 4px #666;
                font-size: 24px;
                color: #04A78C;
                font-weight: 800;
                line-height: 55px;
                text-align: center;
            }

            .safe-pwd .input-tab{
                position: absolute;
                width: 100%;
                top: 100%;
                transform: translateY(-100%);
            }
            .safe-pwd .input-tab td{
                text-align: center;
                font-size: 16px;
                font-weight: 800;
                padding-bottom: 10px;
            }
            .safe-pwd .input-tab td input{
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #fff;
                font-size: 20px;
                font-weight: 800;
                color: #4e65c7;
                border: 0;
                outline: 0;
                cursor: pointer;
                box-shadow: inset 2px -4px 8px #666;
                transition: all 0.8s;
            }
            .safe-pwd .input-tab td input:focus{
                border: 0;
                outline: none;
                /*animation: focus-btn-number 0.5s linear;*/
                /*animation-fill-mode: forwards;*/
            }
            @keyframes focus-btn-number {
                from{
                    transform: scale(1);
                }
                25%{
                    transform: scale(1.1);
                }
                50%{transform: scale(0.9);}
                75%{
                    transform: scale(1.1);
                }
                to{transform: scale(1);}
            }
            .safe-pwd .input-tab td .number:hover{
                animation: hover-btn-number 0.8s linear;
                animation-fill-mode: forwards;
                box-shadow: inset -2px -4px 8px #666;
                transform: scale(1.1);
            }
            @keyframes hover-btn-number {
                from{
                    box-shadow:inset -2px -4px 8px #666, 0 0 5px #4e65c7;
                }
                25%{box-shadow:inset -1px -4px 8px #666, 0 0 10px #4e65c7;}
                50%{box-shadow:inset 0 -4px 8px #666, 0 0 15px #4e65c7;}
                75%{box-shadow:inset -1px -4px 8px #666, 0 0 10px #4e65c7;}
                to{box-shadow:inset -2px -4px 8px #666, 0 0 0 #4e65c7;}
            }
            .safe-pwd .input-tab td .clean-pwds:hover{
                animation: hover-btn-number-calen 0.8s linear;
                animation-fill-mode: forwards;
                box-shadow: inset -2px -4px 8px #666;
                transform: scale(1.1);
            }
            @keyframes hover-btn-number-calen {
                from{
                    box-shadow:inset -2px -4px 8px #666, 0 0 5px #c7254e;
                }
                25%{box-shadow:inset -1px -4px 8px #666, 0 0 10px #c7254e;}
                50%{box-shadow:inset 0 -4px 8px #666, 0 0 15px #c7254e;}
                75%{box-shadow:inset -1px -4px 8px #666, 0 0 10px #c7254e;}
                to{box-shadow:inset -2px -4px 8px #666, 0 0 0 #c7254e;}
            }
        </style>
    </head>
    <body>
    <input type="hidden" value="${goodsId}" id="goodsId">
    <div class="order-page">
        <div class="contain">
            <div class="order-img sub-contain">
                <img src="${goodsIcon}">
            </div>
            <div class="order-msg sub-contain">
                <table class="goods-msg">
                    <thead>
                    <tr>
                        <th colspan="3" align="left" style="font-size: 20px ;color:#666;padding: 10px;">${goodsName}</th>
                        <th align="right" style="font-size: 16px ;color:#666;padding-right: 5px;">
                            <svg t="1639060200095" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10198" width="20" height="20">
                                <path d="M512 512m-512 0a512 512 0 1 0 1024 0 512 512 0 1 0-1024 0Z" fill="#37CAC0" p-id="10199"></path>
                                <path d="M498.526316 491.789474h-89.19579a13.473684 13.473684 0 0 1 0-26.947369h81.690948l-71.141053-81.906526a13.473684 13.473684 0 1 1 20.345263-17.664L512 447.892211l71.787789-82.634106a13.473684 13.473684 0 0 1 20.345264 17.677474l-71.168 81.92h81.690947a13.473684 13.473684 0 0 1 0 26.947368h-89.195789v68.823579h89.195789a13.473684 13.473684 0 0 1 0 26.947369h-89.195789v55.996631a13.473684 13.473684 0 0 1-26.947369 0v-55.996631H409.330526a13.473684 13.473684 0 0 1 0-26.947369H498.526316V491.789474z m65.387789 284.698947a13.473684 13.473684 0 1 1 5.160421 26.448842c-18.688 3.637895-37.766737 5.483789-57.074526 5.48379-163.705263 0-296.421053-132.715789-296.421053-296.421053s132.715789-296.421053 296.421053-296.421053 296.421053 132.715789 296.421053 296.421053c0 18.270316-1.657263 36.325053-4.917895 53.989053a13.473684 13.473684 0 0 1-26.502737-4.877474c2.964211-16.060632 4.473263-32.471579 4.473263-49.111579 0-148.830316-120.643368-269.473684-269.473684-269.473684s-269.473684 120.643368-269.473684 269.473684 120.643368 269.473684 269.473684 269.473684c17.569684 0 34.923789-1.684211 51.914105-4.985263zM619.789474 672.916211a13.473684 13.473684 0 0 1 26.947368 0V781.473684a13.473684 13.473684 0 0 1-26.947368 0v-108.544z m148.210526 33.414736a13.473684 13.473684 0 0 1 26.947368 0V781.473684a13.473684 13.473684 0 0 1-26.947368 0v-75.15621zM693.894737 619.789474a13.473684 13.473684 0 0 1 26.947368 0v161.68421a13.473684 13.473684 0 0 1-26.947368 0V619.789474z" fill="#FFFFFF" p-id="10200"></path>
                            </svg>
                            <span class="danjia" id="util-price">${goodsPrice}</span><span class="danwei">${goodsUtil}</span>
                        </th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <td colspan="3" align="right" width="60%" style="font-size: 16px ;color:#666;padding-right: 10px;">购买数量</td>
                        <td align="center" width="40%">
                            <div class="counter-box">
                                <input type="button" value="-" class="buy-counter" id="desc">
                                <span class="buy-counter" id="count">1</span>
                                <input type="button" class="buy-counter" value="+" id="add">
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                    <tbody>
                    <tr>
                        <td colspan="4" align="left">
                            <span style="font-size: 12px;color: #666;padding-left: 10px;">${goodsMark}</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left"  style="padding-left: 10px;font-size: 12px;color: #666;">
                            <span>库存&nbsp;</span><span>${goodsExtant}</span><span>&nbsp;&nbsp;销量&nbsp;</span><span style="color: #fff;border-radius: 10px;background-color: #c7254e;padding: 2px;">${goodsCellNum}</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="goods-titles">
                                <c:forEach  items="${goodsTitles}" var="title">
                                    <span class="goods-titel">${title}</span>
                                </c:forEach >
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"  style="padding-left: 10px;font-size: 12px;color: #666;">
                            <span>${goodsDescription}</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="bioa-qian"  style="padding-left: 10px;font-size: 12px;color: #666;">
                            <span class="goods-titel">${goodsIsSpecial}</span>
                            <span class="goods-titel">${goodsClass}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="order-btn sub-contain">
                <table class="order-btn-tab" cellpadding="0" >
                    <tfoot>
                    <tr style="box-shadow: 0 0 5px #aaa;">
                        <td class="left-td" align="right" style="padding-right: 10px;padding-top: 10px;">
                            共<span id="buy-count">1</span>件 合计<span style="font-size: 20px;font-weight: 800;color: #333" id="need-cost">${goodsPrice}</span>元
                        </td>
                        <td class="right-td" style="padding:10px; ">
                            <input type="button" value="立即支付" id="cost" style="width: 80px;height: 30px;font-size: 16px;">
                        </td>
                    </tr>
                    </tfoot>
                    <tbody>
                    <tr>
                        <td width="80%" align="left" class="left-td">
                            <svg t="1639059952387" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7610" width="16" height="16">
                                <path d="M399.3 169L242.5 855h333.2l156.8-686H399.3z m0 0" fill="#2F8AD0" p-id="7611"></path><path d="M857.5 169h-76L624.7 855h232.8c39.2 0 71-31.8 71-71.1V240.1c0-39.3-31.9-71.1-71-71.1z m0 0" fill="#1AC0D0" p-id="7612"></path><path d="M166.6 169c-39.2 0-71.1 31.8-71.1 71.1V784c0 39.2 31.8 71.1 71.1 71.1H196l156.8-686H166.6z m0 0" fill="#FE5656" p-id="7613"></path>
                            </svg>
                            <span>IC卡支付</span>
                        </td>
                        <td width="20%" align="right" class="right-td">
                            <svg t="1639059802083" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2992" width="20" height="20">
                                <path d="M512 1024A512 512 0 1 1 512 0a512 512 0 0 1 0 1024z m-72.045714-387.072l-150.674286-150.674286a42.642286 42.642286 0 1 0-60.196571 60.342857l180.809142 180.882286a42.642286 42.642286 0 0 0 63.268572-3.291428l338.505143-338.505143a42.642286 42.642286 0 1 0-60.342857-60.196572L439.881143 636.928z" fill="#2FC468" p-id="2993"></path>
                            </svg>
                        </td>
                    </tr>
                    <tr>
                        <td width="80%" align="left" class="left-td">
                            <svg t="1639060018902" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9358" width="16" height="16">
                                <path d="M1012.437544 352.654905l-10.839802-231.249118c-2.890614-59.257586-50.585745-107.675371-109.843331-109.843331L660.505293 0.722653c-32.519407-1.445307-64.316161 10.839802-86.718419 33.964715L33.964714 573.786874c-44.804517 44.804517-44.804517 118.515173 0 163.319689l242.08892 242.08892c44.804517 44.804517 118.515173 44.804517 163.31969 0l539.822159-539.822159c22.402258-23.124912 34.687368-54.199012 33.242061-86.718419z" fill="#E12B77" p-id="9359"></path>
                                <path d="M445.154552 740.719831c-18.788991 18.788991-42.636556 33.242061-57.81228 37.577981l-23.847565-39.023288c15.175723-5.058574 36.132675-15.175723 52.753705-31.796754 17.343684-17.343684 19.511644-33.964714 8.671842-44.804517-10.117149-10.117149-24.570219-8.671842-52.031051 4.335921-37.577982 18.066337-70.820042 20.956951-95.390262-3.613267-28.90614-28.90614-26.738179-74.43331 13.007763-114.179252 18.788991-18.788991 36.855328-28.90614 51.308398-33.964714l22.402259 39.023288c-10.117149 3.613267-26.738179 10.839802-42.636556 26.73818-16.62103 16.62103-16.62103 31.796754-7.949189 40.468595 10.839802 10.839802 24.570219 5.781228 54.921666-7.226535 40.468596-18.788991 70.097389-17.343684 93.2223 6.503882 26.738179 28.183486 28.90614 73.710656-16.62103 119.96048zM622.927311 557.165843L567.282992 527.53705l-47.69513 47.695131 30.351446 54.921665-39.023288 39.023289-116.347213-218.241355 49.863091-49.863091 219.686662 115.624559zM674.235709 506.580099L506.580099 338.924488l37.577981-37.577981 135.858857 135.136203 66.484122-66.484121 31.796753 31.796753zM788.414961 391.678193L620.759351 224.745236l103.339449-104.062103 31.0741 31.074101-65.038814 65.761467 34.687368 34.687368 61.425547-61.425547 31.0741 30.351447-61.425547 62.1482 39.745942 39.745943 68.652082-69.374736 31.0741 31.0741z" fill="#F5DC33" p-id="9360"></path><path d="M496.46295 541.267466l36.855328-36.855328-46.249824-25.292872c-13.007763-7.226535-28.183486-16.62103-40.468595-23.847565l-0.722654 0.722653c7.226535 12.285109 17.343684 27.460833 24.570219 39.745942l26.015526 45.52717z m0 0" fill="#E12B77" p-id="9361"></path>
                            </svg>
                            <span>可用折扣</span>
                        </td>
                        <td width="20%" align="right" class="right-td"><span class="iconfont" style="background-color: var(--sub_color);color: #fff;padding: 0 6px;border-radius: 10px;border: 3px solid #e6e6e6;">${goodsDiscount}折</span><input type="hidden" id="discount" value="${goodsDiscount}"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="safe-pwd">
        <div class="keys-panel safe-pwd-sub">
            <ul class="keys-ul">
                <li class="keys"> </li>
                <li class="keys"> </li>
                <li class="keys"> </li>
                <li class="keys"> </li>
                <li class="keys"> </li>
                <li class="keys"> </li>
            </ul>
        </div>
        <div class="inputs-panel safe-pwd-sub">
            <table class="input-tab">
                <tr>
                    <td align="center"><input type="button" value="1" class="number"></td>
                    <td align="center"><input type="button" value="2" class="number"></td>
                    <td align="center"><input type="button" value="3" class="number"></td>
                </tr>
                <tr>
                    <td align="center"><input type="button" value="4" class="number"></td>
                    <td align="center"><input type="button" value="5" class="number"></td>
                    <td align="center"><input type="button" value="6" class="number"></td>
                </tr>
                <tr>
                    <td align="center"><input type="button" value="7" class="number"></td>
                    <td align="center"><input type="button" value="8" class="number"></td>
                    <td align="center"><input type="button" value="9" class="number"></td>
                </tr>
                <tr>
                    <td align="center"><input type="button" value="*" class="clean-pwds"></td>
                    <td align="center"><input type="button" value="0" class="number"></td>
                    <td align="center"><input type="button" value="-" class="exit-pwds"></td>
                </tr>
            </table>
        </div>
    </div>

    <script>
        $(".safe-pwd .input-tab td input").mousedown(function () {
            $(this).animate({},20,function(){
                $(this).css({'transform':'scale(0.8)'});
            });
        });
        $(".safe-pwd .input-tab td input").mouseup(function () {
            var clickBtn = $(this);
            $(clickBtn).animate({},300,function(){
                $(clickBtn).css({'transform':'scale(1.3)'});
                $(clickBtn).animate({},200,function(){
                    $(clickBtn).css({'transform':'scale(0.8)'});
                    $(clickBtn).animate({},300,function(){
                        $(clickBtn).css({'transform':'scale(1)'});
                    });
                });
            });
        });
        $(".safe-pwd .input-tab td .number").click(function () {
            let pwdInputs = $(".safe-pwd .keys");
            for (let index = 0;index < pwdInputs.length;index++){
                let key = $(pwdInputs[index]).html();
                if (typeof (key) == "undefined" || $.trim(key) === ""){
                    $(pwdInputs[index]).html($(this).val());
                    if(index == pwdInputs.length-1){
                        payment();
                    }
                    return;
                }
            }

        });
        $(".safe-pwd .input-tab .clean-pwds").click(function () {
            let pwdInputs = $(".safe-pwd .keys");
            for (let index = 0;index < pwdInputs.length;index++){
                $(pwdInputs[index]).html("");
            }
        });

        $(".safe-pwd .input-tab .exit-pwds").click(function () {
            $(".safe-pwd").animate({
                width:0,
                height:0,
                top:'100%',
                opacity:0
            },{
                duration:800,
                complete:function () {
                    $(".safe-pwd *").css("opacity","0");
                }
            });
        });
        function show_pwd() {
            $(".safe-pwd").animate({
                width:'450px',
                height:'500px',
                top:'50%',
                opacity:1
            },{
                duration:800,
                complete:function () {
                    $(".safe-pwd *").css("opacity","1");
                }
            });
        }

        function setNumber() {
            let nums = $(".safe-pwd .input-tab td .number");
            let arr = shuffle();
            for (let index =0;index<nums.length;index++){
                $(nums[index]).val(arr[index]);
            }
        }
        function shuffle() {
            let a = [0,1,2,3,4,5,6,7,8,9];
            let len = a.length;
            for (let i = 0; i < len - 1; i++) {
                let index = parseInt(Math.random() * (len - i));
                let temp = a[index];
                a[index] = a[len - i - 1];
                a[len - i - 1] = temp;
            }
            return a;
        }
        setNumber();
    </script>
    <script>
        //单价： #util-price
        //减一： #desc
        //购买数量 #count
        //加一： #add
        //合计： #buy-count
        //需要支付： #need-cost
        //立即购买： #cost
        //折扣： #discount
        $("#desc").click(function () {
            let num = $("#count").html();
            if(num<=0){
                my_tip.tip("不能在减了~~~");
                return;
            }
            $("#count").html(parseInt(num)-1);
            $("#buy-count").html($("#count").html());
            let discount_ = $("#discount").val();
            // let money = (parseFloat(discount_) * parseFloat($("#util-price").html()) * parseInt($("#count").html())).toFixed(2);
            $("#need-cost").html(needCost());
        });
        $("#add").click(function () {
            let num = $("#count").html();
            // if(num<=0){
            //     my_tip.tip("不能在减了~~~");
            //     return;
            // }
            $("#count").html(parseInt(num)+1);
            $("#buy-count").html($("#count").html());
            let discount_ = $("#discount").val();

            $("#need-cost").html(needCost());
        });


        function needCost() {
            let _discount = $.trim($("#discount").val());
            if (typeof (_discount) =="undefined" || _discount == "" || isNaN(_discount)){
                _discount = 1;
            }
            let utilPrice = $.trim($("#util-price").html());
            if (typeof (utilPrice) =="undefined" || utilPrice == "" || isNaN(utilPrice)){
                utilPrice = 0.00;
            }
            let count = $.trim($("#count").html());
            if (typeof (count) =="undefined" || count === "" || isNaN(count)){
                utilPrice = 0;
            }
            return (parseFloat(_discount)*0.1 * parseFloat(utilPrice) * parseInt(count)).toFixed(2);
        }

        $("#cost").click(function () {
            $(".safe-pwd .input-tab .clean-pwds").click();
            startpwd();
        });

        function payment() {
            let verify_ = "";
            let pwdInputs = $(".safe-pwd .keys");
            for (let index = 0;index < pwdInputs.length;index++){
                let key = $(pwdInputs[index]).html();
                if (typeof (key) == "undefined" || key === ""){
                    my_tip.tip("密码输入不完整,请重新输入！");
                    $(".safe-pwd .keys").html("");
                    return;
                }
                verify_ += key;
            }
            if(typeof(verify_) == "undefined" || $.trim(verify_).length !=6){
                my_tip.tip("密码输入不完整,请重新输入！");
                $(".safe-pwd .keys").html("");
                return;
            }
            let dto = {
                verify:verify_,//支付密码
                buyNum:$("#buy-count").html(),//支付数量
                gid:$("#goodsId").val(),//：商品id
                money:$("#need-cost").html(),//消费金额
            };

            endPwd();
            $.ajax({
                url:'${global_url}consume/order',dataType:'json',method:'post',data:dto,
                beforeSend:function () {
                    loading_cir.loading("body");
                },
                success:function (data) {
                    if(data.succeed == true){
                        my_tip.tip("购买成功！");
                        loading_cir.loaded("body");
                        // window.history.back();
                        return;
                    }
                    loading_cir.loaded("body");
                    my_tip.tip(data.data);
                },error:function () {
                    loading_cir.loaded("body");
                }
            })
        }
        //打开密码输入框
        function startpwd() {
            show_pwd();
        }
        //关闭输入密码框
        function endPwd() {
            $(".safe-pwd .input-tab .exit-pwds").click();
        }
    </script>
    </body>
</html>
