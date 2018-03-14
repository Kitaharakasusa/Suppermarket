<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn" class="no-js">
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

<div class="page-header">
    <h1>Web超市购物页面<small>by 黄迎港</small></h1>
</div>


<hr style="height:3px;border:none;border-top:3px groove deepskyblue;" />

<div class="container-fluid">
    <div class="row">
        <div class="span2  col-xs-12 col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active" ><a href="#">你的信息</a></li>
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        客户管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu">
                        <li><a href="#" onclick="SetURl('gotocreatecust')"><i class="glyphicon glyphicon-plus-sign"></i>创建客户</a></li>
                        <li><a href="#" onclick="SetURl('gotogetallcust')" ><i class="glyphicon glyphicon-edit"></i>更改用户信息</a></li>
                        <%--<li><a href="#" >xinxi</a></li>--%>
                        <%--<li><a href="#" >xinxiii</a></li>--%>
                    </ul>
                </li>
                <li>
                    <a href="#Salemanage" class="nav-header collapsed" data-toggle="collapse">
                        销售机会
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="Salemanage" class="nav nav-list collapse secondmenu">
                        <li><a href="#" onclick="SetURl('goto_create_sale_plan')"><i class="glyphicon glyphicon-plus-sign"></i>创建销售机会</a></li>
                        <li><a href="#" onclick="SetURl('goto_get_all_sale')"><i class="glyphicon glyphicon-th-list"></i>查看所有销售机会</a></li>
                        <li><a href="# "onclick="SetURl('goto_wait_asign_plan')"><i class="glyphicon glyphicon-remove"></i>未经指派的机会</a></li>
                        <%--<li><a href="#" >xinxi</a></li>--%>
                        <%--<li><a href="#" >xinxiii</a></li>--%>
                    </ul>
                </li>
                <li>
                    <a href="#Mysalechance" class="nav-header collapsed" data-toggle="collapse">
                        我的销售机会
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="Mysalechance" class="nav nav-list collapse secondmenu">
                        <li><a href="#" onclick="SetURl('get_my_chance_by_dueto')"><i class="glyphicon glyphicon-bookmark"></i>我的销售机会</a></li>
                        <li><a href="#" onclick="SetURl('get_my_sale_plan')"><i class="glyphicon glyphicon-star"></i>我创建的
                        销售计划</a></li>
                        <li><a href="#" onclick="SetURl('getall_mycust')"><i class="glyphicon glyphicon-th-list"></i>我的客户
                        </a></li>
                        <%--<li><a href="#" >xinxi</a></li>--%>
                        <%--<li><a href="#" >xinxiii</a></li>--%>
                    </ul>
                </li>
                <li>
                    <a href="#Order" class="nav-header collapsed" data-toggle="collapse">
                        订单管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="Order" class="nav nav-list collapse secondmenu">
                        <li><a href="#"ONCLICK="SetURl('get_my_orders')"><i class="glyphicon glyphicon-bookmark"></i>我的订单</a></li>
                        <li><a href="#"onclick="SetURl('get_all_orders')"><i class="glyphicon glyphicon-list-alt"></i>所有订单</a></li>
                    <%--<li><a href="#" >xinxi</a></li>--%>
                        <%--<li><a href="#" >xinxiii
                    </ul></a></li>--%>
                </li>

            </ul>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <iframe src="" id="myTestFrameID" height="100%"width="100%">

            </iframe>
        </div>

    </div>
</div>

<div class="container-fluid">this is footer</div>


</body>
<script>
    function  SetURl(url){
        document.getElementById('myTestFrameID').src="/"+url;

    }
</script>
</html>