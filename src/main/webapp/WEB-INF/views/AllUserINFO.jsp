<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="com.lxk.model.User" %><%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/31
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    ad>
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
    <th>员工ID</th><th>员工姓名</th><th>员工年龄</th><th>员工级别</th><th>员工住址</th>
    <%ArrayList mylist=(ArrayList) request.getAttribute("mylist");
    %>
    <% if(mylist.size()!=0){for (java.lang.Object cus:
            mylist) {

        cus=(User)cus;
    %>
    <tr>
        <td>
            <%=((User) cus).getId()%>
        </td>
        <td>
            <%=((User) cus).getName()%>
        </td>
        <td>
            <%=((User) cus).getAge()%>
        </td>
        <td>
            <%=((User) cus).getLevel()%>
        </td>
        <td>
            <%=((User) cus).getAddress()%>
        </td>
    </tr>
    <%}
    }%>
</table>
</body>
</html>
