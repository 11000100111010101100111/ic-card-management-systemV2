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
