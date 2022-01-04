<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/23
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加载systemInfo配置文件 -->
<fmt:setBundle basename="args" var="global_args" />
<!-- 读取配置值AppName，并赋值给变量appName -->
<fmt:message key="http_url" var="global_url" bundle="${global_args}" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${global_url}pic/page-error.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css"  href="${global_url}theame/css/baseCss.css">
    <link rel="stylesheet" type="text/css"  href="${global_url}theame/css/page-error.css">
    <script src="${global_url}theame/js/page-error.js"></script>
    <style>
        .msg-panel>.img{
            background: url("${global_url}${icon}") no-repeat center;
        }
    </style>
    <title>${title}失败</title>
</head>
<body>
<canvas id="canvas"></canvas>
<div class="back"></div>
<div class="ball"></div>
<div class="msg-panel">
    <div class="logo">msg</div>
    <h1>${title}失败了</h1>
    <span></span>
    <div class="img"></div>
    <p>${detil}</p>
    <script>
        var canvas = document.getElementById("canvas");
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        var ctx = canvas.getContext("2d");
        var particlesArray = [];
        var count = parseInt(1.5*canvas.height / 100 * canvas.width / 100);
        class Particle {
            constructor(x, y) {
                this.x = x;
                this.y = y;
                this.directionY = 0.5 - Math.random();
                this.directionX = 0.5 - Math.random();
            }
            update() {
                this.y += this.directionY;
                this.x += this.directionX;
            }
            draw() {
                ctx.beginPath();
                ctx.arc(this.x, this.y, 2, 0, Math.PI * 2);
                ctx.fillStyle = 'rgb(4, 167, 140)';//"#666";//randomColor();
                ctx.fill();
            }
        }

        // 获取随机颜色
        function randomColor(){
            var colors="#";
            for(var i=0;i<6;i++){
                colors+=Math.floor(Math.random()*16).toString(16);
            }
            return colors;
        }

        function createParticle() {
            var x = Math.random() * canvas.width;
            var y = Math.random() * canvas.height;
            particlesArray.push(new Particle(x, y));
        }

        function handleParticle() {
            for (var i = 0; i < particlesArray.length; i++) {
                var particle = particlesArray[i];
                particle.update();
                particle.draw();
                if (particle.x < 0 || particle.x > canvas.width || particle.y < 0 || particle.y > canvas.height) {
                    particlesArray.splice(i, 1);
                }
                for (var j = i; j < particlesArray.length; j++) {
                    dx = particlesArray[i].x - particlesArray[j].x;
                    dy = particlesArray[i].y - particlesArray[j].y;
                    long = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
                    if (long < 100) {
                        ctx.beginPath();
                        ctx.strokeStyle = 'rgba(4, 167, 140,0.5)';//"rgba(105,105,105," + (1 - long / 200) + ")"
                        ctx.moveTo(particlesArray[i].x, particlesArray[i].y);
                        ctx.lineTo(particlesArray[j].x, particlesArray[j].y);
                        ctx.lineWidth = 1;
                        ctx.stroke();
                    }
                }
            }
        }

        function draw() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            if (particlesArray.length < count) {
                createParticle();
            }
            handleParticle();
        }
        setInterval(() => {draw(),1});

    </script>
</div>
</body>
</html>
