<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lxk.model.Goodsinsale" %><%--
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
    <h1>Web超市购物页面<small>by 黄迎港</small></h1>
</div>


<hr style="height:3px;border:none;border-top:3px groove deepskyblue;" />

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-pills nav-stacked">
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse" >
                        我的购物车
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu">
                        <li><a href="#" data-toggle="modal"
                               data-target="#myModal"><i class="glyphicon glyphicon-plus-sign"></i>购物车</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#Order" class="nav-header collapsed" data-toggle="collapse">
                        订单管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="Order" class="nav nav-list collapse secondmenu">
                        <li><a href="#"ONCLICK="SetURl('get_my_orders')"><i class="glyphicon glyphicon-bookmark"></i>我的订单</a></li>
                        </li>

                    </ul>
                </li>
            </ul>
        </div>

        <%--以上是左部导航栏的内容--%>
        <div class="col-md-10">
            <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
            <div id="content">
                <table class="table">
                    <th>产品编号</th><th>产品名</th><th>剩余数量</th><th>生产地址</th><th>原价</th><th>折后价</th><th>操作</th>
                    <%ArrayList mylist=(ArrayList) request.getAttribute("arraylist");
                    %>
                    <% if(mylist.size()!=0){for (java.lang.Object cus:
                            mylist) {
                        cus=(Goodsinsale)cus;
                    %>
                    <tr>
                        <td>
                            <%=((Goodsinsale) cus).getId()%>
                        </td>
                        <td>
                            <%=((Goodsinsale) cus).getName()%>
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
                        <td>
                            <%=((Goodsinsale) cus).getCountprice()%>
                        </td>
                        <td>
                           <button type="button" class="btn btn-primary " onclick="addShopping(this)">
                                加入购物车</button>
                            <%--setm(<%=((Goodsinsale) cus).getId()%>,<%=((Goodsinsale) cus).getName()%>,<%=((Goodsinsale) cus).getCountprice()%>)--%>
                        </td>
                    </tr>
                    <%}
                    }%>
                </table>
            </div>
        </div>

</div>
</div>

<%--右部显示--%>

<%ArrayList<Goodsinsale>salecarlist=new ArrayList<Goodsinsale>();%>
<%--购物车--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="/sava_my_chance_plan" method="post">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">我的购物车</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="" id="hiddenid" name="cid">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>商品</td>
                            <td>单价</td>
                            <td>数量</td>
                            <td>金额</td>
                            <td>删除</td>
                        </tr>
                        </thead>
                        <tbody id="goods">
                        <!--
                            <tr>

                                <td>罗技鼠标</td>
                                <td>80</td>
                                <td>
                                <input type="button" value="-"/>
                                <input type="text" size="3" readonly="readonly"/>
                                <input type="button" value="+"/>
                                </td>
                                <td>80</td>
                                <td align="center">
                                <input type="button" value="*"/>
                                </td>
                            </tr>-->
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="3" align="right">总计</td>
                            <td></td>
                            <td></td>
                            <td><input id="total" type="text"></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <input type="submit"  class="btn btn-primary"
                    >
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function total1(){
        var trs = $("#goods tr");
        var sum=0;
        for(var i=0;i<trs.length;i++){
            var td = trs.eq(i).children().eq(3);
            var price = parseInt($(td).text());
            //alert(price);
            sum = sum + price;
        }
        console.log(sum);
        var x=document.getElementById("total");
        x.value=sum;
        //$("#total").text(sum);
    }
    function setma(id,name,price) {
        alert("!11")
        alert(id)
        alert(name)
        alert(price)
        var testtable = document.getElementById("mytable");
        var nowtr=document.createEventObject("tr")
        var nowtd1=document.createEventObject("td");
        var nowtd2=document.createEventObject("td");
        var nowtd3=document.createEventObject("td");

        nowtr.appendChild(nowtd1);
        nowtr.appendChild(nowtd2);
        nowtr.appendChild(nowtd3);

        testtable.appendChild(nowtr);
        var nowtd1te = document.createTextNode(id);
        var nowtd2te=document.createTextNode(name);
        var nowtd3te=document.createTextNode(price);
        nowtd1.appendChild(nowtd1te);
        nowtd2.appendChild(nowtd2te);
        nowtd3.appendChild(nowtd3te);
    }

    function addShopping(btn){
        var tds=$(btn).parent().siblings();//获取当前元素的父节点的全部兄弟节点，就是当前这行的所有td
        var name=$(tds).eq(1).text();//获取商品名称的td的文本值
        var price=$(tds).eq(5).text();//获取商品价格的td的文本值
        var html = $("<tr>"    //开始拼接HTML元素，将取到的东西展示到对用的input中
            +"<td>"+name+"</td>"
            +"<td>"+price+"</td>"
            +"<td>"
            +"<input type='button' value='-' onclick='decrease(this)'/>"
            +"<input type='text' size='3' readonly='readonly' value='1'/>"
            +"<input type='button' value='+' onclick='increas(this)'/>"
            +"</td>"
            +"<td>"+price+"</td>"
            +"<td align='center'>"
            +"<input type='button' value='*' onclick='deletShopping(this)'/>"
            +"</td></tr>");
        $("#goods").append(html);
        total1();
    }
    function deletShopping(btn){//给上一步你拼接的删除按钮上绑定一个这样的方法
        $(btn).parent().parent().remove();
        total1();
    }
    function increas(btn){
        var text=$(btn).prev();
        var acount = parseInt($(text).val());
        $(text).val(++acount);
        //获取单价
        var tds = $(text).parent().siblings();
        var price = parseInt($(tds).eq(1).text());
        //获取总价
        var sum = price*acount;
        $(tds).eq(2).text(sum);
        total1();
    }
    function decrease(btn){
        var text=$(btn).next();
        var acount = parseInt($(text).val());
        $(text).val(--acount);
        if(acount<1){
            return;
        }
        //获取单价
        var tds = $(text).parent().siblings();
        var price = parseInt($(tds).eq(1).text());

        //获取总价
        var sum = price*acount
        $(tds).eq(2).text(sum);
        total1();
    }

</script>

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
    </body>
</html>
