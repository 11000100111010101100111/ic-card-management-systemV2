
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="icon shortcut" href="${global_url}theame/img/favicon.ico" type="img/x-icon">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/ataticAll.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/myLayer.css">
    <link rel="stylesheet" type="text/css" href="${global_url}theame/css/page-login.css">
    <link rel="shortcut icon" href="${global_url}pic/page-login.ico" type="image/x-icon">
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
            <form class="login" action="${pageContext.request.contextPath}/go/login" method="post">
                <h3>登 录</h3>
                <div class="from">
                    <div class="input">
                        <div class="inline-ele notfocus">
                            <div class="font inline-block-ele" style="background-image: url('${pageContext.request.contextPath}/theame/img/user.png');"></div><!--
                            --><input  value="xjh" name="easy_id" contenteditable="true" type="text" class="inline-block-ele" id="uid" placeholder="请输入账号" autocomplete="off" required>
                        </div>
                        <%--            <label class="lab-id inline-ele" >error:12323!</label>--%>
                    </div>
                    <div class="input">
                        <div class="inline-ele notfocus">
                            <div class="font inline-block-ele" style="background-image: url('${pageContext.request.contextPath}/theame/img/password.png');"></div><!--
                            --><input value="111" name="password" contenteditable="true" type="password" class="inline-block-ele" id="upwd" placeholder="请输入密码" autocomplete="off" required>
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
                    <g id="_11"> </g>
                    <g id="_10"><circle cx="46.869" cy="132.749" r="1.309"/>
                    </g>
                    <g id="_9"> </g>
                    <g id="_8"></g>
                    <g id="_7"></g> <g id="_4"></g> <g id="_2"></g>
                   <g id="_12"></g>
                </g>
                <g class="decoration">
                    <g></g>
                    <g></g>
                    <g></g>
                    <g> </g>
                    <g> </g>
                    <g></g>
                    <g></g>
                    <g></g>
                    <g></g>
                    <g></g>
                    <g> </g>
                    <g></g>
                </g>
            </svg>
        </div>
    </div>
    <div class="box bottom-box">
        <span style="margin-top:20px;float: right;margin-right: 20px;text-align: center;">南昌航空大学科技学院 信息电子学部 2021 课程设计 </br> 2021-09-22@strat IC卡管理@project</span>
    </div>
</div>
<%--<script href="${pageContext.request.contextPath}/theame/js/jquery-3.6.0.js"></script>--%>
<script src="${global_url}theame/js/jquery-3.6.0.js"></script>
<script src="${global_url}theame/js/myLayer.js"></script>
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
                    $("#ucode").val(data.val);
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