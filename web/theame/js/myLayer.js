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
    console.log(u);
    $(".msg-content .msg-body .mb_revise .icon").css("background-size","100% 100%");
    console.log($(".msg-content .msg-body .mb_revise .icon").css("background"));
    $("body> div").css("opacity","0.3");
    $("body> div").css("pointer-events","none");
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
    $("body> div").css("opacity","1");
    $("body> div").css("pointer-events","painted");
    $(".msg-content").css("display","none");
    $(".msg-content").css("height",height);
}