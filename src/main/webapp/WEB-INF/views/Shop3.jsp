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
                        购物
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu">
                        <li><a href="#" onclick="showAtRight('mainright')"><i class="glyphicon glyphicon-plus-sign"></i>商品列表</a></li>
                        <li><a href="#" onclick="showAtRight('myshopcar')"><i class="glyphicon glyphicon-plus-sign"></i>购物车</a></li>

                    </ul>
                </li>
                <li>
                    <a href="#Order" class="nav-header collapsed" data-toggle="collapse">
                        订单管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="Order" class="nav nav-list collapse secondmenu">
                        <li><a href="#"ONCLICK="showAtRight('getorder')"><i class="glyphicon glyphicon-bookmark"></i>我的订单</a></li>

                    </ul>
                </li>
            </ul>
        </div>

        <%--以上是左部导航栏的内容--%>
        <div class="col-md-10">
            <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
            <div id="content">
            </div>
        </div>

    </div>
</div>

<%--右部显示--%>

<%ArrayList<Goodsinsale>salecarlist=new ArrayList<Goodsinsale>();%>
<%--购物车--%>


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
    function setm(id) {
        x=document.getElementById("hiddenid")
        x.value=id;
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
