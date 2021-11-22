
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
    <link rel="stylesheet" href="theame/css/ataticAll.css">
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            height: 100%;
            width: 100%;
        }
        /*全部区域==================================*/
        .box{
            width: 100%;


        }

        /*上部区域==================================*/
        .top-box{
            position: absolute;
            height: 15%;
            /*background-color: #79b09e;*/
            z-index: 1;
        }

        /*中部区域==================================*/
        .mid-box,.false-box{
            /*position: absolute;*/
            height: 70%;
            background-color: #a2aeb0;
            z-index: 9;
        }
        .mid-box{
            float: left;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        /*中部背景==================================*/
        .background{
            height: 80%;
            width:80%;

            background-color: #b0140d;
            position: absolute;
            float: left;

            border-radius:22% 78% 22% 78% / 50% 50% 50% 50% ;
            z-index: 2;
            animation: roateRecet infinite 10s;
            /*transition: all 0.5s;*/

        }
        .background-top{
            top: 70%;
            left: 10%;
            background-image:linear-gradient(45deg, #3023AE 0%, #f09 100%);
            box-shadow: 0 0 12px  #f09 ;
        }
        .background-bottom{
            top: 50%;
            left: 10%;
            background-image:linear-gradient(45deg, #f09 0%, #3023AE 100%);
            box-shadow: 0 0 12px  #3023AE ;
        }
        @keyframes roateRecet {
            /*0%{*/
            /*    border-radius:0% 100% 0% 100% / 50% 50% 50% 50% ;*/
            /*    !*transform: scaleY(1);*!*/
            /*}*/
            /*1%{*/
            /*    border-radius:2% 98% 2% 98% / 50% 50% 50% 50% ;*/
            /*}*/
            /*2%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:4% 96% 4% 96% / 50% 50% 50% 50% ;*/
            /*}*/
            /*3%{*/
            /*    !*transform: scaleY(1.2);*!*/
            /*    border-radius:6% 94% 6% 94% / 50% 50% 50% 50% ;*/
            /*}*/
            /*4%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:8% 92% 8% 92% / 50% 50% 50% 50% ;*/
            /*}*/
            /*5%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:10% 90% 10% 90% / 50% 50% 50% 50% ;*/
            /*}*/
            /*6%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:12% 88% 12% 88% / 50% 50% 50% 50% ;*/
            /*}*/
            /*7%{*/
            /*    border-radius:14% 86% 14% 86% / 50% 50% 50% 50% ;*/
            /*}*/
            /*8%{*/
            /*    !*transform: scaleY(0.8);*!*/
            /*    border-radius:16% 84% 16% 84% / 50% 50% 50% 50% ;*/
            /*}*/
            /*9%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:18% 82% 18% 82% / 50% 50% 50% 50% ;*/
            /*}*/
            /*10%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:20% 80% 20% 80% / 50% 50% 50% 50%  ;*/
            /*}*/

            11%{
                border-radius:22% 78% 22% 78% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            12%{
                border-radius:24% 76% 24% 76% / 50% 50% 50% 50% ;
            }
            13%{
                /*transform: scaleY(1.1);*/
                border-radius:26% 74% 26% 74% / 50% 50% 50% 50% ;
            }
            14%{
                /*transform: scaleY(1.2);*/
                border-radius:28% 72% 28% 72% / 50% 50% 50% 50% ;
            }
            15%{
                /*transform: scaleY(1.1);*/
                border-radius:30% 70% 30% 70% / 50% 50% 50% 50% ;
            }
            16%{
                /*transform: scaleY(1);*/
                border-radius:32% 68% 32% 68% / 50% 50% 50% 50% ;
            }
            17%{
                /*transform: scaleY(0.9);*/
                border-radius:34% 66% 34% 66% / 50% 50% 50% 50% ;
            }
            18%{
                border-radius:36% 64% 36% 64% / 50% 50% 50% 50% ;
            }
            19%{
                /*transform: scaleY(0.8);*/
                border-radius:38% 62% 38% 62% / 50% 50% 50% 50% ;
            }
            /*20%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:40% 60% 40% 60% / 50% 50% 50% 50% ;*/
            /*}*/
            /*21%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:42% 58% 42% 58% / 50% 50% 50% 50%  ;*/
            /*}*/

            20%{
                border-radius:40% 60% 40% 60% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            21%{
                border-radius:42% 58% 42% 58% / 50% 50% 50% 50% ;
            }
            22%{
                /*transform: scaleY(1.1);*/
                border-radius:44% 56% 44% 56% / 50% 50% 50% 50% ;
            }
            23%{
                /*transform: scaleY(1.2);*/
                border-radius:46% 54% 46% 54% / 50% 50% 50% 50% ;
            }
            24%{
                /*transform: scaleY(1.1);*/
                border-radius:48% 52% 48% 52% / 50% 50% 50% 50% ;
            }
            25%{
                /*transform: scaleY(1);*/
                border-radius:50% 50% 50% 50% / 50% 50% 50% 50% ;
            }
            26%{
                /*transform: scaleY(0.9);*/
                border-radius:52% 48% 52% 48% / 50% 50% 50% 50% ;
            }
            27%{
                border-radius:54% 46% 54% 46% / 50% 50% 50% 50% ;
            }
            28%{
                /*transform: scaleY(0.8);*/
                border-radius:56% 44% 56% 44% / 50% 50% 50% 50% ;
            }
            29%{
                /*transform: scaleY(0.9);*/
                border-radius:58% 42% 58% 42% / 50% 50% 50% 50% ;
            }
            30%{
                /*transform: scaleY(1);*/
                border-radius:60% 40% 60% 40% / 50% 50% 50% 50%  ;
            }

            31%{
                border-radius:62% 38% 62% 38% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            32%{
                border-radius:64% 36% 64% 36%/ 50% 50% 50% 50% ;
            }







            33%{
                /*transform: scaleY(1.1);*/
                border-radius:66% 34% 66% 34% / 50% 50% 50% 50% ;
            }
            34%{
                /*transform: scaleY(1.2);*/
                border-radius:68% 32% 68% 32% / 50% 50% 50% 50% ;
            }
            35%{
                /*transform: scaleY(1.1);*/
                border-radius:70% 30% 70% 30% / 50% 50% 50% 50% ;
            }
            36%{
                /*transform: scaleY(1);*/
                border-radius:72% 28% 72% 28% / 50% 50% 50% 50% ;
            }
            37%{
                /*transform: scaleY(0.9);*/
                border-radius:74% 26% 74% 26% / 50% 50% 50% 50% ;
            }
            38%{
                border-radius:76% 24% 76% 24% / 50% 50% 50% 50% ;
            }
            50%{
                /*transform: scaleY(0.8);*/
                border-radius:78% 22% 78% 22% / 50% 50% 50% 50% ;
            }
            /*40%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:80% 20% 80% 20% / 50% 50% 50% 50% ;*/
            /*}*/
            /*41%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:82% 18% 82% 18% / 50% 50% 50% 50%  ;*/
            /*}*/

            /*42%{*/
            /*    border-radius:84% 16% 84% 16% / 50% 50% 50% 50% ;*/
            /*    !*transform: scaleY(1);*!*/
            /*}*/
            /*43%{*/
            /*    border-radius:86% 14% 86% 14%  / 50% 50% 50% 50% ;*/
            /*}*/
            /*44%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:88% 12% 88% 12% / 50% 50% 50% 50% ;*/
            /*}*/
            /*45%{*/
            /*    !*transform: scaleY(1.2);*!*/
            /*    border-radius:90% 10% 90% 10% / 50% 50% 50% 50% ;*/
            /*}*/
            /*46%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:92% 8% 92% 8% / 50% 50% 50% 50% ;*/
            /*}*/
            /*47%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:94% 6% 94% 6% / 50% 50% 50% 50% ;*/
            /*}*/
            /*48%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:96% 4% 96% 4% / 50% 50% 50% 50% ;*/
            /*}*/
            /*49%{*/
            /*    border-radius:98% 2% 98% 2%  / 50% 50% 50% 50% ;*/
            /*}*/
            /*50%{*/
            /*    !*transform: scaleY(0.8);*!*/
            /*    border-radius:100% 0 100% 0% / 50% 50% 50% 50% ;*/
            /*}*/
            /*51%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:98% 2% 98% 2% / 50% 50% 50% 50% ;*/
            /*}*/
            /*52%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:96% 4% 96% 4% / 50% 50% 50% 50%  ;*/
            /*}*/

            /*53%{*/
            /*    border-radius:94% 6% 94% 6% / 50% 50% 50% 50% ;*/
            /*    !*transform: scaleY(1);*!*/
            /*}*/
            /*54%{*/
            /*    border-radius:92% 8% 92% 8% / 50% 50% 50% 50% ;*/
            /*}*/
            /*55%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:90% 10% 90% 10% / 50% 50% 50% 50% ;*/
            /*}*/
            /*56%{*/
            /*    !*transform: scaleY(1.2);*!*/
            /*    border-radius:88% 12% 88% 12% / 50% 50% 50% 50% ;*/
            /*}*/
            /*57%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:86% 14% 86% 14%  / 50% 50% 50% 50% ;*/
            /*}*/
            /*58%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:84% 16% 84% 16%/ 50% 50% 50% 50% ;*/
            /*}*/
            /*59%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:82% 18% 82% 18% / 50% 50% 50% 50% ;*/
            /*}*/
            /*60%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:80% 20% 80% 20%/ 50% 50% 50% 50% ;*/
            /*}*/
            50%{
                /*transform: scaleY(0.9);*/
                border-radius:78% 22% 78% 22% / 50% 50% 50% 50% ;
            }
            62%{
                border-radius:76% 24% 76% 24% / 50% 50% 50% 50% ;
            }
            63%{
                /*transform: scaleY(0.8);*/
                border-radius:74% 26% 74% 26% / 50% 50% 50% 50% ;
            }
            64%{
                /*transform: scaleY(0.9);*/
                border-radius:72% 28% 72% 28% / 50% 50% 50% 50% ;
            }
            65%{
                /*transform: scaleY(1);*/
                border-radius:70% 30% 70% 30% / 50% 50% 50% 50% ;
            }

            66%{
                border-radius:68% 32% 68% 32% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            67%{
                bborder-radius:66% 34% 66% 34% / 50% 50% 50% 50% ;
            }
            68%{
                /*transform: scaleY(1.1);*/
                border-radius:64% 36% 64% 36%/ 50% 50% 50% 50% ;
            }
            69%{
                /*transform: scaleY(1.2);*/
                border-radius:62% 38% 62% 38% / 50% 50% 50% 50% ;
            }
            70%{
                /*transform: scaleY(1.1);*/
                border-radius:60% 40% 60% 40% / 50% 50% 50% 50%  ;
            }
            71%{
                /*transform: scaleY(1);*/
                border-radius:58% 42% 58% 42% / 50% 50% 50% 50% ;
            }
            72%{
                /*transform: scaleY(0.9);*/
                border-radius:56% 44% 56% 44% / 50% 50% 50% 50% ;
            }
            73%{
                border-radius:54% 46% 54% 46% / 50% 50% 50% 50% ;
            }
            74%{
                /*transform: scaleY(0.8);*/
                border-radius:52% 48% 52% 48% / 50% 50% 50% 50% ;
            }
            75%{
                /*transform: scaleY(0.9);*/
                border-radius:50% 50% 50% 50% / 50% 50% 50% 50% ;
            }
            76%{
                /*transform: scaleY(1);*/
                border-radius:48% 52% 48% 52% / 50% 50% 50% 50% ;
            }

            77%{
                border-radius:46% 54% 46% 54% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            78%{
                border-radius:44% 56% 44% 56% / 50% 50% 50% 50% ;
            }
            79%{
                /*transform: scaleY(1.1);*/
                border-radius:42% 58% 42% 58% / 50% 50% 50% 50% ;
            }
            80%{
                /*transform: scaleY(1.2);*/
                border-radius:40% 60% 40% 60% / 50% 50% 50% 50% ;
            }
            81%{
                /*transform: scaleY(1.1);*/
                border-radius:38% 62% 38% 62% / 50% 50% 50% 50% ;
            }
            82%{
                /*transform: scaleY(1);*/
                border-radius:36% 64% 36% 64% / 50% 50% 50% 50% ;
            }
            83%{
                /*transform: scaleY(0.9);*/
                border-radius:34% 66% 34% 66% / 50% 50% 50% 50% ;
            }
            84%{
                border-radius:32% 68% 32% 68% / 50% 50% 50% 50% ;
            }
            85%{
                /*transform: scaleY(0.8);*/
                border-radius:30% 70% 30% 70% / 50% 50% 50% 50% ;
            }
            86%{
                /*transform: scaleY(0.9);*/
                border-radius:28% 72% 28% 72% / 50% 50% 50% 50% ;
            }
            87%{
                /*transform: scaleY(1);*/
                border-radius:26% 74% 26% 74% / 50% 50% 50% 50% ;
            }

            88%{
                border-radius:24% 76% 24% 76% / 50% 50% 50% 50% ;
                /*transform: scaleY(1);*/
            }
            89%{
                border-radius:22% 78% 22% 78% / 50% 50% 50% 50% ;
            }
            /*90%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:20% 80% 20% 80% / 50% 50% 50% 50%  ;*/
            /*}*/
            /*91%{*/
            /*    !*transform: scaleY(1.2);*!*/
            /*    border-radius:18% 82% 18% 82% / 50% 50% 50% 50% ;*/
            /*}*/
            /*92%{*/
            /*    !*transform: scaleY(1.1);*!*/
            /*    border-radius:16% 84% 16% 84% / 50% 50% 50% 50% ;*/
            /*}*/
            /*93%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:14% 86% 14% 86% / 50% 50% 50% 50% ;*/
            /*}*/
            /*94%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:12% 88% 12% 88% / 50% 50% 50% 50% ;*/
            /*}*/
            /*95%{*/
            /*    border-radius:10% 90% 10% 90% / 50% 50% 50% 50% ;*/
            /*}*/
            /*96%{*/
            /*    !*transform: scaleY(0.8);*!*/
            /*    border-radius:8% 92% 8% 92% / 50% 50% 50% 50% ;*/
            /*}*/
            /*97%{*/
            /*    !*transform: scaleY(0.9);*!*/
            /*    border-radius:6% 94% 6% 94% / 50% 50% 50% 50% ;*/
            /*}*/
            /*98%{*/
            /*    !*transform: scaleY(1);*!*/
            /*    border-radius:4% 96% 4% 96% / 50% 50% 50% 50% ;*/
            /*}*/
            /*99%{*/
            /*    border-radius:2% 98% 2% 98% / 50% 50% 50% 50% ;*/
            /*    !*transform: scaleY(1);*!*/
            /*}*/
            /*100%{*/
            /*    border-radius:0% 100% 0% 100% / 50% 50% 50% 50% ;*/
            /*}*/
        }

        /*底部区域==================================*/
        .bottom-box{
            position: absolute;
            height: 15%;
            /*background-color: #398fa4;*/
            z-index: 1;
        }
    </style>
</head>
<body>
    <div style="width: 100%;height: 100%;">
        <div class="box top-box">
            <span style="width: 100%;height: 100%">1</span>
            <div class="background-top background">
                <div class="left-panel"><span style="width: 100%;height: 100%">5</span></div>
            </div>
        </div>
        <div class="box mid-box">
            <div class="left-panel"><span style="width: 100%;height: 100%">2-1</span></div>
            <div class="right-panel"><span style="width: 100%;height: 100%">2-2</span></div>
        </div>
        <div class="box false-box">
            <div class="left-panel"><span style="width: 100%;height: 100%">2-1</span></div>
            <div class="right-panel"><span style="width: 100%;height: 100%">2-2</span></div>
        </div>

        <div class="box bottom-box">
            <span style="width: 100%;height: 100%">3</span>
            <div class="background-bottom background">
                <div class="left-panel"><span style="width: 100%;height: 100%">5</span></div>
            </div>
        </div>
    </div>

    <script href="${pageContext.request.contextPath}/theame/js/jquery-3.6.0.js"></script>
    <script>
        // $('.background').css('width',$('.background').css('height'));
        // $(document).ready(function(){
        //     $('.background').css('width',$('.background').css('height'));
        //     alert($('.background').css('height')+"--"+$('.background').css('width'));
        // })
        function read() {
            document.querySelector('.background').style.width = document.querySelector('.background').style.height;
            // alert( document.querySelector('.background').style.width+"--"+document.querySelector('.background').style.height);
        }
        read();
    </script>
</body>
</html>