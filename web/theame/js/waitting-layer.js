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
