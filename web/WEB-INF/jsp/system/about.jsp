<%--
  Created by IntelliJ IDEA.
  User: 波罗的海
  Date: 2021/11/17
  Time: 14:27
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
    <title>关于我们</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>

</body>
</html>
