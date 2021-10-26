<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/10/23
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css"  href="http://localhost:8080/nchkkjxy/theame/css/baseCss.css">
    <title>${title}失败</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            /* background: #333; */
            overflow: hidden;
            /* filter: blur(px); */
        }
        #canvas {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        }
        .back{
            position: fixed;
            width: 500px;
            height: 500px;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            border-radius: 100%;
            background-color: rgba(0,0,0,0.3);
            z-index: 1;
        }

        .msg-panel{
            position: absolute;
            width: 50%;
            height: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 5px;
            /* box-shadow: 0 0 12px #2b92d4; */
            border:2px dashed #2b92d4;

            background-color: rgba(255,255,255,0.78);
            z-index: 99;
        }
        .msg-panel>.logo{
            display: inline-block;
            position: fixed;
            transform: translate(20px,21px);
            margin: 0;
            padding: 1px 2px 1px 2px;
            border-radius: 5px;
            /*border: 1px solid #fff;*/
            background-color: #2b92d4;
            color: #fff;
            font-weight: 800;
        }
        .msg-panel *{
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .msg-panel>h1{
            text-align: center;
        }
        .msg-panel>span{
            position:absolute;
            width: 98%;
            left: 1%;
            margin: 0;
            height: 1px;
            background-color: #ccc;
        }
        .msg-panel>.img{
            position:relative;
            width: 200px;
            height: 200px;
            left: 50%;
            transform: translateX(-50%);
            margin-top: 45px;
            background: url("${icon}") no-repeat center;
            background-size: cover;
        }
        .msg-panel>p{
            color: red;
            font-weight: bold;
            text-align: center;
            margin: 1px;
        }
        .ball
        {
            width:8px;
            height:8px;
            background:#2b92d4;
            border-radius:4px;
            left:50%;
            top:50%;
            transform: translate(-50%,-50%);
            box-shadow: 0 0 10px #2b92d4;
            position:absolute;
            -webkit-animation:action 20s linear infinite;
        }
        @-webkit-keyframes action
        {
            from{transform: rotate(0deg)  translate(250px) rotate(0deg);}
            to{transform: rotate(360deg) translate(258px) rotate(-360deg);}
        }
    </style>
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
<%--    <div class="arc-point arc-point-top"></div>--%>
    <p>${detil}</p>
<%--    <div class="arc-point arc-point-bottom"></div>--%>
</div>
</body>
<script>
    var canvas = document.getElementById("canvas")
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
    var ctx = canvas.getContext("2d")
    var particlesArray = []
    var count = parseInt(1.5*canvas.height / 100 * canvas.width / 100)
    class Particle {
        constructor(x, y) {
            this.x = x
            this.y = y
            this.directionY = 0.5 - Math.random()
            this.directionX = 0.5 - Math.random()
        }
        update() {
            this.y += this.directionY
            this.x += this.directionX
        }
        draw() {
            ctx.beginPath()
            ctx.arc(this.x, this.y, 2, 0, Math.PI * 2)
            ctx.fillStyle = "#666";//randomColor();
            ctx.fill()
        }
    }

    // 获取随机颜色
    function randomColor(){
        var colors="#";
        for(var i=0;i<6;i++){
            colors+=Math.floor(Math.random()*16).toString(16)
        }
        return colors
    }

    function createParticle() {
        var x = Math.random() * canvas.width
        var y = Math.random() * canvas.height
        particlesArray.push(new Particle(x, y))
    }

    function handleParticle() {
        for (var i = 0; i < particlesArray.length; i++) {
            var particle = particlesArray[i]
            particle.update()
            particle.draw()
            if (particle.x < 0 || particle.x > canvas.width || particle.y < 0 || particle.y > canvas.height) {
                particlesArray.splice(i, 1)
            }
            for (var j = i; j < particlesArray.length; j++) {
                dx = particlesArray[i].x - particlesArray[j].x
                dy = particlesArray[i].y - particlesArray[j].y
                long = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2))
                if (long < 100) {
                    ctx.beginPath()
                    ctx.strokeStyle = "rgba(105,105,105," + (1 - long / 200) + ")"
                    ctx.moveTo(particlesArray[i].x, particlesArray[i].y)
                    ctx.lineTo(particlesArray[j].x, particlesArray[j].y)
                    ctx.lineWidth = 1
                    ctx.stroke()
                }
            }
        }
    }

    function draw() {
        ctx.clearRect(0, 0, canvas.width, canvas.height)
        if (particlesArray.length < count) {
            createParticle()
        }
        handleParticle()
    }
    setInterval(() => {
        draw(),1
    })

</script>
</html>
