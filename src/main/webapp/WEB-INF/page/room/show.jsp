<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/3/7
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
<html>
<head>
    <title>酒店房间查看</title>
</head>
<body>
<form>
    房间类型:<input type="text" name="roomType">
    <input type="button" value="查询" onclick="search()">

<table>
    <tr>
        <td>id</td>
        <td>房间</td>
        <td>房间类型</td>
        <td>价格</td>
        <td>状态</td>
        <td>入住人姓名</td>
        <td>操作</td>
    </tr>
    <tbody id="tb">

    </tbody>
</table>
</form>
</body>
<script>

    $(function () {
            search();
    })
    function search() {
        $.post("<%=request.getContextPath()%>/room/show",
                {},
                function (data) {
                     var html ="";
                    for (let i = 0; i <data.data.list.length ; i++) {
                        var list=data.data.list[i];
                        html +="<tr>";
                        html+="<td>"+list.id+"</td>";
                        html+="<td>"+list.room+"</td>";
                        html+="<td>"+list.roomType+"</td>";
                        html+="<td>"+list.roomPrice+"</td>";
                        html+="<td>"+list.roomStatus+"</td>";
                        html+="<td>"+list.username+"</td>";
                        html+="<td><input type='button' value='预约' onclick='subscribe("+list.id+")'></td>";
                        html+="<td><input type='button' value='审核' onclick='audit("+list.id+")'></td>";

                        html +="</tr>";
                    }
                    $("#tb").html(html);
        })
    }
    function subscribe() {
        $.post("<%=request.getContextPath()%>/room/subscribe",
                {"id":id,"roomType":1},
                function (data) {
                if(data.code==200){
                    layer.msg("预约成功,请等待审核");
                    search();
                }

        })

    }
    function audit() {
        $.post("<%=request.getContextPath()%>/room/subscribe",
            {"id":id,"roomType":2},
            function (data) {
                if(data.code==200){
                    layer.msg("审核成功");
                    search();
                }

            })

    }
</script>
</html>
