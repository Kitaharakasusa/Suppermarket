<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lxk.model.shopcar" %>

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
                    <%ArrayList mylist=(ArrayList) request.getAttribute("mylist");
                    %>
                    <% if(mylist.size()!=0){for (java.lang.Object cus:
                            mylist) {
                        cus=(shopcar)cus;
                    %>
                    <tr>
                        <td>
                            <%=((shopcar) cus).getGname()%>
                        </td>
                        <td>
                            <%=((shopcar) cus).getDanjia()%>
                        </td>
                        <td>
                            <%=((shopcar) cus).getGnum()%>
                        </td>
                        <td>
                            <%=(((shopcar) cus).getZongjia())%>
                        </td>
                        <td>
                            <button class="btn btn-primary"></button>
                        </td>
                    </tr>
                    <%}
                    }%>
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
                <%--<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>--%>
                <form action="/addorder" method="post">
                    <div class="form-group">
                        <label >订单地址</label>
                        <textarea  name="address" class="form-control" id="txt_manage">
                        </textarea>
                    </div>
                    <div class="form-group">
                        <label >电话</label>
                        <input type="text" name="tel" class="form-control" id="txt_sale">
                    </div>

                    <input type="submit"  class="btn btn-primary">
                </form>
            </div>
        </div>
<script>
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
    $(document).ready(function () {
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
    })
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
</body>
</html>
