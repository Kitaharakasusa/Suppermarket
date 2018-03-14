<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lxk.model.Caiwuxin" %>
<%@ page import="com.lxk.model.Goodsdaorurecord" %><%--
  Created by IntelliJ IDEA.
  User: KitaharaHaruki
  Date: 2018/1/30
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table">
    <th>人员ID</th><th>员工姓名</th><th>薪水</th><th>上次加薪日期</th><th>操作</th>
    <%ArrayList mylist=(ArrayList) request.getAttribute("mylist");
    %>
    <% if(mylist.size()!=0){for (java.lang.Object cus:
            mylist) {
        cus=(Caiwuxin)cus;

    %>
    <tr>
        <td>
            <%=((Caiwuxin) cus).getId()%>
        </td>
        <td>
            <%=((Caiwuxin) cus).getName()%>
        </td>
        <td>
            <%=((Caiwuxin) cus).getSalary()%>
        </td>
        <td>
            <%=(((Caiwuxin) cus).getChangedate())%>
        </td>
        <td>
            <div class="btn-group">
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
                                 data-target="#myModal" onclick="setm(<%=((Caiwuxin) cus).getId()%>)">
                        改一下薪水</button>
            </div>
        </td>
    </tr>
    <%}
    }%>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form action="/ChangeSalary" method="post">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改薪水</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" value="" id="hiddenid" name="uid">
                        <div class="form-group">
                            <label for="txt_manage">薪水改为</label>
                            <input type="text" name="usa" class="form-control" id="txt_manage" placeholder="">
                        </div>
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

<script>
    function setm(idstring) {
        x=document.getElementById("hiddenid");
        x.value=idstring;
    }
    $(document).ready(function () {
        var meg='<%=request.getAttribute("message")%>'
        if(meg=="su") {
            alert("修改成功")
            showAtRight("KuCunDaoru")
        }
        else if(meg=="fa")alert("修改失败");
    })
</script>

</body>
</html>
