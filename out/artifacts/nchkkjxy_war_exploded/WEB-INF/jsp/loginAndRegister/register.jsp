<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/4
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>注册</title>
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
        <style>
            body{
                /*position: relative;*/
                margin: 0;
                min-height: 180vh;
                background-color: var(--sub_color);
            }
            body::before,body::after{
                content: '';
                position: absolute;
                left:50%;
                transform: translate(-50%,0) rotateZ(0);
                min-height: 300vw;
                min-width: 300vw;
                border-radius: 45%;
                background-color: #fff;
                bottom: 15vh;
                animation: fun 10s linear infinite;
            }
            body::after{
                bottom: 12vh;
                opacity: 0.5;
                border-radius: 47%;
            }
            @keyframes fun {
                0%{
                    transform: translate(-50%,0) rotateZ(0);
                }
                50%{
                    transform: translate(-50%,2%) rotateZ(180deg);
                }
                100%{
                    transform: translate(-50%,0) rotateZ(360deg);
                }
            }
        </style>
        <style>
            *{margin: 0;padding: 0;}
            body{
                overflow-x:hidden;
                overflow-y:hidden;
                /* 登录按钮长宽 */
                --login_WH:100px;/*20%;*/

                /* 主题色 */
                --main_color:#2a3fff;
                /* 次主题色 */
                --sub_color: rgb(4, 167, 140);
                /* 主要字体色 */
                --main-font-color:#000;
                /* 次要字体色 */
                --sub-font-color:#666;
                /* 淡灰色 */
                --sub-color:#aaa;
                --cir_shadow:rgb(255, 113, 87);

                /* 动画延时快 */
                --transform_qukily:0.3s;
                /* 动画延时慢 */
                --transform_slowily:0.5s;
            }
            /* 禁止文字选中 */
            .forbiden_txt{
                -o-user-select: none;
                -moz-user-select: none; /*火狐 firefox*/
                -webkit-user-select: none; /*webkit浏览器*/
                -ms-user-select: none; /*IE10+*/
                -khtml-user-select :none; /*早期的浏览器*/
                user-select: none;
            }

            .flex_center{
                display: flex;
                flex-direction:row;
                justify-content:space-around;
                /* align-items:center; */
            }
        </style>
        <!-- 右上角三角图标 -->
        <style>
            h1{
                color: var(--sub_color);
                letter-spacing: 6px;
                font-size: 20px;
                border-bottom: 1px solid var(--sub_color);
            }
            .login-btn{
                position:fixed;
                float: right;
                top: calc(var(--login_WH)/2*-1);
                right: calc(var(--login_WH)/2*-1);
                width: var(--login_WH);
                height: var(--login_WH);
                background-color: var(--main_color);
                transform:rotate(45deg);

                text-align: center;
                line-height: calc(var(--login_WH)*1.65);
                /* line-height: 160px; */
                font-size: 14px;
                font-weight:bold;
                color: #fff;

                transition: all var(--transform_slowily);
                z-index: 20;
            }
            .login-btn:hover{
                box-shadow: 0 1px 10px var(--main_color);
            }
            .login-btn a{
                /* position:absolute;
                margin-bottom: 0; */
                border: 1px solid var(--sub_color);
                border-radius: 10px;
                padding: 1px;
                transition: all var(--transform_slowily);
                text-decoration: none;
                color: #fff;
            }
            .login-btn a:hover{
                cursor: pointer;
                border: 2px solid var(--sub_color);
                padding: 2px;
                box-shadow: 0 0 10px var(--sub_color);
            }
        </style>
        <!-- 注册模块 -->
        <style>
            *{
                transition: opacity var(--transform_slowily);
            }
            input,textarea{
                border-radius: 2px;
                border: 1px solid var(--sub_color);
            }
            input:focus,textarea:focus{
                outline: 2px solid var(--sub_color);
                /*box-shadow: 0 0 8px var(--sub_color);*/
            }
            input:hover,textarea:hover{
                box-shadow: 0 0 6px var(--sub_color);
            }
            .register-contain{
                position: absolute;
                width: 60%;/*80%*/
                height: 90%;/*90%*/
                margin-top: 3%;
                margin-left: 20%;
                /* background-color: var(--main_color); */
                /*background-color: #ccc;*/
                border-radius: 5px;
                z-index: 10;
            }

            .form-contain{
                position: relative;
                width: 100%;
                height: 70%;
                /*background-color: #aaa;*/
            }
            .flex-btn{
                position: fixed;
                flex-direction: column;
                background-color: var(--sub_color);
                width: 32px;
                height: 60px;
                cursor: pointer;
                z-index: 99 !important;
                opacity: 1 !important;
            }
            #before{
                border-radius: 0 5px 5px 0;
                top: 50%;
                transform: translateY(-50%);
                /*top: 240px;*/
                /*float: left;*/
                /*left: 388px;*/
                display: none;
            }
            #next{
                border-radius: 5px 0 0 5px;
                top: 50%;
                left: 100%;
                transform: translate(-100%,-50%);
                /*top: 240px;*/
                /*float: right;*/
                /*left: 1078px;*/
            }

            .form-contain .panel-contain-sub{
                position: absolute;
                width: 80%;
                height: 88%;
                top: 50%;
                left:50%;
                transform: translate(-50%,-50%);
                border-radius: 5px;
                border:2px dashed var(--sub_color);
                background-color: #fff;
                /*z-index: 1;*/
            }
            .form-contain .setting{
                position: absolute;
                width: 100%;
                height: 100%;
                background-color: #fff;
                z-index: 1;
            }

            .form-contain .count-set{
                z-index: 2;
            }
            .form-contain .pesonal-set,
            .form-contain .pwd-setting,
            .form-contain .pesonal-set *,
            .form-contain .pwd-setting *{
                z-index: 1;
                opacity: 0;
            }
            .form-contain .pesonal-set .self-icon{
                position: absolute;
                float: right;
                width: 128px;
                height: 128px;
                margin-top: 10px;
                margin-left: 50px;
                background: url('http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png') center no-repeat;
                background-size: 100% 100%;
                /*border-radius: 50%;*/
                /*box-shadow: 0 1px 1px var(--sub_color);*/
            }


            .form-contain .h-title{
                width: 100%;
                text-align: center;
                margin-top: 20px;
                padding-bottom: 20px;
            }
            .form-contain table{
                width: 100%;
                padding-bottom: 10px;
            }
            .form-contain table input{
                width: 200px;
                height: 30px;
                font-size: 14px;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .form-contain .table-left{
                width: 35%;
                font-size: 14px;
                text-align: right;
            }
            .form-contain .table-right{
                width: 50%;
                text-align: left;
            }

            .form-bur{
                width: 100%;
                height: 30%;

                /* border-top: 1px solid var(--sub-color); */
            }
            .form-bur > span{
                position: absolute;
                width: 100%;
                height: 1px;
                border-radius: 1px;
                background-color:var(--sub-color);
            }

            .form-bur .cir-box{
                position: absolute;
                transform: translateY(-50%);
                width: 100%;
                height: 20px;
            }
            .form-bur .cir-box .cir{
                display: inline-block;
                width: 20px;
                height: 20px;
                border-radius: 20px;
                /*border:0;*/
                background-color: var(--sub_color);
                cursor: pointer;
                transition: all var(--transform_slowily);

                text-align: center;
                line-height: 20px;
                font-weight: bold;
                font-size:16px;
                color:#fff;
                border : 5px solid rgba(0,0,0,0);
            }
            .form-bur .cir-box .cir_0{
                box-shadow: 0 0 20px var(--cir_shadow);
                border :5px solid #fff;
            }
            .form-bur .cir-box .cir:hover{
                cursor: pointer;
                transform: translateY(-3px) translateZ(-3px) scale(1.1);
                box-shadow:0 7px 14px var(--sub_color);
            }


            .form-bur .arc-box{
                transform: translateY(-27px);
            }
            .form-bur .arc-box .arc *{
                display: inline-block;
            }
            .form-bur .arc-box .arc .point{
                width: 5px;
                height: 5px;
                background-color: var(--sub-font-color);
                margin-right: 3px;
                border-radius: 5px;
            }
            .form-bur .arc-box .arc .arc-point{
                /* width: 15px;
                height: 15px; */
                transform: translateY(12px);
                /* background-color: var(--sub_color); */

                width:0px;
                height:0px;
                border-width:15px;
                border-style:solid;
                border-color:rgba(0,0,0,0)  rgba(0,0,0,0)  rgba(0,0,0,0) var(--sub_color);
            }



            .form-bur .txt-box{
                margin-top: -10px;
            }
            .form-bur .txt-box .txt{
                position: relative;
                font-size: 16px;
                color:var(--sub-color);
                text-align: center;
                cursor: pointer;
            }
            .form-bur .txt-box .txt:hover{
                animation-delay: var(--transform_slowily);
                color: var(--sub_color);
            }
            .form-bur .txt-box .txt span{
                position: absolute;
                left: 0;
                bottom: 0;
                width: 0;
                height: 1px;
                background-color: var(--sub_color);
            }
            .form-bur .txt-box .txt:hover span{
                animation: grow var(--transform_slowily);
                animation-fill-mode :forwards;
            }
            @keyframes grow{
                0%{
                    width: 0;
                    box-shadow: 0 0 1px var(--sub_color);
                }
                100%{
                    width: 100%;
                    box-shadow: 0 6px 10px var(--sub_color);
                }
            }


            .form-bur #submit{
                position: absolute;
                width: 80px;
                height: 40px;

                right: 115px;
                margin-top: 50px;
                font-size: 12px;
                background-color: var(--main_color);
                border:2px solid #fff;
                color: #fff;

                border-radius: 5px;

                cursor: pointer;
                transition: all var(--transform_slowily);
            }
            .form-bur #submit:hover{
                border:2px solid var(--sub_color);
                box-shadow: 0 0 10px var(--sub_color);
            }

        </style>
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/myRadioButton.css">
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/myLayer.css">
<%--        <link rel="stylesheet" type="text/css" href="http://localhost:8080/nchkkjxy/theame/css/backJs.css">--%>
    </head>
    <body>
<%--    <div class="back_con" id="jsi-particle-container"></div>--%>
        <div class="msg-content">
            <div class="logo">msg</div>
            <div class="msg-body">
                <div class="mb_revise">
                    <div class="icon"></div>
                    <p class="msg-txt">消息：</p>
                </div>
                <button class="determine">确定</button>
                <button class="cancen">取消</button>
            </div>
        </div>
        <div class="login-btn forbiden_txt" >
            <a href="${pageContext.request.contextPath}/index.jsp">去登录</a>
        </div>
        <div class="register-contain">

            <!-- <div class="title"></div> -->
            <div class="form-contain">
                <!--账号信息面板-->
                <div class="panel-contain-sub">
                    <div id="before" class="flex-btn" >
                        <svg t="1635068907256" style="transform: translateY(10px);" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8122" width="32" height="32"><path d="M512 960c-247.039484 0-448-200.960516-448-448S264.960516 64 512 64 960 264.960516 960 512 759.039484 960 512 960zM512 128c-211.744443 0-384 172.255557-384 384s172.255557 384 384 384 384-172.255557 384-384S723.744443 128 512 128z" p-id="8123" fill="#fff"></path><path d="M290.367854 524.352748c0.032684 0.127295 0.192662 0.25631 0.25631 0.383604 1.536138 3.615858 3.648542 7.071738 6.591802 10.047682 0.032684 0.032684 0.063647 0.032684 0.096331 0.063647s0.032684 0.063647 0.063647 0.096331l158.911974 159.359226c12.480043 12.512727 32.704421 12.576374 45.248112 0.063647 12.512727-12.480043 12.54369-32.704421 0.063647-45.248112l-103.327187-103.616181 305.056632 0c17.664722 0 31.99914-14.336138 31.99914-32.00086s-14.336138-32.00086-31.99914-32.00086L396.576374 481.500874l106.112189-104.959656c12.576374-12.447359 12.672705-32.671738 0.25631-45.248112-6.240882-6.335493-14.496116-9.504099-22.751351-9.504099-8.12794 0-16.25588 3.103239-22.496761 9.247789l-160.25545 158.495686C288.00086 498.912727 285.632146 512.703561 290.367854 524.352748z" p-id="8124" fill="#fff"></path></svg>
                    </div>
                    <div id="next" class="flex-btn">
                        <svg t="1635068951996" style="transform: translateY(10px);" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9016" width="32" height="32"><path d="M512 960c-247.039484 0-448-200.960516-448-448S264.960516 64 512 64 960 264.960516 960 512 759.039484 960 512 960zM512 128c-211.744443 0-384 172.255557-384 384s172.255557 384 384 384 384-172.255557 384-384S723.744443 128 512 128z" p-id="9017" fill="#fff"></path><path d="M732.959548 501.152426c-0.032684-0.127295-0.192662-0.25631-0.25631-0.383604-1.536138-3.615858-3.648542-7.071738-6.591802-10.047682-0.032684-0.032684-0.063647-0.032684-0.096331-0.063647-0.032684-0.032684-0.032684-0.063647-0.063647-0.096331l-158.911974-159.359226c-12.480043-12.480043-32.704421-12.576374-45.248112-0.063647-12.512727 12.480043-12.54369 32.735385-0.063647 45.248112l103.328907 103.616181L320 480.00258c-17.664722 0-31.99914 14.336138-31.99914 32.00086s14.336138 32.00086 31.99914 32.00086l306.752748 0-106.112189 104.959656c-12.576374 12.447359-12.672705 32.671738-0.25631 45.248112 6.239161 6.335493 14.496116 9.504099 22.751351 9.504099 8.12794 0 16.25588-3.103239 22.496761-9.247789l160.25545-158.495686C735.328262 526.592447 737.72794 512.767209 732.959548 501.152426z" p-id="9018" fill="#fff"></path></svg>
                    </div>
                    <div class="setting count-set">
                        <h1 class="h-title">账号信息填写</h1>
                        <table style="margin-top: 80px;">
                            <tr>
                                <td class="table-left">手 机号 码<font style="color: crimson">*</font>：</td>
                                <td class="table-right">
                                    <input type="tel" id="phone" name="phone" placeholder="输入手机号" required autocomplete="off">
                                </td>
                            </tr>
                            <tr>
                                <td class="table-left">身份证号码<font style="color: crimson;">*</font>：</td>
                                <td class="table-right">
                                    <input type="text" id="identify" name="identify" placeholder="输入身份证号码" required autocomplete="off">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--个人信息面板-->
                    <div class="setting pesonal-set" >
                        <h1 class="h-title" style="margin-top: 20px;">账号信息填写</h1>
                        <table>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div class="self-icon" ></div>
                                    </td>
                                </tr>
                            <tr>
                                <td class="table-left">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                                <td class="table-right"><input type="text" name="user_name" id="uname" placeholder="昵称(肖**)"></td>
                            </tr>
                            <tr>
                                <td class="table-left">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                                <td class="table-right">
    <%--                                <input type="radio" name="sex" value="男" id="man">--%>
                                        <div class="my-radio">
                                                <label for="man" >
                                                    <input type="radio" name="sex" value="男" id="man" checked>
                                                   <span>
                                                       <svg t="1635051158257" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5451" width="16" height="16" style="font-weight: 800;"><path d="M575.943755 0C328.967874 0 127.987501 200.980373 127.987501 447.956254c0 109.689288 39.696123 210.379455 105.389708 288.271849l-54.194707 54.194707-87.991407-87.991407c-14.998535-14.998535-39.296162-14.998535-54.294698 0s-14.998535 39.296162 0 54.294698l88.091397 87.991407L11.298897 958.406406c-14.998535 14.998535-14.998535 39.296162 0 54.294697 7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097353-11.298897l113.688898-113.688897 87.991407 87.991407c7.499268 7.499268 17.298311 11.298897 27.197344 11.298897 9.799043 0 19.598086-3.799629 27.097354-11.298897 14.998535-14.998535 14.998535-39.296162 0-54.294698l-87.991407-87.991407 54.194707-54.194707C365.5643 856.216385 466.254467 895.912509 575.943755 895.912509c246.975881 0 447.956254-200.980373 447.956255-447.956255S822.919637 0 575.943755 0z m0 819.120008c-204.680012 0-371.163754-166.483742-371.163753-371.163754S371.263744 76.792501 575.943755 76.792501 947.107509 243.276243 947.107509 447.956254 780.623767 819.120008 575.943755 819.120008z" fill="#27D0D8" p-id="5452"></path></svg>
                                                   </span>
                                                </label>
                <%--                                <input type="radio" name="sex" value="女" id="woman">--%>
                                                <label for="woman" class="sex-lab" id="woman-lab">
                                                    <input type="radio" name="sex" value="女" id="woman">
                                                    <span>
                                                        <svg t="1635051266858" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7132" width="16" height="16" style="font-weight: 800;"><path d="M945.2 0H748.3c-21.7 0-39.4 17.6-39.4 39.4s17.6 39.4 39.4 39.4h141.2L755.2 213.1C675.2 145.7 572 105 459.5 105 206.1 105 0 311.2 0 564.5S206.1 1024 459.5 1024 919 817.9 919 564.5c0-112.5-40.7-215.7-108.1-295.7l134.3-134.3v141.2c0 21.8 17.6 39.4 39.4 39.4s39.4-17.6 39.4-39.4V78.8C1024 35.3 988.7 0 945.2 0zM459.5 945.2c-209.9 0-380.7-170.8-380.7-380.7s170.8-380.7 380.7-380.7 380.7 170.8 380.7 380.7-170.8 380.7-380.7 380.7z" fill="#e89abe" p-id="7133"></path></svg>
                                                    </span>
                                                </label>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-left">生&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
                                <td class="table-right"><input type="date" name="brithday" id="brithday"></td>
                            </tr>
                            <tr>
                                <td class="table-left">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                                <td class="table-right"><input type="email" name="email" id="email" placeholder="***@**.com"></td>
                            </tr>
                            <tr>
                                <td class="table-left">个性签名：</td>
                                <td class="table-right">
                                    <textarea name="single" id="single" cols="30" rows="5" style="font-size: 16px;overflow: hidden;resize:none;"></textarea>
                                    <span style="color: #666;font-size: 10px;float: right;margin-bottom: 2px;margin-right: 2px; position: absolute;transform: translate(-35px, 75px);">
                                        <font class="input-char" >0</font>/<font class="max-char">50</font>字</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--密码设置面板-->
                    <div class="setting pwd-setting">
                    <h1 class="h-title">设置您的登录密码</h1>
                    <table style="margin-top: 80px;"    >
                        <tr>
                            <td class="table-left">密&nbsp;&nbsp;&nbsp;&nbsp;码<font style="color: crimson">*</font>：</td>
                            <td class="table-right">
                                <input type="password" class="pwd_input" name="pwd" id="upwd" autocomplete="off" required style="font-size: 18px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="table-left">验证密码<font style="color: crimson">*</font>：</td>
                            <td class="table-right">
                                <input type="password" class="pwd_input" id="pwd-2" required autocomplete="off" style="font-size: 18px;">
                            </td>
                        </tr>
                    </table>
                </div>
                </div>
            </div><!--
                --><div class="form-bur">
            <span></span>
            <div class="cir-box flex_center">
                <div class="cir cir_0">1</div>
                <div class="cir cir_1">2</div>
                <div class="cir cir_2">3</div>
            </div><!--
                    --><div class="arc-box flex_center">
            <div class="arc" style="transform: translateX(75px);">
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="arc-point"></div>
            </div>
            <div class="arc" style="transform: translateX(-55px); ">
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="arc-point"></div>
            </div>
        </div><!--
                    --><div class="txt-box flex_center forbiden_txt">
            <div class="txt count-panel">账号设置<span></span></div>
            <div class="txt pesonal-panel">个人信息<span></span></div>
            <div class="txt pwd-panel">密码设置<span></span></div>
        </div><!--
                    --><div class="btn-box">
            <input type="button" id="submit" value="我填完了">
        </div>
        </div>
        </div>
        <script src="http://localhost:8080/nchkkjxy/theame/js/jquery-3.6.0.js"></script>
        <script src="http://localhost:8080/nchkkjxy/theame/js/myLayer.js"></script>
<%--        <script src="http://localhost:8080/nchkkjxy/theame/js/backJs.js"></script>--%>
        <script>
            // 切换头像
           $("#man").click(function () {
                $(".pesonal-set .self-icon").css("background", "url('http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png') center no-repeat");
           });
            $("#woman").click(function () {
                $(".pesonal-set .self-icon").css("background", "url('http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png') center no-repeat");
            });
            <%--docume
           nt.getElementById("toLogin").onclick = function () {--%>
            <%--    alert("success");--%>
            <%--    window.open("${pageContext.request.contextPath}/index.jsp");--%>
            <%--}--%>
        </script>
<%--        //限制输入框内容长度--%>
        <script>
            $(function(){
                $("#single").bind('input propertychange',function(){
                    // var maxlength = '30';
                    let maxlength = parseInt($(".max-char").html());
                    checkContent(this,maxlength);
                });
            })

            function checkContent(obj,max){
                // debugger;
                var _val = $(obj).val();
                if (_val.length > max) {
                    $(".input-char").css("color","crimson");
                    $(obj).val(_val.substring(0, max));
                    $(obj).tips({side:3, msg:'达到最大字数限制', bg:'#AE81FF', time:1});
                }else{
                    $(".input-char").css("color","#666");
                }
                $(".input-char").html(_val.length);
            }
        </script>
<%--    密码框安全--%>
        <script>

        $("#pwd-2").blur(function () {
            loseFocus();
        });
        $("#upwd").blur(function () {
            let new_pwd = $("#pwd-2").val().trim();
            if( new_pwd != null && new_pwd !== "") {
                loseFocus();
            }
        });

        $("#upwd").focus(function () {
            reback(this);
            reback("#pwd-2");
        });
        $("#pwd-2").focus(function () {
            reback(this);
            reback("#upwd");
        });

        function loseFocus() {
            let pwd = $("#upwd").val().trim();
            if( pwd != null && pwd !== ""){
                let new_pwd = $("#pwd-2").val().trim();
                if(new_pwd !== pwd){
                    $("#upwd").css("color","#fff");
                    $("#pwd-2").css("color","#fff");
                    $("#upwd").css("background-color","crimson");
                    $("#pwd-2").css("background-color","crimson");
                }
                // else{
                //     reback("#upwd");
                //     reback("#pwd-2");
                // }
            }
        }
        function reback(obj) {
            $(obj).css("background-color","#fff");
            $(obj).css("color","#000");
        }
        // var pwd_frist = "";
        // var pwd_second="";
        // $(function(){
        //     $("#single").bind('input propertychange',function(){
        //         // checkContent(this,maxlength);
        //
        //     });
        //     $("#single").bind('input propertychange',function(){
        //         checkContent(this,maxlength);
        //     });
        // })
        // function checkContent(obj,str){
        //     $(obj).keydown(function (ev) {
        //         str+=ev;
        //     });
        //     var _val = $(obj).val();
        //     if (_val.length > max) {
        //         $(".input-char").css("color","crimson");
        //         $(obj).val(_val.substring(0, max));
        //         $(obj).tips({side:3, msg:'达到最大字数限制', bg:'#AE81FF', time:1});
        //     }else{
        //         $(".input-char").css("color","#666");
        //     }
        //     $(".input-char").html(_val.length);
        // }
    </script>
<%--        切换面板--%>
        <script>
            var index_panel = 0;
            var map_panel = [".count-set",".pesonal-set",".pwd-setting"];
            $(".count-panel").click(function () {
                index_panel = 0;
                change_zIdex($(".count-set"));
                $("#before").css("display","none");
                $("#next").css("display","block");
            });
            $(".pesonal-panel").click(function () {
                index_panel = 1;
                change_zIdex($(".pesonal-set"));
                $("#next").css("display","block");
                $("#before").css("display","block");
            });
            $(".pwd-panel").click(function () {
                index_panel = 2;
                change_zIdex($(".pwd-setting"));
                $("#next").css("display","none");
                $("#before").css("display","block");
            });

            $("#before").click(function () {
                if(index_panel<=1){
                    $(this).css("display","none");
                }
                befor_panel();
                if(index_panel===1){
                    $("#next").css("display","block");
                }

            });
            $("#next").click(function () {
                if(index_panel>=1){
                    $(this).css("display","none");
                }
                next_panel();
                if(index_panel===1){
                    $("#before").css("display","block");
                }

            });

            function befor_panel() {
                if(index_panel<=0){
                    index_panel=0;
                }else{
                    index_panel--;
                }
                change_zIdex($(map_panel[index_panel]));
            }
            function next_panel() {
                if(index_panel>=2){
                    index_panel=2;
                }else{
                    index_panel++;
                }
                change_zIdex($(map_panel[index_panel]));
            }
            function change_zIdex(obj) {
                resetZIndex();

                $(obj).css("z-index","2");
                $(obj).css("opacity","1");
                $(obj).find("*").css("opacity","1");

                for(i=0;i<3;i++) {
                    if(i==index_panel) {
                        $(".cir_" + index_panel).css("box-shadow", "0 0 20px var(--cir_shadow)");
                        $(".cir_" + index_panel).css("border", "5px solid #fff");
                    }
                    else {
                        $(".cir_" + i).css("box-shadow", "0 0 50px #fff");
                        $(".cir_" + i).css("border", "5px solid rgba(0,0,0,0)");
                    }
                }
            }
            function resetZIndex() {
                $(".count-set").css("opacity","0");
                $(".count-set").find("*").css("opacity","0");

                $(".pesonal-set").css("opacity","0");
                $(".pesonal-set").find("*").css("opacity","0");

                $(".pwd-setting").css("opacity","0");
                $(".pwd-setting").find("*").css("opacity","0");

                $(".count-set").css("z-index","1");
                $(".pesonal-set").css("z-index","1");
                $(".pwd-setting").css("z-index","1");
            }

            function routePanel(index) {
                index_panel = index;
                change_zIdex($(map_panel[index_panel]));

                $("#before").css("display",index_panel === 0?"none":"block");
                $("#next").css("display",index_panel === 2?"none":"block");
            }
        </script>
<%--        上传注册信息--%>
        <script>

            function judgeForm(){
                let phone = $("#phone").val();
                let identify = $("#identify").val();

                let name = $("#uname").val();

                let selector = document.getElementsByName('sex');
                let sex = $(selector).val();
                // console.log(sex);
                let data = document.getElementById("brithday").value;
                // let data = $("#brithday").val();
                console.log(data+"---"+sex);
                let email = $("#email").val();
                let single = $("#single").val();
                let headImg = "http://localhost:8080/nchkkjxy/pic/head_icon/defult_"+(sex==="男"?"":"wo")+"man.png";

                let pwd = $("#upwd").val();
                let pwd2 = $("#pwd-2").val();

                if(phone == null || identify==null || pwd == null || pwd2 ==null
                    ||phone === "" || identify==="" || pwd === "" || pwd2 ===""){
                    let single = 2;
                    if(phone == null || identify==null||phone === "" || identify===""){
                        single = 0;
                    }
                    return {single:single,msg:"输入内容不完整，必填项未填充！"};
                }
                if(pwd!=pwd2){
                    return {single:2,msg:"密码前后输入不一致！"};
                }

                let reg = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(18[0-9]{1})|(19[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
                if (!reg.test(phone)){
                    return {single: 0,msg:"手机号码输入不正确！"};
                }

                reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
                if(!reg.test(identify)){
                    return {single: 0,msg:"身份证号码输入不正确！"};
                }

                reg = /^((?!\\|\/|:|\*|\?|<|>|\||'|%).){1,20}$/;
                if(name!= null && name!=="" && !reg.test(name)){
                    return {single: 1,msg:"昵称中不能包含特殊字符*、?等,且长度最多20！"};
                }

                reg = /^([a-z0-9_\.-]+)@([\da-z\.]+)\.([a-z\.]{2,6})$/g;
                if(email != null && email!="" && !reg.test(email)){
                    return {single: 1,msg:"邮箱输入不正确！"};
                }

                reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$/;
                if(!reg.test(pwd)){
                    return {single: 1,msg:"密码由6位字母数字组成，你的输入有误！"};
                }

                let msg = {
                    phone:phone,
                    identify:identify,
                    name:name,
                    sex:sex,
                    birthday:data,
                    email:email,
                    single:single,
                    headImg:headImg,
                    pwd:pwd
                };

                return {single:-1,msg:msg};
            }

            $("#submit").click(function () {
                let result = judgeForm();
                if(result.single !== -1){
                    showMessage_myLayer(result.msg,"http://localhost:8080/nchkkjxy/pic/login/无数据.png");
                    routePanel(result.single);
                }else {
                    // debugger;
                    register(result.msg);
                }
            });

            function register(msg) {
                var url = "?phone="+msg.phone+
                    "&identify="+msg.identify+
                    "&name="+msg.name+
                    "&sex="+msg.sex+
                    "&birthday="+msg.data+
                    "&email="+msg.email+
                    "&single="+msg.single+
                    "&headImg="+msg.headImg+
                    "&pwd="+msg.pwd;
                $.ajax({
                    type: "post",                //数据提交方式（post）
                    url: "${pageContext.request.contextPath}/go/register", //提交的数据
                    dataType: "json",           //返回的数据类型格式
                    data:{
                        phone:msg.phone,
                        identify:msg.identify,
                        name:msg.name,
                        sex:msg.sex,
                        birthday:msg.data,
                        email:msg.email,
                        single:msg.single,
                        headImg:msg.headImg,
                        pwd:msg.pwd
                    },
                    success: function (data) {
                        let msg = data.val;
                        // debugger;
                        showMessage_myLayer(msg,"http://localhost:8080/nchkkjxy/pic/login/"+(data.single === "succeed"?"注册成功":"404")+".png");
                    },
                    error:function () {
                        showMessage_myLayer(msg,"http://localhost:8080/nchkkjxy/pic/login/404.png");
                    }
                });
            }
        </script>

    </body>
</html>
