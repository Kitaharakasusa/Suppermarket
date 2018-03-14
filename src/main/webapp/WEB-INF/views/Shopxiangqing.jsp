<%@ page import="com.lxk.model.Goodsinsale" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/31
  Time: 11:11
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

<form action="/addshopcar" method="post">
    <table class="table">
        <th>产品编号</th><th>产品名</th><th>剩余数量</th><th>生产地址</th><th>原价</th><th>折后价</th><th>数目选择</th><th>操作</th>

        <%
            Goodsinsale cus= (Goodsinsale) request.getAttribute("goodsinfo");
        %>
        <tr>

        </tr>
        <tr>
            <td >
                <%=cus.getId()%>
                <input type="hidden"name="gid"value="<%=cus.getId()%>">
            </td>
            <td>
                <%=((Goodsinsale) cus).getName()%>
                <input type="hidden"name="gname" value="<%=((Goodsinsale) cus).getName()%>">
            </td>
            <td>
                <%=((Goodsinsale) cus).getNumber()%>
            </td>
            <td>
                <%=(((Goodsinsale) cus).getProductaddress())%>
            </td>
            <td>
                <%=((Goodsinsale) cus).getPrice()%>
            </td>
            <td >
                <%=((Goodsinsale) cus).getCountprice()%>
                <input type="hidden"name="danjia"value="<%=((Goodsinsale) cus).getCountprice()%>">
            </td>
            <td>
                <input type='button' value='-' onclick='decrease(this)'/>
                <input name="gnum" type='text' size='3' readonly='readonly' value='1'/>
                <input type='button' value='+' onclick='increas(this)'/>
            </td>
            <td>
                <button type="submit" class="btn btn-primary " onclick="">
                    加入购物车</button>
                <%--setm(<%=((Goodsinsale) cus).getId()%>,<%=((Goodsinsale) cus).getName()%>,<%=((Goodsinsale) cus).getCountprice()%>)--%>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
