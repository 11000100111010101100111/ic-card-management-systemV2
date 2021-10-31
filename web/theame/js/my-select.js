var mySelect = {
    // list:{url:'',title:''},
    open: function () {

    },
    dataGruid: function (obj,title,list) {
        $(obj).append("<div class='my-select'></div>");
        if(typeof(title)=="undefined") {
            title.txt = '按钮';
            title.font="icon-dollar-symbol";
        }
        var select = $(obj).find(".my-select");
        $(select).append("<div class='iconfont  select-main " +
            title.font +
            "'>" +title.txt + "</div>");

        if(list.length<=0){
            return;
        }
        $(select).append("<div class='select-menu'></div>");
        var menu = $(select).find(".select-menu");
        for(i=0;i<list.length;i++){
            if(typeof (list[i].font) =="undefined" || typeof (list[i].font)==""){
                list[i].font = "icon-xiaoyuanredian";
            }
            $(menu).append("<a href='" +
                list[i].url+
                "'  class='iconfont  " +
                list[i].font+
                "'>" +
                list[i].title+
                "</a>");
            $(menu).find("a span").addClass(list[i].font);
            // console.log(list[i].font);
        }
    },
    dataGruidAll:function(obj,titles,lists){
        console.log(titles);
        for(let j=0;j<$(obj).length;j++){
            console.log(titles[j]);
            // mySelect.list = [{url:"#",title:"选项1"},{url:"#",title:"选项2"},{url:"#",title:"选项3"},{url:"#",title:"选项4"}];
            this.dataGruid($(obj)[j],titles[j],lists[j]);

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