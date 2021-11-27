<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/13
  Time: 18:22
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
    <title>表格模板</title>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <style>

        /* 禁止文字选中 */
        .forbiden_txt,h1,
        h2,h3,h4,h5,p,font,label,
        table tfoot *{
            -o-user-select: none;
            -moz-user-select: none; /*火狐 firefox*/
            -webkit-user-select: none; /*webkit浏览器*/
            -ms-user-select: none; /*IE10+*/
            -khtml-user-select :none; /*早期的浏览器*/
            user-select: none;
        }
        body{
            overflow-x:hidden;
            overflow-y:hidden;
            /* 登录按钮长宽 */
            --login_WH:100px;/*20%;*/

            /* 主题色 */
            --main_color:#2a3fff;
            /* 次主题色 */
            --sub_color: rgb(4, 167, 140);
            /* 主要字体色 */
            --main-font-color:#000;
            /* 次要字体色 */
            --sub-font-color:#666;
            /* 淡灰色 */
            --sub-color:#aaa;
            --cir_shadow:rgb(255, 113, 87);

            /* 动画延时快 */
            --transform_qukily:0.3s;
            /* 动画延时慢 */
            --transform_slowily:0.5s;
        }

        *{
            margin: 0;
            padding: 0;
            transition: opacity var(--transform_slowily);
        }

        /*/////////////////////////////////滚动条样式///////////////////////////////////*/
        /* 设置滚动条的样式 */
        *::-webkit-scrollbar {
            width:10px;
            border-radius: 20px;
        }
        /* 滚动槽 */
        *::-webkit-scrollbar-track {
            background-color: #fff;
            -webkit-box-shadow: var(--sub_color);
            border-radius:10px;
        }
        /* 滚动条滑块 */
        *::-webkit-scrollbar-thumb {
            background: var(--sub_color);
            border-radius: 20px;
        }
        *::-webkit-scrollbar-thumb:window-inactive {
            background:rgba(255,0,0,0.4);
        }
        *::-webkit-scrollbar {
            /*display: none;*/
        }

        input,textarea{
            caret-color: var(--sub_color);
            border-radius: 2px;
            border: 1px solid var(--sub_color);
        }
        input:focus,textarea:focus{
            outline: 2px solid var(--sub_color);
            /*box-shadow: 0 0 8px var(--sub_color);*/
        }
        input:hover,textarea:hover{
            box-shadow: 0 0 6px var(--sub_color);
        }



        .my_tip{
            position: absolute;
            display: none;
            top: 50%;
            left: 50%;
            color: #fff;
            font-size: 14px;
            transform: translate(-50%,-50%);
            background-color: rgba(4, 167, 140,0.6);
            /*display: inline-block;*/
            padding: 5px 15px;
            border-radius:2px;
            opacity: 0;
            z-index: 99;
        }

        .my_tip span{
            padding: 2px;
            text-align: center;
            color: #fff;
        }
    </style>
    <!--    表格样式-->
    <style>
        body{
            /*position: relative;*/
            /*width: 100%;*/
            /*height: 100%;*/
            overflow: scroll;
        }
        .content{
            position: absolute;
            /*display: inline-block;*/
            width: 100%;
            height: 100%;
            /*width: 100%;*/
            /*height: 100%;*/
        }
        .my-table-template{
            position: relative;
            width: 90%;
            height: 90%;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);

            border-radius: 5px;
            box-shadow: 0 0 8px #aaa;
            padding: 5px;
            /*background-color: #c7254e;*/
        }
        /*//表格操作*/
        .operator-tab{
            /*position: relative;*/
            /*width: 90%;*/
            /*height: 10%;*/
            /*left: 50%;*/
            /*transform: translateX(-50%);*/
            /*background-color: #4e65c7;*/
            padding: 5px;
        }
        .operator-tab input[type='button']:focus{
            outline: none;
            border: 0;
        }
        .operator-tab input[type='button']:hover{
            font-weight: 800;
        }
        /*//普通按钮*/
        .operator-tab .normal{
            background-color: var(--sub_color);
            color: #fff;
            transition: all var(--transform_slowily);
            border: 0;
        }
        .operator-tab .normal:hover{
            box-shadow: 0 0 8px var(--sub_color);
        }
        /*警示按钮*/
        .operator-tab .alter{
            background-color: #c7254e;
            color: #fff;
            transition: all var(--transform_slowily);
            border: 0;
        }
        .operator-tab .alter:hover{
            box-shadow: 0 0 8px #c7254e;
        }
        /*信息按钮*/
        .operator-tab .msg{
            background-color: #4e65c7;
            color: #fff;
            transition: all var(--transform_slowily);
            border: 0;
        }
        .operator-tab .msg:hover{
            box-shadow: 0 0 8px #4e65c7;
        }

        .my-table{
            width: 100%;
            height: calc(100% - 40px);
            max-height: calc(100% - 40px);
            min-height: calc(100% - 40px);
        }
        .my-table .my_th{
            background-color: var(--sub_color);
            color: #fff;
        }
        .my-table tbody tr{
            display: table;
            border-bottom: 1px #666 solid;
            table-layout: fixed;
            transition: all var(--transform_slowily);
        }
        .my-table tbody tr:hover {
            background-color: #ccc;
            /*color:var(--sub_color);*/
            font-weight: 800;
        }
        .my-table .my-td,
        .my-table .my-th{
            text-align: center;
            font-size: 16px;
            padding-top: 10px;
        }
        .my-table .my-tb{
            position: relative;
            display: block;
            height: 100%;
            /*height: 300px;*/
            overflow-y: scroll;
            border-bottom: 1px solid var(--sub_color);
            border-top: 1px solid var(--sub_color);
        }
        .my-table .my-tr{
            display: table;
            width: 100%;
            height: 40px;
            table-layout: fixed;/*重要  表格固定算法*/
        }
        .my-table .my-tf{
            /*display: block;*/
            bottom: 0;
            border-top: 1px solid var(--sub_color);
            /*background-color: #c7254e;*/
        }
        .inlineBlock{
            display: inline-block;
            margin: 0 5px 0 5px;
        }
        .page-list-box:hover .page-list{
            display: inline-block;
            animation: pageListOut 1s ease-in-out;
            animation-fill-mode: forwards;
        }
        @keyframes  pageListOut{
            from{
                height: 0;
                width: 0;
                opacity: 0;
            }
            to{
                height: 200px;
                width: 80px;
                opacity: 1;
            }
        }
        .rodPage{
            cursor: pointer;
            background-color: var(--sub_color);
            color: #fff;
            padding: 4px;
            border-radius: 2px;
        }
        .page-list-box {
            position: relative;
            cursor: no-drop;
        }
        .page-list-box .page-list{
            display: none;
            /*position: fixed;*/
            position: absolute;
            width: 80px;
            top:50%;
            left:50%;
            transform: translate(-50%,-100%);

            background-color: #4e65c7;
            color: #fff;
            z-index: 10;
            max-height: 200px;
            border-radius: 5px;
            overflow-y: auto;
            transition: all var(--transform_slowily);
        }
        .page-list ul{
            list-style: none;
        }
        .page-list ul li{
            cursor: pointer;
            padding-top: 5px;
            padding-bottom: 10px;
            transition: all var(--transform_slowily);
        }
        .page-list ul li:hover{
            background-color: var(--sub_color);
        }


        .my-table input[type='checkbox']{
            width: 20px;
            height: 20px;
            /*border: 1px solid var(--sub_color);*/
        }
        .my-table input[type='checkbox']:focus{
            border: 0;
            outline: none;
        }
        /*//行操作栏*/
        .tab-operator,
        .operator-btn{
            width: 80px;
            height: 30px;
            font-size: 14px;
            color: #fff;
            cursor: pointer;
            /*margin: 0 10px 0 0px;*/
        }
        .operator-div{
            align-items: center;
        }
        .operator-div div{
            width: 100%;
            height: 100%;
            /*align-items: center;*/
        }
        .operator-div .tab-modify{
            background-color: #4e65c7;
        }
        .operator-div .tab-modify:hover{
            box-shadow: 0 0 10px #4e65c7;
        }
        .operator-div .tab-modify:focus{
            outline: 1px solid #4e65c7;
        }
        .operator-div .tab-remove{
            background-color: #c7254e;
            border: 1px solid #c7254e;
        }
        .operator-div .tab-remove:hover{
            box-shadow:0 0 10px #c7254e;
        }
        .operator-div .tab-remove:focus{
            outline: 1px solid #c7254e;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="my-table-template"></div>
    <!--    <div class="my-table-template">-->
    <!--        <div class="operator-tab">-->
    <!--            <input type="button" class="inlineBlock normal operator-btn" value="添加">-->
    <!--            <input type="button" class="inlineBlock normal operator-btn" value="打印">-->
    <!--            <input type="button" class="inlineBlock normal operator-btn" value="导入">-->
    <!--            <input type="button" class="inlineBlock normal operator-btn" value="导出">-->
    <!--            <input type="button" class="inlineBlock alter operator-btn" value="移除">-->
    <!--            <input type="button" class="inlineBlock msg operator-btn" value="刷新">-->
    <!--        </div>-->
    <!--        <table class="my-table">-->
    <!--        <thead class="my_th">-->
    <!--            <tr class="my-tr">-->
    <!--                <th class="my-th" width="50">-->
    <!--                    <input type="checkbox" name="checkedAll checked">-->
    <!--                </th>-->
    <!--                <th class="my-th" width="50" >序号</th>-->
    <!--                <th class="my-th">学号</th>-->
    <!--                <th class="my-th">姓名</th>-->
    <!--                <th class="my-th">班级</th>-->
    <!--                <th class="my-th">备注</th>-->
    <!--                <th class="my-th">操作</th>-->
    <!--            </tr>-->
    <!--        </thead>-->
    <!--        <tfoot class="my-tf">-->
    <!--            <tr class="my-tr">-->
    <!--                <td class="my-td" width="200">-->
    <!--                   每页-->
    <!--                    <div class="page-list-box inlineBlock">-->
    <!--                        <span id="page-items" style='border: 2px solid #666; border-radius: 5px ;padding: 2px 5px;'>10</span>-->
    <!--                        <div class="page-list">-->
    <!--                            <ul>-->
    <!--                                <li>5</li>-->
    <!--                                <li>10</li>-->
    <!--                                <li>20</li>-->
    <!--                                <li>50</li>-->
    <!--                                <li>100</li>-->
    <!--                            </ul>-->
    <!--                            <script>-->
    <!--                                $("#page-items~.page-list>ul>li").click(function () {-->
    <!--                                        $("#page-items").html($(this).html());-->
    <!--                                });-->
    <!--                                function testPages() {-->

    <!--                                }-->
    <!--                            </script>-->
    <!--                        </div>-->
    <!--                    </div>-->
    <!--&lt;!&ndash;                    <select name="" id="page-pices">&ndash;&gt;-->
    <!--&lt;!&ndash;                        <option value="1">1</option>&ndash;&gt;-->
    <!--&lt;!&ndash;                        <option value="5">5</option>&ndash;&gt;-->
    <!--&lt;!&ndash;                        <option value="10">10</option>&ndash;&gt;-->
    <!--&lt;!&ndash;                        <option value="20">20</option>&ndash;&gt;-->
    <!--&lt;!&ndash;                        <option value="50">50</option>&ndash;&gt;-->
    <!--&lt;!&ndash;                    </select>&ndash;&gt;-->
    <!--                    条/共-->
    <!--                    <span id="pages">10</span>-->
    <!--                    条-->
    <!--                </td>-->
    <!--                <td class="my-td"></td>-->
    <!--                <td class="my-td"></td>-->
    <!--                <td class="my-td"></td>-->
    <!--                <td class="my-td"></td>-->
    <!--                <td class="my-td"></td>-->
    <!--                <td class="my-td" width="200">-->
    <!--                    <div class="inlineBlock rodPage again" onclick="test()">上一页</div>-->
    <!--                    <script>-->
    <!--                        function test() {-->
    <!--                            var _trs = $(".my-table-template").find("table tbody tr");-->
    <!--                            var _tr_len = _trs.length;-->
    <!--                            var ids=new Array();-->
    <!--                            for(let index=0;index<_tr_len;index++){-->
    <!--                                if($(_trs[index]).find("input[type='checkbox']").attr("checked") =="checked"){-->
    <!--                                    ids.push(index);-->
    <!--                                }-->
    <!--                            }-->
    <!--                            console.log(ids);-->
    <!--                        }-->
    <!--                    </script>-->
    <!--                    <div class="inlineBlock page-list-box">-->
    <!--                        <div class="page-list">-->
    <!--                            <ul>-->
    <!--                                <li>1</li>-->
    <!--                            </ul>-->
    <!--                        </div>-->
    <!--                        <span class="inlineBlock">1</span>/<span class="inlineBlock">2</span>-->
    <!--                    </div>-->
    <!--                    <div class="inlineBlock rodPage after">下一页</div>-->
    <!--                </td>-->
    <!--            </tr>-->
    <!--        </tfoot>-->
    <!--        <tbody class="my-tb">-->
    <!--            <tr class="my-tr">-->
    <!--                <td class="my-td" width="50">-->
    <!--                    <input type="checkbox" name="checked">-->
    <!--                </td>-->
    <!--                <td class="my-td" width="50">1</td>-->
    <!--                <td class="my-td">188207201</td>-->
    <!--                <td class="my-td">张三</td>-->
    <!--                <td class="my-td">1882072</td>-->
    <!--                <td class="my-td">hello</td>-->
    <!--                <td class="my-td operator-div">-->
    <!--                    <div>-->
    <!--                        <input type="button" value="修改" class="tab-modify tab-operator">-->
    <!--                        <input type="button" value="移除" class="tab-remove tab-operator">-->
    <!--                    </div>-->
    <!--                </td>-->
    <!--            </tr>-->
    <!--            <tr class="my-tr">-->
    <!--                <td class="my-td" width="50">-->
    <!--                    <input type="checkbox" name="checked">-->
    <!--                </td>-->
    <!--                <td class="my-td" width="50">2</td>-->
    <!--                <td class="my-td">188207201</td>-->
    <!--                <td class="my-td">李四</td>-->
    <!--                <td class="my-td">1882072</td>-->
    <!--                <td class="my-td">wu</td>-->
    <!--                <td class="my-td operator-div">-->
    <!--                    <div>-->
    <!--                        <input type="button" value="修改" class="tab-modify tab-operator">-->
    <!--                        <input type="button" value="移除" class="tab-remove tab-operator">-->
    <!--                    </div>-->
    <!--                </td>-->
    <!--            </tr>-->
    <!--            <tr class="my-tr">-->
    <!--                <td class="my-td" width="50">-->
    <!--                    <input type="checkbox" name="checked">-->
    <!--                </td>-->
    <!--                <td class="my-td" width="50">3</td>-->
    <!--                <td class="my-td">188207201</td>-->
    <!--                <td class="my-td">王五</td>-->
    <!--                <td class="my-td">1882072</td>-->
    <!--                <td class="my-td">ok</td>-->
    <!--                <td class="my-td operator-div">-->
    <!--                    <div>-->
    <!--                        <input type="button" value="修改" class="tab-modify tab-operator">-->
    <!--                        <input type="button" value="移除" class="tab-remove tab-operator">-->
    <!--                    </div>-->
    <!--                </td>-->
    <!--            </tr>-->
    <!--        </tbody>-->
    <!--    </table>-->
    <!--    </div>-->
</div>
<%--//弹窗--%>
<script>
    (function ($) {
        $.show_tip = function (arg) {
            this.msg = "不知道为什么，忽然就弹出了一条信息";
            this.location = 1;
            this.parentNode = 'body';
            this.css = [];//[{cssName:'',cssValue:''}]
            this.showFun =function (arg) {
                var uuid = (Math.random()*10000000).toString(16).substr(0,4)+'-'+(new Date()).getTime()+'-'+Math.random().toString().substr(2,5);
                if(typeof (this.parentNode) == "undefined" || typeof ($(this.parentNode))=="undefined"){
                    // console.log($('body').find(".my_tip").length)
                    //
                    // if($('body').find(".my_tip").length<=0)
                    $('body').prepend("<div class='my_tip' id='"+uuid+"'><div><span>"+this.msg+"</span></div></div>");
                }else{
                    // console.log($(parentNode).find(".my_tip").length)
                    // if($(parentNode).find(".my_tip").length<=0)
                    $(this.parentNode).prepend("<div class='my_tip' id='"+uuid+"'><div><span>"+this.msg+"</span></div></div>");
                }

                if(typeof (this.location) =="undefined"|| this.location==="top" || this.location==="" || this.location ==1){
                    $(".my_tip").css("top",'10%');
                }else if(this.location === 'top'|| this.location ==2){
                    $(".my_tip").css("center",'50%');
                }else if(this.location === 'bottom'|| this.location ==3){
                    $(".my_tip").css("top",'90%');
                }else{
                    $(".my_tip").css("top",'10%');
                }

                // if(typeof (this.msg) =="undefined"|| this.msg===""){
                //     $(".my_tip").html("不知道为什么，忽然就弹出了一条信息");
                // }else{
                $(".my_tip").html(this.msg);
                // }

                if(typeof (this.css) != "undefined") {
                    for(let cssIndex = 0; cssIndex < this.css.length; cssIndex++) {
                        $(".my_tip").css(this.css[cssIndex].cssName, this.css[cssIndex].cssValue);
                    }
                }

                $(".my_tip").css("display","inline-block");

                $(".my_tip").animate({
                    opacity: 1,
                    top: '-=2%'
                    // width: my_tipW,
                    // left: my_left - my_tipW/2
                },100);
                $(".my_tip").animate({transform: 'translate(-50%,-50%) scale(1)',top:'+=4%'},800);
                $(".my_tip").animate({
                    opacity: 0,
                    top: "-=10%"
                    // dispaly: 'none',
                    // width: 0,
                    // left: my_left + my_tipW
                }, {duration:500,complete:function () {
                        $('#'+uuid).detach();

                    }});
            };
            this.setMsg = function (val) {
                if(typeof (val) != "undefined")
                    this.msg = val;
            }
            this.getMsg = function () {
                return this.msg;
            }
            this.setLocation = function (val) {
                if(typeof (val) != "undefined")
                    this.location = val;
            }
            this.setLocation = function () {
                return this.location;
            }
            this.setParentNode = function (val) {
                if(typeof (val) != "undefined") this.parentNode = val;
            }
            this.getParentNode = function () {
                return this.parentNode;
            }
            this.setCss = function (val) {
                if(typeof (val) != "undefined") this.css = val;
            }
            this.getCss = function () {
                return this.css;
            }
        };

    })(jQuery);


    var my_tip = {
        tip: function show(msg,location,parentNode,css) {
            var action =new $.show_tip();
            action.setMsg(msg);
            action.setLocation( location);
            action.setParentNode(parentNode);
            action.setCss(css);
            action.showFun();
        }
    }
</script>

<!--操作表格-->
<script>
    //(id---value)(Dom元素id选择器映射值)
    //|page-items--------分页每页页数|
    //|total-------------全部记录条数|
    //|checkedAll--------表格头部的全选框|
    //|currentPage-------当前页码|
    //|totalPage---------总页数|
    //|data-grid-elem----待绑定数据的元素id（tbady）|
    //|pageNumber--------待选页码|
    //|pageAgo-----------上一页
    //|pageAfter---------下一页
    // var pagevo={
    //     indexPage:0,//当前页码
    //         total:0,//总记录数
    //         pageItem:5,//每页记录数
    //         msg:"没有记录",//提示信息
    //         data:[{"note":"","middle":"","phone":"","userNo":"","id":"","userName":"","class":""}],//数据
    // };
    var dataGrid = {
        pagevo:{
            indexPage:0,//当前页码
            total:0,//总记录数
            pageItem:5,//每页记录数
            msg:"没有记录",//提示信息
            data:[{"note":"","middle":"","phone":"","userNo":"","id":"","userName":"","class":""}],//数据
        },
        columnTable:{},
        grid:function (elem,obj) {
            if(typeof (elem) == "undefined"){
                console.error("...待绑定数据的html元素为空，终止计划...");
                return -1;
            }
            if(obj.columns.length<1){
                console.error("...没有绑定任何数据到表格，计划终止....");
                return -2;
            }
            //清空当前表格
            $(elem).html("");
            if(typeof (obj.ajac.url)=="undefined"){
                console.error("没有请求参数，计划终止...");
                return -3;
            }

            buildElem(elem,obj);

            ajaxData(elem,obj);

            addEvent(elem,obj);
        },
        getSelection: function (elem,columnIndex) {
            let _trs = $(elem).find("table tbody tr");
            let _tr_len = _trs.length;
            let values=new Array();

            if(typeof (columnIndex) != "undefined") {
                let _th_len = $($(elem).find("table thead th")).length;
                if (parseInt(columnIndex) >= _th_len || parseInt(columnIndex) < 0) {
                    console.error("无法获取到索引为[" + columnIndex + "]的项...");
                }
            }
            for(let index=0;index<_tr_len;index++){
                if($(_trs[index]).find("input[type='checkbox']").prop("checked") == true){
                    if(typeof (columnIndex) != "undefined"){
                        let _val_td = $( $($(elem).find("tbody tr")[index]).find("td")[columnIndex] ).html();
                        values.push(_val_td);
                    }else {
                        values.push(index);
                    }
                }
            }
            return values;
        },
    }
    function ajaxData(elem,obj) {
        var url = obj.ajac.url ;
        var method = obj.ajac.method;
        var data = getAjaxValue(elem); //obj.ajac.data;
        // console.log(data);
        var sendBefore = function (){obj.ajac.beforeSend();};
        var overSend = function(){obj.ajac.overSend();};
        $.ajax({
            method: method,
            url:url,
            data: data,
            dataType:"json",
            beforeSend:function(XMLHttpRequest){
                sendBefore();
            },
            success: function (data) {
                // console.log(data);
                overSend();
                // pagevo.data      = data.list;
                // pagevo.total     = data.total;
                // pagevo.indexPage = data.indexPage;
                // pagevo.pageItem  = data.pageItem;
                // pagevo.msg       = data.msg;
                var values={
                    indexPage:data.indexPage,//当前页码
                    total:    data.total,//总记录数
                    pageItem: data.pageItem,//每页记录数
                    msg:      data.msg,//提示信息
                    data:     data.list,//数据
                };
                buildData(elem,obj,values);
            },
            error:function () {
                // pagevo.msg = "<font style='color: crimson;font-size: 14px;'>连接超时</font>";
            }
        })
    }
    function buildElem(elem,obj){
        $(elem).html("");
        var _table_html = "<div class='my-table-template'>";
        _table_html+="<div class='operator-tab'>";

        //添加操作按钮
        for (let i = 0;i<obj.btns.length;i++) {
            _table_html += "<input type='button' ";
            let type = 'normal';
            if (typeof (obj.btns[i].btn_style) != "undefined") {
                type = obj.btns[i].btn_style;
            }

            _table_html += "class='inlineBlock operator-btn " + type + " ";

            if (typeof (obj.btns[i].icon) != "undefined") {
                _table_html += " " + obj.btns[i].icon + " ";
            }
            if(typeof (obj.btns[i].name) != "undefined"){
                _table_html += " "+obj.btns[i].name + " ";
            }else{
                _table_html +=" btn_"+i+" ";
            }
            _table_html += "' ";
            if (typeof (obj.btns[i].txt) == "undefined") {
                console.info("warning:表格上的第" + i + "个按钮没有文本");
                _table_html += "value=''>";
            } else {
                _table_html += "value='"+obj.btns[i].txt+"'>";
            }
        }

        _table_html += "</div><table class='my-table'><thead class='my_th'><tr class='my-tr'><th class='my-th' width='5'>" ;
        if(typeof (obj.multi_select) != "undefined" && (obj.multi_select == true || obj.multi_select ==false)) {
            _table_html += obj.multi_select ? "<input type='checkbox' name='checked' class='checkedAll'>" : "";
        }
        _table_html += "</th>";
        if(typeof (obj.columnId) != "undefined"){
            _table_html +=  "<th class='my-th' align='center' width='5' "+(obj.columnId?"":"hidden")+">序号</th>";
        }
        //添加表格标题行
        for (let i = 0;i<obj.columns.length;i++) {
            // <th class="my-th" width="50">序号</th>
            _table_html += "<th ";
            _table_html = concat(" align",obj.columns[i].align,_table_html);
            // if(typeof (obj.columns[i].align) !='undefined'){
            //     _table_html +=" align='"+obj.columns[i].align+"' ";
            // }
            _table_html = concat(" width",obj.columns[i].width,_table_html);
            // if(typeof (obj.columns[i].width) != "undefined"){
            //     _table_html += "width='"+obj.columns[i].width+"'";
            // }
            // _table_html += " class='my-th ";
            _table_html = concat(" class","my-th "+obj.columns[i].fontIcon,_table_html);
            // if(typeof(obj.columns[i].font) != "undefined"){
            //     _table_html += obj.columns[i].font;
            // }
            // _table_html += "' ";
            _table_html = concat(" hidden",obj.columns[i].hidden,_table_html);
            _table_html += ">"+obj.columns[i].title+"</th>";
        }
        _table_html +=  "            </tr>" +
            "            </thead>" +
            "<tbody class='my-tb data-grid-elem'></tbody>" +
            "            <tfoot class='my-tf'>" +
            "            <tr class='my-tr'>" +
            "                <td class='my-td' align='left'>" +// width='200'
            "                    每页" +
            "<div class='page-list-box inlineBlock pagenum'>"+
            "<span class='page-items' style='border: 2px solid #666; border-radius: 5px ;padding: 2px 5px;'>0</span>"+
            "<div class='page-list'><ul>";
        //填充分页每页页数选项
        for(let pageIndex=0;pageIndex < obj.pages.length;pageIndex++){
            _table_html += "<li>"+obj.pages[pageIndex]+"</li>";
        }
        _table_html += "</ul></div></div>";

        _table_html += "条/共" +
            "   <span class='total'>0</span>" +
            "条" +
            "</td>" ;
        //填充底部行中间缺少的单元格
        var _td_len =obj.pages.length-obj.columnId?2:1;
        for (let i=0;i < _td_len;i++){
            _table_html += "<td class='my-td'></td>";
        }
        _table_html += "<td class='my-td' align='right'>" +// width='200'
            "<div class='inlineBlock rodPage again pageAgo'>上一页</div>" +
            "<div class='inlineBlock page-list-box pageNO'>"+
            "<div class='page-list'>"+
            "<ul class='pageNumber'>"+
            // "<li>1</li>";
            "</ul>"+
            "</div>"+
            "<span class='inlineBlock currentPage'>1</span>/<span class='inlineBlock totalPage'>0</span>"+
            "</div>"+
            "<div class='inlineBlock rodPage after pageAfter'>下一页</div>" +
            "</td>" +
            "</tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

        $(elem).html(_table_html);
    }

    function clickBtn(e) {
        e.myclick();
    }

    function addEvent(elem,obj) {
        var _nav_btns_len = obj.btns.length;
        for (var _nav_btns_index = 0;_nav_btns_index < _nav_btns_len;_nav_btns_index++){
            console.log($(elem).find("."+obj.btns[_nav_btns_index].name));
            // $( $(elem).find("."+obj.btns[_nav_btns_index].name) ).click(function () {
            //     clickBtn(obj.btns[_nav_btns_index]);
            //
            // })
            $( $(elem).find("."+obj.btns[_nav_btns_index].name) ).on("click",obj.btns[_nav_btns_index].myclick());
        }

        //为全选按钮绑定事件
        $( $(elem).find("table>thead input[type='checkbox']") ).click(function () {
            changeAllCheckbox(elem,$(this).attr("checked"),"showTip");
        });
        //选择每页记录数
        $($(elem).find(".page-items~.page-list>ul>li")).click(function () {
            // obj.ajac.pageItem = parseInt($(this).html());
            $($(elem).find(".page-items")[0]).html($(this).html());
            ajaxData(elem,obj);
        });

        //上一页
        $($(elem).find(".pageAgo")).click(function () {
            let _current_page = parseInt($($(elem).find(".currentPage")[0]).html())
            if(_current_page > 1 ){
                $($(elem).find(".currentPage")[0]).html( parseInt( _current_page ) - 1);
            }else {
                my_tip.tip("<font style='color:#fff;font-weight: 400;'>已经到顶了，不能再点了！</font>",2,$(elem),[{cssName:'background-color',cssValue:'crimson'}]);
            }
            ajaxData(elem,obj);
        });
        //下一页
        $($(elem).find(".pageAfter")).click(function () {
            let _max_page     = parseInt($($(elem).find(".totalPage")[0]).html());
            let _current_page = parseInt($($(elem).find(".currentPage")[0]).html())
            if(_current_page < _max_page ){
                $($(elem).find(".currentPage")[0]).html( parseInt( _current_page ) + 1);
            }else {
                my_tip.tip("<font style='color:#fff;font-weight: 400;'>踩到底线了</font>",2,$(elem),[{cssName:'background-color',cssValue:'crimson'}]);
            }
            ajaxData(elem,obj);
        });

        var _nav_btns_len = obj.btns.length;
        for (var _nav_btns_index = 0;_nav_btns_index < _nav_btns_len;_nav_btns_index++){
            console.log($(elem).find("."+obj.btns[_nav_btns_index].name));
            $( $(elem).find("."+obj.btns[_nav_btns_index].name)[0] ).click(
                obj.btns[_nav_btns_index].myclick()
            )
        }
    }

    //数据绑定
    //(id---value)(Dom元素id选择器映射值)
    //|page-items--------分页每页页数|
    //|total-------------全部记录条数|
    //|checkedAll--------表格头部的全选框|
    //|currentPage-------当前页码|
    //|totalPage---------总页数|
    //|data-grid-elem----待绑定数据的元素id（tbady）|
    //|pageNumber--------待选页码|
    //|pageAgo-----------上一页|
    //|pageAfter---------下一页|
    function buildData(elem,obj,values) {
        if(typeof (values.pageItem) =="undefined" || values.pageItem <= 0 ){
            console.error("...数据加载失败(每页记录数只能是正整数),计划终止...");
            return -1;
        }
        var totalPages = ((values.total % parseInt( values.pageItem) ) > 0 ? 1 : 0) + values.total / parseInt(values.pageItem) ;

        // console.log($($(elem).find(".page-items")[0]));
        // console.log($(elem).find(".page-items")[0]);
        // console.log($(elem).find(".page-items"));
        // console.log($($(elem).find(".page-items")));
        $($(elem).find(".page-items")[0]).html(values.pageItem);
        // console.log(values);
        // console.log("bbb"+values.total);
        // console.log($("#total"));
        $($(elem).find(".total")).html(""+values.total);
        $($(elem).find(".currentPage")).html(""+values.indexPage);
        $($(elem).find(".totalPage")).html(totalPages);

        $($(elem).find(".pageNumber")).html("");
        for (let i=1;i<totalPages+1;i++){
            $( $(elem).find(".pageNumber")).append("<li>"+i+"</li>");
        }


        $($(elem).find(".data-grid-elem")).html("");
        for (let rowIndex=0; rowIndex < values.data.length; rowIndex++) {
            let row = "<tr class='my-tr'>";
            row += "<td class='my-td' width='5' ><input type='checkbox' align='center' name='checked'></td>";
            if(typeof (obj.columnId) != "undefined"){
                row +=  "<td class='my-td' width='5' align='center'"+(obj.columnId?"":"hidden")+">"+(rowIndex+1)+"</td>";
            }
            row += "";
            for(let cellIndex=0; cellIndex < obj.columns.length; cellIndex++) {
                let cell = "<td class='my-td' ";
                cell = concat(" align" ,obj.columns[cellIndex].align,cell);
                cell = concat(" width" ,obj.columns[cellIndex].width,cell);
                cell += obj.columns[cellIndex].hidden?" hidden":"";
                cell += ">" +getvalue( values.data[rowIndex], obj.columns[cellIndex].name )+"</td>";
                // console.log(values.data[rowIndex] );
                row += cell;
            }
            row += "</tr>";
            $($(elem).find(".data-grid-elem")[0]).append(row);
        }

        //选择页码
        $($(elem).find(".pageNO>.page-list>ul>li")).click(function () {
            // obj.ajac.pageItem = parseInt($(this).html());
            $($(elem).find(".currentPage")[0]).html($(this).html());
            ajaxData(elem,obj);
        });

        //为每一个tobody下的多选框绑定事件
        $($(elem).find("table>tbody input[type='checkbox']")).click(function () {
            judgeCheckbox(elem);
        });

        // 重新刷新后清除全选状态
        changeAllCheckbox(elem);

        // var _nav_btns_len = obj.btns.length;
        // for (var _nav_btns_index = 0;_nav_btns_index < _nav_btns_len;_nav_btns_index++){
        //     console.log($(elem).find("."+obj.btns[_nav_btns_index].name));
        //     $( $(elem).find("."+obj.btns[_nav_btns_index].name) ).click(function () {
        //         obj.btns[_nav_btns_index].myclick;
        //     })
        // }
    }

    function getvalue(content,key){
        //1、使用eval方法
        // var eValue=eval('content.'+key);
        //2、遍历Json串获取其属性
        // for(var item in content){
        //     if(item==key){  //item 表示Json串中的属性，如'name'
        //         var jValue=content[item];//key所对应的value
        //         alert(jValue);
        //     }
        // }
        //3、直接获取
        return content[''+key+''];
    }
    //key:键、value:值、str：当前字符串
    //例如：<tr name="tr_name">,key为name，value为tr_name，str为"<tr ",所有方法返回"<tr name='tr_name'>"
    function concat(key,value,str) {
        if(typeof (value)!='undefined'&& value!=""){
            str += key +"='"+value+"' ";
        }
        return str;
    }
    function getAjaxValue(elem) {
        return  {
            pageItem: $($(elem).find(".page-items")[0]).html(),//每页记录数
            indexPage:$($(elem).find(".currentPage")[0]).html(),//当前页码
            total:    0,//总记录数
            msg:      "",//提示信息
            data:     [],//数据
        };
    }
    function judgeCheckbox(elem) {
        //判断表格中全部行是否全选中
        let checkboxs = $(elem).find("table>tbody input[type='checkbox']");
        let len = checkboxs.length;
        for(let index=0;index<len;index++){
            if($(checkboxs[index]).attr("checked") != "checked"){
                $( $(elem).find("table>thead input[type='checkbox']") ).attr("checked",false);
                return false;
            }
        }
        return true;
    }
    //全选、全不选
    function changeAllCheckbox(elem,changeto,operator) {
        // console.log(changeto);
        // if(typeof (elem) == "undefined" || typeof (changeto) !="undefined" || changeto != "checked"){
        //     console.error("尝试改变表格中的行选择状态，但传入参数不符合规则，终止...");
        //     return -1;
        // }

        let checkboxs = $(elem).find("table>tbody input[type='checkbox']");
        let len = checkboxs.length;
        // console.log(len);
        for(let index=0;index<len;index++){
            if(typeof (changeto) == "undefined"){
                $(checkboxs[index]).removeAttr("checked");
            }else if(changeto == "checked"){
                $(checkboxs[index]).attr("checked", changeto);
            }else{
                console.error("尝试改变表格中的行选择状态，但传入参数不符合规则，终止...");
                return -1;
            }
        }
        if(typeof (operator) != "undefined")
            my_tip.tip(typeof (changeto) == "undefined"?"已取消全选" :"已全选" +  changeto);
    }


</script>

<!--定义表格的方式-->
<script>
    var my_table = {
        ajac: {
            url: "${global_url}test/getList",//请求地址
            method: "post",//请求方法
            data: {
                indexPage:0,//当前页码
                total:0,//总记录数
                pageItem:5,//每页记录数
                msg:"没有记录",//提示信息
                data:[{"note":"","middle":"","phone":"","userNo":"","id":"","userName":"","class":""}]
            },//数据},//请求条件
            dataType: "json",
            beforeSend:function () {
                // my_layer.open();
            },
            overSend:function () {
                // my_layer.close();
            }
        },
        columnId:true,//显示列表序号（自增）
        columns:[
            {title:"用户编号", name:"id",       width:"10",hidden:true,align:"center",fontIcon:"no"},
            {title:"姓名",     name:"userName",width:"10",hidden:false,align:"center"},
            {title:"学号",     name:"userNo",  width:"20",hidden:false,align:"center"},
            {title:"电话号码", name:"phone",   width:"20",hidden:false,align:"center"},
            {title:"班级",     name:"class",   width:"10",hidden:false,align:"center"},
            {title:"是否合格", name:"middle",  width:"10",hidden:false,align:"center"},
            {title:"备注",     name:"note",   width:"20",hidden:false,align:"center"},
        ],//数据集合
        multi_select:true,//是否多选
        pages:[5,10,20,50,100],//每页多少天，选项
        btns:[
            {
                name:"add",
                txt:"添加",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                myclick: function () {
                    addRow();
                }
            },
            {
                name:"print",
                txt:"打印",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                myclick:function () {
                    printData();
                }
            },
            {
                name:"import",
                txt:"导入",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                myclick:function () {
                    importData();
                }
            },
            {
                name:"export",
                txt:"导出",
                icon:"add-icon",
                btn_style:"normal",//normal、alter、msg
                myclick:function () {
                    exportData();
                }
            },
            {
                name:"remove",
                txt:"移除",
                icon:"add-icon",
                btn_style:"alter",//normal、alter、msg
                myclick:function () {

                }
            },
            {
                name:"reload",
                txt:"刷新",
                icon:"add-icon",
                btn_style:"msg",//normal、alter、msg
                myclick:function () {
                    reloadData();
                }
            }
        ],
        getSelectRowId:function getRow() {
            // 获取选中的行id集合
        },
        addRows:function add(rows) {
            //异步请求，提交一行数据，并刷新
        },
        cleanTable:function clean() {
            //清空表格数据
        },
        writeTable:function write() {
            //填充表格
        },
        grid: function (elem) {
            //绑定元素
            my_table:function table() {

            }
        }
    }
    function printData() {
        my_tip.tip("打印")
    }
    function addRow() {
        my_tip.tip("添加")
    }
    function exportData() {
        my_tip.tip("导出")
    }
    function importData() {
        my_tip.tip("导入")
    }
    function removeRow(ids) {
        my_tip.tip("移除")
    }
    function reloadData() {
        my_tip.tip("刷新")
    }

    //数据绑定
    // <div class="my-table-template">
    dataGrid.grid($(".content"),my_table);
    // dataGrid.grid($(".content1"),my_table);
    // dataGrid.grid($(".content2"),my_table);
    // dataGrid.grid($(".content3"),my_table);
</script>
</body>
</html>
