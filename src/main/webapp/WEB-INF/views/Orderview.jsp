<%@ page import="java.util.ArrayList" %>
<%@page import="com.lxk.model.order" %>%
<%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/31
  Time: 14:17
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
<table class="table">
    <th>订单地址</th><th>订单内容</th><th>电话</th>
    <%ArrayList mylist=(ArrayList) request.getAttribute("order");
    %>
    <% if(mylist.size()!=0){for (java.lang.Object cus:
            mylist) {

        cus=(order)cus;
    %>
    <tr>
        <td>
            <%=((order) cus).getAddress()%>
        </td>
        <td>
            <%=((order) cus).getContent()%>
        </td>
        <td>
            <%=((order) cus).getTel()%>
        </td>

    </tr>
    <%}
    }%>
</table>
</body>
</html>
