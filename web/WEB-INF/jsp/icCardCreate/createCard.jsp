<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/30
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>一键申卡</title>
    <link rel="stylesheet" href="http://localhost:8080/nchkkjxy/font/iconfont.css">
    <script src="http://localhost:8080/nchkkjxy/staticRes/js/icCardCreate/modernizr-custom.js"></script>
    <script src="http://localhost:8080/nchkkjxy/staticRes/js/icCardCreate/jquery-3.6.0.js"></script>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/staticRes/css/icCardCreate/createCard.css">

    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/myLayer.css">
    <script src="http://localhost:8080/nchkkjxy/theame/js/myLayer.js"></script>


    <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/waitting-layer.css">
    <script src="http://localhost:8080/nchkkjxy/theame/js/waitting-layer.js"></script>
    <style>
        .under-cir-panel{
            width: 0px;
            height: 0px;
            position: relative;
            display: inline-block;
            top:0;
            left: 0;
            transform: translate(-50%,-50%);
            background-color: rebeccapurple;
            animation: big-start 1s ease-in;
            animation-fill-mode: forwards;
            border-radius: 100%;
            box-shadow: 0 0 10px #666;
            z-index: 1 !important;
        }
        @keyframes big-start {
            0%{}
            to{
                width: 300%;
                height: 300%;
                transform: translate(-50%,-50%);
                /*transform: translate(-2000px,-2000px)*/
            }
        }

        .bottom-cir-panel{
            width: 1000px;
            height: 1000px;
            position: relative;
            top:100%;
            left: 50%;
            transform: translateX(-50%);
            background-color: var(--sub_color);
            animation: move-down 1s ease-in;
            animation-delay: 0.9s;
            animation-fill-mode: forwards;
            border-radius: 100%;
            border: 2px solid #fff;
            box-shadow: 0 0 10px #666;
            z-index: 1 !important;
        }
        @keyframes move-down {
            from{}
            to{
                transform: translateY(-500px);
            }
        }
        .up-cir-panel{
            width: 3000px;
            height: 3000px;
            position: absolute;
            display: inline-block;
            top:100%;
            left: 50%;
            transform: translateX(-50%) translateY(0);
            background-color: var(--sub_color);
            animation: move-up 1s ease-in;
            animation-delay: .9s;
            animation-fill-mode: forwards;
            border-radius: 100%;
            box-shadow: 0 0 10px #aaa;
            z-index: 1 !important;
        }
        @keyframes move-up {
            from{}
            to{
                transform: translate(-50%,-250px);
            }
        }
    </style>
</head>
<body>
<!--<div style="text-align:center;clear:both">-->
<!--</div>-->

<div class="msg-content">
    <div class="logo">msg</div>
    <div class="msg-body">
        <div class="mb_revise">
            <div class="icon"></div>
            <p class="msg-txt">消息：</p>
        </div>
        <button class="determine" onclick="beSure();">确定</button>
        <button class="cancen" onclick="closeMessage();">取消</button>
    </div>
</div>

<div class="waitting-layer" style="width: 100px;height: 100px;">
    <div class="cover_layer">
        <div class="cover_layer">
            <div class="cover_layer">
                <div class="cover_layer">
                    <div class="cover_layer">
                        <div class="cover_layer">
                            <div class="cover_layer points-contain">
                                <div class="point-containX">
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point center-ele">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                </div>
                                <div class="point-containY .point-containX">
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point center-ele">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                    <div class="center-point">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <span class="wait-font">请稍后<br><font class="f_1 f">●</font><font class="f_2 f">◉</font><font class="f_3 f">●</font></span>
</div>

<div class="appover-box">
    <div class='top'>
        您选择的是：<br/>&nbsp;&nbsp;&nbsp;&nbsp;
        <span></span>
        <p>...</p>
        <img class="_card" src="#"/>
    </div>
    <div class="sure-btn-box">
        <input type="button" value="就这样" class="sure_this_card">
    </div>
</div>
<div class="container">

    <div class="content color-6">
        <h2 class="content__title">xjh</h2>
        <ul id="stack_mawar" class="stack stack--mawar">
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/nomal.png" alt="Tree 8" />
                <span>普通卡</span>
                <p>任何人都能申请！充多少用多少，开心使用每一天！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;">1 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">任何人</font></p>
            </li>
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/student.png" alt="Tree 2" />
                <span>学生卡</span>
                <p>学生福利！祖国的花朵，家庭的未来，你们值得期待！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;"> 0.6 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">儿童、在校中小学生、大学生、研博生</font></p>
            </li>
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/军人卡.png" alt="Tree 4" />
                <span>军人卡</span>
                <p>从军国荣！军人优先！军人依法享受优惠政策！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;">0.5 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">参军及退伍在伍人员</font></p>
            </li>
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/残疾卡.png" alt="Tree 7" />
                <span>残疾卡</span>
                <p>关爱弱势群体是我们每个人的社会责任！点点滴滴更暖心！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;">0.6 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">残疾人包括健康状况不佳的人</font></p>
            </li>
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/vip.png" alt="Tree 6" />
                <span>VIP卡</span>
                <p>Very Importent Personnel！您,是我们的上帝！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;">0.8 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">在平台办理了vip的客户</font></p>
            </li>
            <li class="stack__item">
                <img src="http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/老人卡.png" alt="Tree 1" />
                <span>老年卡</span>
                <p>夕阳无限好，恰如当年青春时！</p>
                <p>折扣：<font class="count" style="color: var(--sub_color);font-size: 14px;font-weight: 400;">0.6 </font>折起</p>
                <p>使用限制&nbsp;&nbsp;<font style="color:crimson;font-size: 15px;">65岁以上中老年人</font></p>
            </li>
        </ul>
        <div class="controls">
            <button class="button button--sonar button--reject" data-stack="stack_mawar"><i class="fa fa-times iconfont icon-huanyipi "></i><span class="text-hidden">Reject</span></button>
            <button class="button button--sonar button--accept" data-stack="stack_mawar"><i class="fa fa-check iconfont icon-gou"></i><span class="text-hidden">Accept</span></button>
        </div>
    </div>

</div>
<div class="under-cir-panel"></div>
<div class="up-cir-panel"></div>
<div class="bottom-cir-panel"></div>
<script src="http://localhost:8080/nchkkjxy/staticRes/js/icCardCreate/classie.js"></script>
<script>
    // http://stackoverflow.com/a/11381730/989439
    function mobilecheck() {
        var check = false;
        (function(a){if(/(android|ipad|playbook|silk|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
        return check;
    }

    var clickeventtype = mobilecheck() ? 'touchstart' : 'click';

    (function() {
        var support = { animations : Modernizr.cssanimations },
            animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
            animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
            onEndAnimation = function( el, callback ) {
                var onEndCallbackFn = function( ev ) {
                    if( support.animations ) {
                        if(ev.target != this) return;
                        this.removeEventListener( animEndEventName, onEndCallbackFn);
                    }
                    if(callback && typeof callback === 'function') {callback.call();}
                };
                if( support.animations ) {
                    el.addEventListener(animEndEventName, onEndCallbackFn);
                }
                else {
                    onEndCallbackFn();
                }
            };

        [].slice.call(document.querySelectorAll('.button--sonar')).forEach(function(el) {
            el.addEventListener(clickeventtype, function(ev) {
                if( el.getAttribute('data-state') !== 'locked' ) {
                    classie.add(el, 'button--active');
                    onEndAnimation(el, function() {
                        classie.remove(el, 'button--active');
                    });
                }
            });
        });
    })();
</script>
<%--<script src="http://localhost:8080/nchkkjxy/theame/js/dynamics.min.js"></script>--%>
<%--<script src="http://localhost:8080/nchkkjxy/theame/js/createCard.js"></script>--%>
<script src="http://localhost:8080/nchkkjxy/staticRes/js/icCardCreate/dynamics.min.js"></script>

<script src="http://localhost:8080/nchkkjxy/staticRes/js/icCardCreate/main.js"></script>
<script>

    var card_index = 0;
    function nextCard(){
        if(card_index >= $("#stack_mawar").find("li").length-1){
            card_index = 0;
        }else{
            card_index++;
        }
    }
    function getFoucsCard(){
        let focusCards = $("#stack_mawar").find("li");
        return {
            txt:$(focusCards[card_index]).find("span").html(),
            src:$( $(focusCards[card_index]).find("img"))[0].src
        };
    }

    (function() {

        var support = { animations : Modernizr.cssanimations },
            animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
            animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
            onEndAnimation = function( el, callback ) {
                var onEndCallbackFn = function( ev ) {
                    if( support.animations ) {
                        if(ev.target != this) return;
                        this.removeEventListener( animEndEventName, onEndCallbackFn);
                    }
                    if(callback && typeof callback === 'function') {callback.call();}
                };
                if( support.animations ) {
                    el.addEventListener(animEndEventName, onEndCallbackFn);
                }
                else {
                    onEndCallbackFn();
                }
            };

        function nextSibling(el) {
            var nextSibling = el.nextSibling;
            while(nextSibling && nextSibling.nodeType != 1) {
                nextSibling = nextSibling.nextSibling
            }
            return nextSibling;
        }

        var mawar = new Stack(document.getElementById('stack_mawar'), {
            perspective : 1500,
            perspectiveOrigin : '-150% 50%',
            visible: 4,
            stackItemsAnimation : {
                duration: 1300,
                type: dynamics.spring
            },
            stackItemsPreAnimation : {
                accept : {
                    elastic: true,
                    animationProperties: {translateX : 100},
                    animationSettings: {
                        duration: 200,
                        type: dynamics.easeIn
                    }
                },
                reject : {
                    elastic: true,
                    animationProperties: {translateX : -100},
                    animationSettings: {
                        duration: 200,
                        type: dynamics.easeIn
                    }
                }
            }
        });


        var buttonClickCallback = function(bttn) {
            var bttn = bttn || this;
            bttn.setAttribute('data-state', 'unlocked');
            nextCard();
        };

        document.querySelector('.button--reject[data-stack = stack_mawar]').addEventListener(clickeventtype, function() {
            mawar.accept(buttonClickCallback.bind(this));
            $(".appover-box div span").html("");
            console.log(this.current);
        });
        document.querySelector('.button--accept[data-stack = stack_mawar]').addEventListener(clickeventtype, function() {
            //  mawar.reject(buttonClickCallback.bind(this));
            console.log(this.current);
            // mawar.anyother(buttonClickCallback.bind(this));
            $(this).addClass("button--active");
            $(".content").css("z-index","90");

            $(".appover-box").css("display","block");

            if($(".appover-box").hasClass("smaller")){
                $(".appover-box").removeClass("smaller");
            }
            $(".appover-box").addClass("bigger");

            var _card_type = getFoucsCard();
            $(".appover-box div span").html(_card_type.txt);
            $(".appover-box ._card").attr("src",_card_type.src);
            console.log(_card_type.src);
        });
        $(".stack__item").click(function(){

            $(".content").css("z-index","90");

            $(".appover-box").css("display","block");

            if($(".appover-box").hasClass("smaller")){
                $(".appover-box").removeClass("smaller");
            }
            $(".appover-box").addClass("bigger");


            var _card_type = getFoucsCard();
            $(".appover-box div span").html( _card_type.txt);
            $(".appover-box ._card").attr("src",_card_type.src);
            console.log(_card_type.src);
        }),
            document.querySelector('.appover-box').addEventListener(clickeventtype, function() {

                //  mawar.reject(buttonClickCallback.bind(this));
                // $(".content").css("z-index","99");
                $(".button--accept[data-stack = stack_mawar]").removeClass("button--active");
                $(".appover-box").css("display","block");

                if($(".appover-box").hasClass("bigger")){
                    $(".appover-box").removeClass("bigger");
                }
                // $(".appover-box").addClass("hasSureCard");
                $(".appover-box").addClass("smaller");

            });

        //确认选择这张卡
        $(".appover-box .sure-btn-box .sure_this_card").click(function(){

            $.ajax({
                type: "post",                //数据提交方式（post）
                url: "${pageContext.request.contextPath}/createCard/hasCard", //提交的数据
                dataType: "json",           //返回的数据类型格式
                beforeSend:function(XMLHttpRequest){
                    //发起连接前开启等待动画
                    my_layer.open();
                },
                success: function (data) {
                    //获得http回复后终止等待动画
                    my_layer.close();

                    if(data.single === "404"){
                        layerUrl="http://localhost:8080/nchkkjxy/";
                        //session失效了
                        showMessage_myLayer("登录过期，请在重新登录后申请！","http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/认证失败.png");
                    }else if(data.single === "200"){
                        layerUrl="#";
                        // 不满足申请条件
                        showMessage_myLayer(data.single+"<br/><font style='color:var(--sub_color);'>现在去查看吗</font>？" ,"http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/已有数据.png");
                    }else if(data.single == "500"){
                        layerUrl="#";
                        showMessage_myLayer(data.single,"http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/404页面丢失.png");
                    }
                    else{
                        // 满足申请条件
                        // showMessage_myLayer(msg,"http://localhost:8080/nchkkjxy/pic/login/"+(data.single === "succeed"?"注册成功":"404")+".png");
                        sureThisCard();
                    }
                },
                error:function () {
                    layerUrl="#";
                    showMessage_myLayer("网络断开了，连接异常！","http://localhost:8080/nchkkjxy/staticRes/icon/icCardCreate/加载失败.png");
                }
            });


        }),

            [].slice.call(document.querySelectorAll('.button--sonar')).forEach(function(bttn) {
                bttn.addEventListener(clickeventtype, function() {
                    bttn.setAttribute('data-state', 'locked');
                });
            });

        [].slice.call(document.querySelectorAll('.button--material')).forEach(function(bttn) {
            var radialAction = nextSibling(bttn.parentNode);

            bttn.addEventListener(clickeventtype, function(ev) {
                var boxOffset = radialAction.parentNode.getBoundingClientRect(),
                    offset = bttn.getBoundingClientRect();

                radialAction.style.left = Number(offset.left - boxOffset.left) + 'px';
                radialAction.style.top = Number(offset.top - boxOffset.top) + 'px';

                classie.add(radialAction, classie.has(bttn, 'button--reject') ? 'material-circle--reject' : 'material-circle--accept');
                classie.add(radialAction, 'material-circle--active');
                onEndAnimation(radialAction, function() {
                    classie.remove(radialAction, classie.has(bttn, 'button--reject') ? 'material-circle--reject' : 'material-circle--accept');
                    classie.remove(radialAction, 'material-circle--active');
                });
            });
        });
    })();

    function sureThisCard() {
        var _card_type = getFoucsCard();
        $(".appover-box div span").html(_card_type.txt);
        $(".appover-box ._card").attr("src",_card_type.src);
        // console.log(_card_type.src);

        $(".content").css("z-index","1");

        $(".appover-box").css("display","block");

        if($(".appover-box").hasClass("bigger")){
            $(".appover-box").removeClass("bigger");
        }
        $(".appover-box").addClass("hasSureCard");
        $(".appover-box .sure-btn-box .sure_this_card").css("display","none");
    }
    var layerUrl ="";
    function beSure() {
        // window.location.reload();
        self.location.href=layerUrl;
    }
</script>
</body>
</html>
