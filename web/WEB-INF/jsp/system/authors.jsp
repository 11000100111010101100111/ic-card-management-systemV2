<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/16
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.2.2/dist/echarts.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body style="height: 100%; margin: 0">
    <div id="container" style="height: 100%"></div>
    <script>
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};

        var option;
        var ROOT_PATH =
            'https://cdn.jsdelivr.net/gh/apache/echarts-website@asf-site/examples';


        option = {
            backgroundColor: '#000',
            globe: {
                baseTexture: ROOT_PATH + '/data-gl/asset/world.topo.bathy.200401.jpg',
                heightTexture: ROOT_PATH + '/data-gl/asset/world.topo.bathy.200401.jpg',
                displacementScale: 0.04,
                shading: 'realistic',
                environment: ROOT_PATH + '/data-gl/asset/starfield.jpg',
                realisticMaterial: {
                    roughness: 0.9
                },
                postEffect: {
                    enable: true
                },
                light: {
                    main: {
                        intensity: 5,
                        shadow: true
                    },
                    ambientCubemap: {
                        texture: ROOT_PATH + '/data-gl/asset/pisa.hdr',
                        diffuseIntensity: 0.2
                    }
                }
            }
        };


        if (option && typeof option === 'object') {
            myChart.setOption(option);
        }
    </script>
</body>
</html>
