
// <%--提示框--%>
(function ($) {
    $.show_tip = function (arg) {
        this.msg = "不知道为什么，忽然就弹出了一条信息";
        this.location = 1;
        this.parentNode = 'body';
        this.css = [];//[{cssName:'',cssValue:''}]
        this.showFun =function (arg) {
            let uuid = (Math.random()*10000000).toString(16).substr(0,4)+'-'+(new Date()).getTime()+'-'+Math.random().toString().substr(2,5);
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


//封装ajax，每次ajax自动打包token提交
var tokenUtil = {
    saveToken:function (token,times) {
        // 本地存入token
        window.localStorage.setItem('access_token',token);
    },
    removeToken:function () {
        window.localStorage.removeItem("access_token");
    },
    getToken:function () {
        return window.localStorage.getItem("access_token");
    }
}
var HttpRequest = function (options) {
    var defaults = {
        type: 'get',
        headers: {},
        data: {},
        dataType: 'json',
        async: true,
        cache: false,
        beforeSend: null,
        success: null,
        complete: null
    };
    var o = $.extend({}, defaults, options);
    $.ajax({
        url: o.url,
        type: o.type,
        headers: {
            'Content-Type': o.contentType,
            'access_token': o.token
        },
        data: o.data,
        dataType: o.dataType,
        async: o.async,
        beforeSend: function () {
            o.beforeSend && o.beforeSend();
        },
        success: function (res) {
            o.success && o.success(res);
        },
        complete: function () {
            o.complete && o.complete();
        }
    });
}

var normalHttp = function (options) {
    // 登入页无需携带token
    // 后台如果要求 Content-Type
    if (options.type == 'post') {
        options.contentType = 'application/x-www-form-urlencoded';
    }
    HttpRequest(options);
}
var my_ajax = function (options) {
    if (options.type == 'post') {
        options.contentType = 'application/x-www-form-urlencoded';
    }
    // 每次请求携带token
    options.token = localStorage.getItem('access_token');
    HttpRequest(options);
}



var my_tip = {
        tip: function show(msg,location,parentNode,css) {
            let action =new $.show_tip();
            action.setMsg(msg);
            action.setLocation( location);
            action.setParentNode(parentNode);
            action.setCss(css);
            action.showFun();
        }
    };




<!--操作表格==========================================================================-->
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
    dataCache:{},
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
    reload:function (elem,obj) {
        ajaxData(elem,obj);
    }
}
function ajaxData(elem,obj) {
    let url = obj.ajac.url ;
    let method = obj.ajac.method;
    let data = getAjaxValue(elem); //obj.ajac.data;
    $.extend(true,data,obj.ajac.data);
    // console.log(data);
    let sendBefore = function (){obj.ajac.beforeSend();};
    let overSend = function(){obj.ajac.overSend();};
    $.ajax({
        method: method,
        url:url,
        data: data,
        dataType:"json",
        beforeSend:function(XMLHttpRequest){
            loading_cir.loading(elem);
            sendBefore();
        },
        success: function (data) {
            loading_cir.loaded(elem);
            // console.log(data);
            overSend();
            // pagevo.data      = data.list;
            // pagevo.total     = data.total;
            // pagevo.indexPage = data.indexPage;
            // pagevo.pageItem  = data.pageItem;
            // pagevo.msg       = data.msg;
            let values={
                indexPage:data.indexPage,//当前页码
                total:    data.total,//总记录数
                pageItem: data.pageItem,//每页记录数
                msg:      data.msg,//提示信息
                data:     data.list,//数据
                totalPage:data.totalPage,
            };
            buildData(elem,obj,data);
        },
        error:function () {
            // pagevo.msg = "<font style='color: crimson;font-size: 14px;'>连接超时</font>";
        }
    })
}
function buildElem(elem,obj){
    $(elem).html("");
    let _table_html = "<div class='my-table-template'>";
    _table_html+="<div class='operator-tab'>";

    //添加操作按钮
    if(typeof(obj.btns) != "undefined") {
        for (let i = 0; i < obj.btns.length; i++) {
            _table_html += "<input type='button' ";
            let type = 'normal';
            if (typeof (obj.btns[i].btn_style) != "undefined") {
                type = obj.btns[i].btn_style;
            }

            _table_html += "class='inlineBlock operator-btn " + type + " ";

            if (typeof (obj.btns[i].icon) != "undefined") {
                _table_html += " " + obj.btns[i].icon + " ";
            }
            if (typeof (obj.btns[i].name) != "undefined") {
                _table_html += " " + obj.btns[i].name + " ";
            } else {
                _table_html += " btn_" + i + " ";
            }
            _table_html += "' ";

            if(typeof (obj.btns[i].id)!="undefined"){
                _table_html += " id='"+obj.btns[i].id+"' ";
            }
            if (typeof (obj.btns[i].txt) == "undefined") {
                console.info("warning:表格上的第" + i + "个按钮没有文本");
                _table_html += "value=''>";
            } else {
                _table_html += "value='" + obj.btns[i].txt + "'>";
            }
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
        "            <tr class='my-tr'>"+
        "                <td class='my-td' colspan='" +
        obj.columns.length+ "'>" +
        "<div class='inlineBlock' style='float: left;'>" +// width='200'
        "                    每页" +
        "<div class='page-list-box inlineBlock pagenum'>"+
        "<span class='page-items' style='border: 2px solid #666; border-radius: 5px ;padding: 2px 5px;'>*</span>"+
        "<div class='page-list'><ul>";
    //填充分页每页页数选项
    for(let pageIndex=0;pageIndex < obj.pages.length;pageIndex++){
        _table_html += "<li>"+obj.pages[pageIndex]+"</li>";
    }
    _table_html += "</ul></div></div>";

    _table_html += "条/共" +
        "   <span class='total'>0</span>" +
        "条" +
        "</div>" ;
    //填充底部行中间缺少的单元格
    // let _td_len =obj.pages.length-obj.columnId?2:1;
    // for (let i=0;i < _td_len;i++){
    //     _table_html += "<td class='my-td'></td>";
    // }
    _table_html += "<div class='inlineBlock' style='float: right;'>" +// width='200'
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
        "</div></td>" +
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

    //选择每页记录数
    $($(elem).find(".page-items~.page-list>ul>li")).click(function () {
        // obj.ajac.pageItem = parseInt($(this).html());
        $($(elem).find(".page-items")[0]).html($(this).html());
        //重置页码为第一页
        $($(elem).find(".currentPage")[0]).html("1");
        ajaxData(elem,obj);
    });

    //上一页
    $($(elem).find(".pageAgo")).click(function () {
        let _current_page = parseInt($($(elem).find(".currentPage")[0]).html())
        if(_current_page > 1 ){
            $($(elem).find(".currentPage")[0]).html( parseInt( _current_page ) - 1);
            ajaxData(elem,obj);
        }else {
            my_tip.tip("<font style='color:#fff;font-weight: 400;'>已经到顶了，不能再点了！</font>",2,$(elem),[{cssName:'background-color',cssValue:'crimson'}]);
        }
    });
    //下一页
    $($(elem).find(".pageAfter")).click(function () {
        let _max_page     = parseInt($($(elem).find(".totalPage")[0]).html());
        let _current_page = parseInt($($(elem).find(".currentPage")[0]).html())
        if(_current_page < _max_page ){
            $($(elem).find(".currentPage")[0]).html( parseInt( _current_page ) + 1);
            ajaxData(elem,obj);
        }else {
            my_tip.tip("<font style='color:#fff;font-weight: 400;'>踩到底线了</font>",2,$(elem),[{cssName:'background-color',cssValue:'crimson'}]);
        }
    });

    // if(typeof (obj.btns) != "undefined") {
    //     let _nav_btns_len = obj.btns.length;
    //     for (let _nav_btns_index = 0; _nav_btns_index < _nav_btns_len; _nav_btns_index++) {
    //         console.log($(elem).find("." + obj.btns[_nav_btns_index].name));
    //         $($(elem).find("." + obj.btns[_nav_btns_index].name)[0]).click(
    //             obj.btns[_nav_btns_index].myclick()
    //         )
    //     }
    // }
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
    // if(typeof (values.pageItem) =="undefined" || values.pageItem <= 0 ){
    //     console.error("...数据加载失败(每页记录数只能是正整数),计划终止...");
    //     return -1;
    // }
    //var totalPages = ( (values.total % parseInt( values.pageItem) ) > 0 ? 1 : 0) + values.total / parseInt(values.pageItem)
    $($(elem).find(".page-items")[0]).html(values.pageItem>0?values.pageItem:"-");
    $($(elem).find(".total")).html(""+values.total);
    $($(elem).find(".currentPage")).html(""+values.indexPage);
    $($(elem).find(".totalPage")).html(""+values.totalPage);

    $($(elem).find(".pageNumber")).html("");
    for (let i=1;i < values.totalPage + 1;i++){
        $( $(elem).find(".pageNumber")).append("<li>"+i+"</li>");
    }


    $($(elem).find(".data-grid-elem")).html("");
    // console.log(values)
    for (let rowIndex=0; rowIndex < values.list.length; rowIndex++) {
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
            cell += ">" +getvalue( values.list[rowIndex], obj.columns[cellIndex].name )+"</td>";
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

    //为全选按钮绑定事件
    $( $(elem).find("table>thead input[type='checkbox']") ).click(function () {
        changeAllCheckbox(elem,$(this).prop("checked"),"showTip");
    });
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
    pageItems = $($(elem).find(".page-items")[0]).html();
    return  {
        pageItem: isNaN(pageItems)?0:pageItems,//每页记录数
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
        if($(checkboxs[index]).prop("checked") != true){
            $( $(elem).find("table>thead input[type='checkbox']") ).prop("checked",false);
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
            $(checkboxs[index]).prop("checked",false);
        }else if(changeto == true || changeto == false){
            $(checkboxs[index]).prop("checked",changeto);
        }else{
            console.error("尝试改变表格中的行选择状态，但传入参数不符合规则，终止...");
            return -1;
        }
    }
    if(typeof (operator) != "undefined")
        my_tip.tip(typeof (changeto) == "undefined"?"已取消全选" :"已全选");
}


////////////////////////////////////////////////////////////////////////////////////////////////
//大弹窗
$(".msg-content .determine").click(function () {
    closeMessage();
});
$(".msg-content .cancen").click(function () {
    closeMessage();
});
function showMessage_myLayer(msg,u) {
    let height = $(".msg-content").css("height");
    $(".msg-content .msg-body .mb_revise .icon").css("background","url('"+
        (typeof(u)!="undefined" &&  u !==""? u:"http://localhost:8080/nchkkjxy/pic/login/忘记密码.png")+
        "') no-repeat center");
    // console.log(u);
    $(".msg-content .msg-body .mb_revise .icon").css("background-size","100% 100%");
    // console.log($(".msg-content .msg-body .mb_revise .icon").css("background"));
    $("body>div").css("opacity","0.3");
    $("body>div").css("pointer-events","none");
    $(".msg-content").css("opacity","1");
    $(".msg-content").css("pointer-events","painted");
    $(".msg-content .msg-txt").html(msg);
    $(".msg-content").css("height",0);
    $(".msg-content").css("display","block");
    $(".msg-content").css("height",height);

}

function closeMessage() {
    let height = $(".msg-content").css("height");
    $(".msg-content").css("height",0);
    $("body>div").css("opacity","1");
    $("body>div").css("pointer-events","painted");
    $(".msg-content").css("display","none");
    $(".msg-content").css("height",height);
    $(".msg-content").css("pointer-events","painted");
}





///小提示
(function ($) {
    $.show_tip = function (arg) {
        this.msg = "不知道为什么，忽然就弹出了一条信息";
        this.location = 1;
        this.parentNode = 'body';
        this.css = [];//[{cssName:'',cssValue:''}]
        this.showFun =function (arg) {
            let uuid = (Math.random()*10000000).toString(16).substr(0,4)+'-'+(new Date()).getTime()+'-'+Math.random().toString().substr(2,5);
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

            if(typeof (this.css) !== "undefined") {
                for (let cssIndex = 0; cssIndex < this.css.length; cssIndex++) {
                    $(".my_tip").css(this.css.cssName, this.css.cssValue);
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
        let action =new $.show_tip();
        action.setMsg(msg);
        action.setLocation( location);
        action.setParentNode(parentNode);
        action.setCss(css);
        action.showFun();
    }
}



///////////////////////////////////////////////////////////////////////////////////
//加载等待动画：浅绿色大王花
var my_layer = {
    open: function wait() {
        $("body> div").css("opacity", "0.3");
        $("body> div").css("pointer-events", "none");
        $(".waitting-layer").css("opacity", "1");
        $(".waitting-layer").css("display", "inline-block");
    },
    close: function closeLayer() {
        $("body> div").css("opacity", "1");
        $("body> div").css("pointer-events", "painted");
        $(".waitting-layer").css("display", "none");
    }
}

/////////////////////////////////////////////////////////////////////////////////
//加载等待动画：四色圆圈
var loading_cir = {
    loading:function (elem) {
        if(typeof ( $( $(elem).find(".my-loading") ).html()) == "undefined"){
            $(elem).append("<div class='my-loading'><div class='loading-point'></div></div>");
        }
        $("body input[type='button']").css("cursor","no-drop");
        $("body >div").css("opacity","0.4");
        $("body input[type='button']").css("pointer-events","none");
        $($(elem).find(".my-loading")).css("opacity","1");
        $(elem).find(".my-loading *").css("opacity","1");
        $($(elem).find(".my-loading")).css("pointer-events","painted");
        $("#test").css("cursor","default");
        $("#test").css("opacity", "1");
        $("#test").css("pointer-events", "painted");
    },
    loaded:function (elem) {
        $("body input[type='button']").css("cursor","default");
        $("body >div").css("opacity", "1");
        $("body input[type='button']").css("pointer-events", "painted");
        if(typeof ( $( $(elem).find(".my-loading") )) != "undefined") {
            $( $(elem).find(".my-loading")).remove();
        }
    }
}

//大头像查看========================================================================================
var head_bigger_to_view = {
    show : function (elem,url) {
        let _html = "<div class='head-bigger-to-view'><div class='close'>叉</div></div>";
        $(elem).append(_html);
        $($(elem).find(".head-bigger-to-view")).css("background-image","url('"+url+"'");
        $($(elem).find(".head-bigger-to-view .close")[0]).focus();

        $($(elem).find(".head-bigger-to-view .close")[0]).click(function () {
            $(this).parent(".head-bigger-to-view").remove();
        });
        $(document).mousedown(function(e){
            let elems = $(".head-bigger-to-view")[0];
            if( typeof ($(elems) ) == "undefined"){
                return 0;
            }
            let t = $(elems).css("top");
            let h = $(elems).css("height");

            let l = $(elems).css("left");
            let w = $(elems).css("width");

            // console.log(l+"-"+t+"=="+w+"-"+h);
            t = t.substr(0,t.length-2);
            h = h.substr(0,h.length-2);
            l = l.substr(0,l.length-2);
            w = w.substr(0,w.length-2);

            //鼠标指针此时的位置
            let x = e.pageX;
            let y = e.pageY;

            //当前窗口top位置：top - 1/2高度 - 边框
            //当前窗口bottom位置：top + 1/2高度 + 边框
            //当前窗口left位置：left - 1/2宽度 - 边框
            //当前窗口right位置：left + 1/2宽度 - 边框
            if(    x<parseFloat(l)-parseFloat(w)/2 -5
                || x>parseFloat(l) + parseFloat(w)/2 + 5
                || y<parseFloat(t) -parseFloat(h)/2 -5
                || y>parseFloat(t)+parseFloat(h)/2+ 5
            ){
                $(elems).remove();
            }
        });
    }
};

//自定义下拉框======================================================================================
var mySelect = {
    list:{url:'',title:''},
    open: function () {

    },
    dataGruid: function (parentNode,elem_id,title,list,isSelection) {
        // console.log(elem_id)
        elem_id = typeof (elem_id)!="undefined"&&elem_id.substr(0,1)=="#"?elem_id.substr(1,elem_id.length-1):elem_id;
        $(parentNode).append("<div class='my-select' "+(typeof (elem_id)!="undefined"&&elem_id!=""?"id='"+elem_id+"'":"")+"></div>");

        if(typeof(title)=="undefined") {
            title.title = '按钮';
            title.icon="icon-dollar-symbol";
        }
        let select = $(parentNode).children("#"+elem_id);
        $(select).append("<div class='select-main" +
            ((typeof (title.icon) !="undefined" && title.icon != "")?" "+title.icon+" ":"") +
            "'>" +
            title.title +
            "</div>" +
            "<div class='select-menu'>" +
            "</div>");
        let menu = $(select).children(".select-menu");


        for(i=0;i<list.length;i++){
            let _select_html = (typeof (list[i].url) !='undefined' && list[i].url != '' ?
                    "<a" +" href='" + list[i].url+ "' class='"+
                    ((typeof (list[i].icon)!='undefined' && list[i].icon!="")?" "+list[i].icon+" '>":"'>")+
                    list[i].title+
                    "</a>"
                    :
                    "<span class='"+
                    ((typeof (list[i].icon)!='undefined' && list[i].icon!="")?" "+list[i].icon+" '>":"'>")+
                    list[i].title+
                    "</span>"
            );
            menu.append(_select_html);
        }
        if(typeof (isSelection) != "undefined" && isSelection == true){
            $(menu).find("a").click(function () {
                $( $(this).parent().prev()).html($(this).html());
            });
        }
    },
    //（父节点集合，需要绑定的子节点的id，需要显示的标题，每个下拉框对应的数据，是否是选择框（选择框不能跳转页面，选中后改变标题文字为选择的文字））
    dataGruidAll:function(parentNodes,sub_elem_ids,titles,lists,isSelection){
        // console.log(titles)
        for(let j=0;j<parentNodes.length;j++){
            this.dataGruid($(parentNodes[j]),sub_elem_ids[j],titles[j],lists[j],isSelection);
        }
    },
    valByParent:function (parent) {
        return $( $(parent).find(".my-select .select-main")[0]).html();
    },
    val:function (elemId) {
        elemId = elemId.substr(0,1)=="#"?elemId:"#"+elemId;
        return $(elemId+" .select-main").html();
    }
};

//根据单选框name获取选中的值
var elemUtil = {
    getRadioVal:function getRadioVal(radioName) {
        let rads = document.getElementsByName(radioName);
        for (let radsIndex = 0; radsIndex < rads.length; radsIndex++)//checked
        {
            if ($(rads[radsIndex]).prop("checked") == true) {
                return $(rads[radsIndex]).val();
            }
        }
    }
};

//dom结点提示文本==============================================================================
var elemTitle = {
    cssMap:{cssName:"",cssValue:""},
    gridTitle:function e(elemNode,titleTxt,cssMap){
        $(elemNode).hover(function f() {
            if(  $($(elemNode).find('.elem-title')).length >0){
                $($(elemNode).find('.elem-title')).remove();
            }
            $(elemNode).append("<div class='elem-title'>"+titleTxt+"</div>");
            if(typeof (cssMap) != "undefined" && cssMap != "" && cssMap.length >0){
                for (let cssMapIndex = 0;cssMapIndex <cssMap.length;cssMapIndex++) {
                    $($(elemNode).find('.elem-title')).css(cssMap[cssMapIndex].cssName , cssMap[cssMapIndex].cssValue );
                }
            }
            $($(elemNode).find('.elem-title')).animate({
                // width:'200%',
                height: '20px',
                padding: '5px 10px',
                color:'#aaa'
            },400);
        });
        $(elemNode).mouseleave(function s() {
            if(typeof ($(elemNode).find('.elem-title')) != "undefined"){
                $($(elemNode).find('.elem-title')).animate({
                    width: 0,
                    height:0,
                    padding: '0',
                    color:'rgba(0,0,0,0)'
                },{duration:100,complete:function () {
                        $($(elemNode).find('.elem-title')).remove();
                    }});
            }else{

            }
        });
    },
};
