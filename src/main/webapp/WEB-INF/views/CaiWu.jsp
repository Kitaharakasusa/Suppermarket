<%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/29
  Time: 14:52
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

<div class="page-header">
    <h1>Web超市财务管理页面<small>by 黄迎港</small></h1>
</div>


<hr style="height:3px;border:none;border-top:3px groove deepskyblue;" />

<div class="container-fluid">
    <div class="row">
        <div class="span2  col-xs-12 col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active" ><a href="#">你的信息</a></li>
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        财务管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu">
                        <li><a href="#" onclick="showAtRight('Caiwuxin')"><i class="glyphicon glyphicon-plus-sign"></i>查看员工薪水</a></li>
                        <li><a href="#" onclick="showAtRight('Caiwuadd')" ><i class="glyphicon glyphicon-edit"></i>添加财务报表</a></li>
                        <li><a href="#" onclick="showAtRight('Caiwusee')" ><i class="glyphicon glyphicon-edit"></i>查看财务报表</a></li>
                        <%--<li><a href="#" >xinxi</a></li>--%>
                        <%--<li><a href="#" >xinxiii</a></li>--%>
                    </ul>
                </li>

            </ul>
        </div>
        <div class="col-md-10">
            <div id="content">

            </div>
        </div>
    </div>
</div>

<script>
    function showAtRight(url) {
        var xmlHttp;

        if (window.XMLHttpRequest) {

            xmlHttp=new XMLHttpRequest();
        }
        else {
            // code for IE6, IE5
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.onreadystatechange=function() {
            //onreadystatechange — 当readystate变化时调用后面的方法

            if (xmlHttp.readyState == 4) {
                //xmlHttp.readyState == 4	——	finished downloading response

                if (xmlHttp.status == 200) {
                    //xmlHttp.status == 200		——	服务器反馈正常

                    document.getElementById("content").innerHTML=xmlHttp.responseText;	//重设页面中id="content"的div里的内容
                    executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
                }
                //错误状态处理
                else if (xmlHttp.status == 404){
                    alert("出错了☹   （错误代码：404 Not Found），……！");

                    return;
                }
                else if (xmlHttp.status == 403) {
                    alert("出错了☹   （错误代码：403 Forbidden），……");

                    return;
                }
                else {
                    alert("出错了☹   （错误代码：" + request.status + "），……");

                    return;
                }
            }

        }


        xmlHttp.open("GET", url, true);
        xmlHttp.send();
    }
</script>
<script>
    $(document).ready(function () {
        var meg='<%=request.getAttribute("message2")%>'
        if(meg=="su") {
            alert("添加成功")
            showAtRight("KuCunDaoru")
        }
        else if(meg=="fa")alert("添加失败");
    })
    $(document).ready(function () {
        var meg='<%=request.getAttribute("message")%>'
        if(meg=="su") {
            alert("添加报表成功")
            showAtRight("KuCunDaoru")
        }
        else if(meg=="fa")alert("添加报表失败");
    })
</script>
</body>
</html>
