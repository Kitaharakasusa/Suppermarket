<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <meta charset="UTF-8" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script
            src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<div class="container">
     <div class="row row-centered">
         <div class="well col-md-4 col-centered col-lg-offset-4">
        <form class="form-signin" method="post" action="/LoginVerify">
        <h2 class="form-signin-heading">请登录</h2>
        <label for="userid" class="sr-only">ID</label>
        <input type="text" name="uid" id="userid" class="form-control" placeholder="id" required="" autofocus="">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="upassword" id="inputPassword" class="form-control" placeholder="password" required="">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        </form>
         </div>
     </div>
</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

<script>
    $(document).ready(function () {
        var meg="<%=request.getAttribute("error")%>";
        if(meg=="error") {
            alert("密码或账户错误,或用户不存在");
        }
    })
</script>
</body>
</html>
