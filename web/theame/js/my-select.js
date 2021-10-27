var mySelect = {
    list:{url:'',title:''},
    open: function () {

    },
    dataGruid: function (obj,title,list) {
        $(obj).append("<div class='my-select'></div>");
        if(typeof(title)=="undefined") {
            title = '按钮';
        }
        var select = $(obj).find(".my-select");
        $(select).append("<div class='select-main'>" +
            title +
            "</div>" +
            "<div class='select-menu'>" +
            "</div>");
        var menu = $(select).find(".select-menu");
        for(i=0;i<list.length;i++){
            $(menu).append("<a href='" +
                list[i].url+
                "'>" +
                list[i].title+
                "</a>");
        }
    }
};

//How to use my-select?
//look here:
//tip:base jquery
// mySelect.dataGruid(
//     $("#list"),//this is use target
//     "hello", //is target text
//     [{url:'#',title:'11'},{url:'#',title:'22'},{url:'#',title:'33'},{url:'#',title:'44'}]); //this map is menu list