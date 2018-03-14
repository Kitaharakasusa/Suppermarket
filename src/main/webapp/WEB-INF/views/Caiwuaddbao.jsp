<%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/30
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
    <div class="well col-md-4 col-centered col-lg-offset-4">
        <form method="post" action="/Caiwuaddbaobiao">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">开始时间</span>
                <input type="text" class="form-control" name="usta"placeholder="" aria-describedby="basic-addon1">
            </div>
            <hr>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2">结束时间</span>
                <input type="text" class="form-control" name="uend"placeholder="" aria-describedby="basic-addon2">
            </div>
            <hr>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon3">产品id</span>
                <input type="text" class="form-control" name="upid"placeholder="" aria-describedby="basic-addon3">
            </div>
            <hr>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon4">花费</span>
                <input type="text" class="form-control" name="umo"placeholder="" aria-describedby="basic-addon4">
            </div>
            <hr>
            <%--<input id="autoflag" type="hidden" value="${message}">--%>
            <button class="btn btn-lg btn-primary btn-block" type="submit">确认</button>
        </form>
    </div>
</div>
</body>
</html>
