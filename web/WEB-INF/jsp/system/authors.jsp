<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/16
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<html>
<head>
    <title>开发者团队</title>
    <link rel="stylesheet" href="${global_args}font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${global_args}theame/css/baseCss.css">
    <script src="${global_args}theame/js/jquery-3.6.0.js"></script>
    <script src="${global_args}theame/js/baseJs.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;

        }
    </style>
    <style>
        :root{
            font-size: 15px;
        }
        .body{
            position: relative;
            display: flex;
            width: 100%;
            height: 100%;
            font-family: 'Quicksand' ,sans-serif;
            min-height: 100vh;
            background-color: var(--sub_color);
            background-image:
                    radial-gradient(closest-side, rgb(167, 235, 150),rgba(235,105,78,0)),
                    radial-gradient(closest-side, rgb(214, 91, 143),rgba(243,11,164,0)),
                    radial-gradient(closest-side, rgb(220, 191, 83),rgba(254,234,131,0)),
                    radial-gradient(closest-side, rgb(117, 148, 198),rgba(170,142,245,0)),
                    radial-gradient(closest-side, rgb(213, 164, 125),rgba(248,192,147,0));
            background-size:
                    130vmax 130vmax,
                    80vmax 80vmax,
                    90vmax 90vmax,
                    110vmax 110vmax,
                    90vmax 90vmax;
            background-position:
                    -80vmax -80vmax,
                    60vmax -30vmax,
                    10vmax 10vmax,
                    -30vmax -10vmax,
                    50vmax 50vmax;
            background-repeat: no-repeat;
            animation: move-background 10s linear infinite ;
        }
        .body::after{
            content: '';
            display: block;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }
        .author-area .span{
            position: relative;
            z-index: 10;
            display: flex;
            min-height: 100vh;
            width: 100%;
            justify-content: center;
            align-items: center;
            font-size: 5rem;
            color: transparent;
            text-shadow:
                    0 0 1px rgba(255,255,255,0.6),
                    0 4px 4px rgba(0, 0 ,0, 0.05);
            letter-spacing: .2rem;
            z-index: 5;
        }
        @keyframes move-background {
            0%,100%{
                background-size:
                        130vmax 130vmax,
                        80vmax 80vmax,
                        90vmax 90vmax,
                        110vmax 110vmax,
                        90vmax 90vmax;
                background-position:
                        -80vmax -80vmax,
                        60vmax -30vmax,
                        10vmax 10vmax,
                        -30vmax -10vmax,
                        50vmax 50vmax;
            }
            25%{background-size:
                    100vmax 100vmax,
                    90vmax 90vmax,
                    100vmax 100vmax,
                    90vmax 90vmax,
                    60vmax 60vmax;
                background-position:
                        -60vmax -90vmax,
                        50vmax -40vmax,
                        0vmax -20vmax,
                        -40vmax -20vmax,
                        40vmax 60vmax;
            }
            50%{background-size:
                    100vmax 100vmax,
                    90vmax 90vmax,
                    100vmax 100vmax,
                    60vmax 60vmax,
                    80vmax 80vmax;
                background-position:
                        -50vmax -70vmax,
                        40vmax -30vmax,
                        10vmax -0vmax,
                        20vmax 10vmax,
                        30vmax 70vmax;
            }
            75%{background-size:
                    90vmax 90vmax,
                    90vmax 90vmax,
                    100vmax 100vmax,
                    90vmax 90vmax,
                    70vmax 70vmax;
                background-position:
                        -50vmax -40vmax,
                        50vmax -30vmax,
                        20vmax 0vmax,
                        -10vmax 10vmax,
                        40vmax 60vmax;
            }
        }
    </style>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap');

        /** {*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    box-sizing: border-box;*/
        /*    font-family: 'Poppins', sans-serif;*/
        /*}*/

        /*body {*/
        /*    width: 100%;*/
        /*    height: 100%;*/
        /*    background: linear-gradient(to bottom, #bea2e7 0%, #86b7e7 100%);*/
        /*}*/

        .author-list {
            position: absolute;
            display: flex;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            align-items: center;
            justify-content: center;
            height: 100vh;
            backdrop-filter: blur(0px);
            -webkit-backdrop-filter: blur(0px);
            z-index: 20;
        }
        .author-list *{
            backdrop-filter: blur(0px);
            -webkit-backdrop-filter: blur(0px);
            z-index: 20;
        }

        .author-list .author-area .card {
            background: #fff;
            width: 430px;
            display: flex;
            align-items: center;
            padding: 20px;
            opacity: 0;
            pointer-events: none;
            position: absolute;
            justify-content: space-between;
            border-radius: 100px 20px 20px 100px;
            animation: animate 10s linear  infinite;
            /* animation: name duration timing-function delay iteration-count direction fill-mode; */
            animation-delay: calc(2s * var(--delay));
        }

        .author-list .author-area{
            /* border : 3px solid blue; */
            width: 500px;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .author-list .author-area:hover .card{
            animation-play-state: paused;
        }

        .author-list .card:last-child{
            animation-delay: calc(-2s * var(--delay) );
        }

        @keyframes animate{
            0%{
                opacity: 0;
                transform: translateY(100%) scale(0.5);
            }
            5%, 20%{
                opacity: 0.4;
                transform: translateY(100%) scale(0.7);
            }
            25%, 40%{
                opacity: 1;
                pointer-events: auto;
                transform: translateY(0%) scale(1);
            }
            45%, 60%{
                opacity: 0.4;
                transform: translateY(-100%) scale(0.7);
            }
            65%,100%{
                opacity: 0;
                transform: translateY(-100%) scale(0.5);
            }


        }
        .card .content {
            display: flex;
            align-items: center;
        }

        .card .details {
            margin-left: 80px;
        }

        .details span {
            font-weight: 600;
            font-size: 18px;
        }

        .card a {
            text-decoration: none;
            /*padding: 7px 18px;*/
            height: 50px;
            width: 50px;
            border-radius: 50%;
            text-align: center;
            font-size: 36px;
            font-weight: bolder;
            color: #fff;
            background: linear-gradient(to bottom, #bea2e7 0%, #86b7e7 100%);
        }

        .author-list .card .img {
            height: 90px;
            width: 90px;
            position: absolute;
            /*left: 0px;*/
            left: -30px;
            background: #fff;
            border-radius: 50%;
            padding: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, .2);
        }

        .card .img img {
            height: 100%;
            width: 100%;
            object-fit: cover;
            border-radius: 50%;
        }
        .title{
            position: relative;
            display: inline-block;
            transform: translate(-250%,-80%);
            float: left;
            width: 50px;
            padding: 5px 10px;
            top: 20px;
            left: 20px;
            font-size: 36px;
            color: white;
            text-align: center;
            border-radius: 30px;
            border: 5px solid #fff;
            background-color: var(--sub_color);
        }
    </style>
</head>
<body>

<div class="body"></div>
<div class="author-list">
    <span class="title">开发者团队</span>
    <div class="author-area">
    </div>
</div>
<script>
    function appendOneAuthor(parentNode,author,index) {
        if(typeof (parentNode) == "undefined" || typeof (author) == "undefined"){
            return -1;
        }
        let _html_author_card =
            " <div class='card' style='--delay:" +
            parseInt( typeof (index) == "undefined" || isNaN(index)?-1:index ) + ";'>" +
            "            <div class='content'>" +
            "                <div class='img'>" +
            "                    <img src='" +
            author.head_url +"' alt=''>" +
            "                </div>" +
            "                <div class='details'>" +
            "                    <span class='name'>" +
            author.name + "</span>" +
            "                    <p>" +
            author.single + "</p>" +
            "                </div>" +
            "            </div>" +
            "            <a href='" +
            author.easy_id+"' class='iconfont go'></a>" +
            "        </div>";
        $(parentNode).append(_html_author_card);
    }
    function appendAllAuthors(parentNode,authors) {
        if(typeof (parentNode) == "undefined" || typeof (authors) == "undefined" || authors.length<=0){
            return -1;
        }
        $(parentNode).empty();
        $(parentNode).append("<span class='span'>开发者</span>");
        let _authors_len = authors.length;
        let _start_index = -1;
        for (let index = 0; index < _authors_len ; index++){
            authors[index].easy_id = "#";
            appendOneAuthor(parentNode,authors[index],_start_index);
            _start_index += ((index >= _authors_len - 2)?0:1);
        }
    }
    $.ajax({
        url:"${global_args}getAuthors",
        method:"post",
        dataType:"json",
        data:{},
        success:function (data) {
            if(data.succeed == true){
                appendAllAuthors('.author-list>.author-area',data.data)
            }else{
                my_tip.tip("开发者列表获取失败",1,'body',[{cssName:"opacity",cssValue:"1"}]);
            }
        },
        error:function () {

        }
    });
</script>
</body>
</html>
