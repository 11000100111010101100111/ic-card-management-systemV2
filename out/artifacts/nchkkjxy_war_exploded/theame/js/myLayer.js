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
        var action =new $.show_tip();
        action.setMsg(msg);
        action.setLocation( location);
        action.setParentNode(parentNode);
        action.setCss(css);
        action.showFun();
    }
}