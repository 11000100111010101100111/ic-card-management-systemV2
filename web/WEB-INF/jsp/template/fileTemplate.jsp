<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/20
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件模板</title>
    <meta charset="UTF-8">
    <script src="http://localhost:8080/nchkkjxy/theame/js/jquery-3.6.0.js"></script>
    <script src="http://localhost:8080/nchkkjxy/theame/js/baseJs.js"></script>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/nchkkjxy/font/iconfont.css">
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
    <style>
        /*样式1*/
        .a-upload {
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }
        .a-upload input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }
        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }
        /*样式2*/
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>


    <style>
        .file-temp{
            position: relative;
            width: 500px;
            height: 300px;
            top: 50%;
            left: 50%;
            border: 1px solid #666;
            transform: translate(-50%,-50%);
            border-radius: 5px;
            background-color: #fff;
        }
        .file-temp .file-area{
            position: relative;
            width: 100%;
            height: 70%;
            border-radius: 5px 5px 0 0 ;
        }
        .file-temp .file-area .file-box{
            position: absolute;
            width: 150px;
            height: 150px;
            left: 50%;
            top: 0;
            transform: translateX(-50%);
            margin-top: 40px;
            border: 3px dashed #666;
            border-radius: 5px;
            transition: all var(--transform_slowily);
            cursor: pointer;
            background-image: url('http://localhost:8080/nchkkjxy/pic/main_page/file_add.png');
            background-size: 50% 50%;
            background-repeat: no-repeat;
            background-position: center;
        }
        .file-temp .file-area .file-box:hover{
            box-shadow: 0 0 8px var(--sub_color);
        }
        .file-temp .file-area .file-tip{
            /*position: relative;*/
            position: absolute;
            width: 100%;
            /*position: absolute;*/
            top:100%;
            left: 50%;
            transform: translate(-50%,-100%);
        }
        .file-temp .file-area .file-tip span{
            position: absolute;
            width: 100%;
            text-align: center;
            font-size: 12px;
            color: #888;
        }
        .file-temp .file-area .file-tip .file-type{
            color: #c7254e;
        }
        .file-temp .but-area{
            /*background-color: #4e65c7;*/
            position: absolute;
            top:100%;
            left: 50%;
            transform: translate(-50%,-100%);
            width: 100%;
            border-radius: 0 0 5px 5px;
        }
        .file-temp .but-area .file-but{
            width: 80px;
            height: 30px;

            float: right;
            margin: 0 10px 10px 10px;
            /*color: crimson;*/
            color: #fff;
            font-size: 14px;
            font-weight: 400;
            background-color: var(--sub_color);
        }
        .file-temp .but-area .file-cancel{
            background-color: crimson;
            color: #fff;
            border-color: #c7254e;
        }
        .file-temp .but-area .file-cancel:hover{
            border-color: #c7254e;
            outline: none;
            box-shadow: 0 0 6px crimson;
        }
    </style>
</head>
<body style="padding: 10px"><form action="http://localhost:8080/nchkkjxy/file/upload" enctype="multipart/form-data" method="post">
    <input type="file" name="file" id="file">
    <input type="submit"  value="下一步" name="" style="width:100px;height:30px;">
</form>
<%--//文件上传--%>
<div class="file-temp">
    <div class="file-area">
        <div class="file-box">
            <input type="file"  name="upload-file" class="upload-file" style="opacity: 0;width: 100%;height: 100%;cursor: pointer;">
        </div>
        <div class="file-tip">
            <span>请从本地选择<font class="file-type">*.jpg</font>/<font class="file-type">*.png</font>作为头像！</span>
        </div>
    </div>
    <div class="but-area">
        <input type="button" value="取消" class="file-but file-cancel">
        <input type="button" value="确定" class="file-but file-sure">
    </div>
</div>
<script>

    // var my_file = {
    //     supportFile : ["jpg","gif","bmp","png","jpeg"],
    //     MaxNameLength : 100,
    //     upload:{
    //         url:"",
    //
    //     }
    // };
    var file_judeg = {
        supportFile : ["jpg","gif","bmp","png","jpeg"],
        MaxNameLength : 100,
        judge:function (fileNode,singleNode) {
            let filePath = $(fileNode).val();
            let fileName = filePath.substring(filePath.lastIndexOf( "\\" ) + 1, filePath.length);
            if  ( typeof (fileName) !="undefined" && fileName !=  "" ) {
                if(typeof (singleNode)!="undefined") {
                    $(singleNode).css("border","3px solid var(--sub_color)");
                }
                //lastIndexOf如果没有搜索到则返回为-1
                if  (fileName.lastIndexOf( "." ) != -1) {
                    let  fileType = (fileName.substring(fileName.lastIndexOf( "." ) + 1, fileName.length)).toLowerCase();
                    console.log(fileType)
                    for  (  let  i = 0; i < file_judeg.supportFile.length; i++) {
                        if  (file_judeg.supportFile[i] == fileType) {
                            if  (fileName.length > file_judeg.MaxNameLength) {
                                // "文件名长度不能超过100字符" );
                                $(fileNode).val("");
                                my_tip.tip("文件名长度不能超过"+file_judeg.MaxNameLength+"字符",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                                return  -1 ;
                            }
                            return  1;
                        }
                        else  {
                            $(fileNode).val("");
                            my_tip.tip("文件格式无效",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                            return -1 ;
                        }
                    }
                    my_tip.tip("文件格式无效",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                    return  -1 ;
                }  else  {
                    $(fileNode).val("");
                    my_tip.tip("选择文件失败",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
                    return  -1 ;
                }
            }
            else{
                if(typeof (singleNode)!="undefined") {
                    $(singleNode).css("border","3px dashed var(--sub_color)");
                }
                return 0;
            }
        }
    }
    $(".file-temp .file-area .file-box .upload-file").change(function () {
        let reg = file_judeg.judge($(this),$(".file-temp .file-area .file-box "));
        if(reg == 1){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #16DC63");
            $(".file-temp .file-area .file-box ").css("border-color", "#16DC63");
            $(".file-temp .file-area .file-box ").css("background-image", "url('http://localhost:8080/nchkkjxy/pic/main_page/file_succeed.png')");
        }
        else if(reg == -1){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px crimson");
            $(".file-temp .file-area .file-box ").css("border-color", "crimson");
            $(".file-temp .file-area .file-box ").css("background-image", "url('http://localhost:8080/nchkkjxy/pic/main_page/file_error.png')");
        }
        else if(reg == 0){
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #666");
            $(".file-temp .file-area .file-box ").css("border-color", "#666");
            $(".file-temp .file-area .file-box ").css("background-image", "url('http://localhost:8080/nchkkjxy/pic/main_page/file_add.png')");
        }
    });
    var file_btn = $(".file-temp .file-area .file-box .upload-file");
    //选择文件
    $(".file-temp .file-area .file-box .upload-file").click(function () {
        if( $(".file-temp .file-area .file-box .upload-file").val() !=  "" ) {
            $(".file-temp .file-area .file-box ").css("box-shadow", "0 0 8px #666");
            $(".file-temp .file-area .file-box ").css("border", "3px dashed #666");
            $(".file-temp .file-area .file-box ").css("background-image", "url('http://localhost:8080/nchkkjxy/pic/main_page/file_add.png')");
        }
    });
    //上传事件
    $(".file-temp .but-area .file-sure").click(function () {
        if ($(".file-temp .file-area .file-box .upload-file").val() == "") {
            my_tip.tip("没有选择文件",0,'body',[{cssName:"background-color",cssValue:'crimson'}]);
        } else {
            //开始上传文件
            let multipartFile = new FormData();
            multipartFile.append("file", file_btn[0].files[0])
            $.ajax({
                url: "http://localhost:8080/nchkkjxy/file/upload",  //后台URL
                type: "post",
                data: multipartFile,
                contentType: false,
                cache: false,
                processData: false,//必须false才会避开jQuery对 formdata 的默认处理,XMLHttpRequest会对 formdata 进行正确的处理
                beforeSend:function(){
                    loading_cir.loading('body');
                },
                success: function (data) {
                    console.log("上传完成后收到：" + data);
                    loading_cir.loaded('body');

                },
                error:function () {
                    loading_cir.loaded('body');
                }
            });
        }
    });

</script>
</body>
</html>
