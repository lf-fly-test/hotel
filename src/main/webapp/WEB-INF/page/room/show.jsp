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
<form id="fm">
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
    var  level= ${user.userLevel}

        $(function () {
            search();
        });
    function search() {
        $.post("<%=request.getContextPath()%>/room/show",
            $("#fm").serialize(),
            function (data) {
                var html ="";
                for (let i = 0; i <data.data.list.length ; i++) {
                    var list=data.data.list[i];
                    html +="<tr>";
                    html+="<td>"+list.id+"</td>";
                    html+="<td>"+list.room+"</td>";
                    html+="<td>"+list.roomType+"</td>";
                    html+="<td>"+list.roomPrice+"</td>";
                    if (list.roomStatus==0){
                        html+="<td>空闲</td>"
                    }
                    if (list.roomStatus==1){
                        html+="<td>预约中</td>"
                    }
                    if (list.roomStatus==2){
                        html+="<td>预约成功</td>"
                    }
                    html+="<td>"+list.userName+"</td>";
                    if (level == 1 && list.roomStatus==0){
                        html+="<td><input type='button' value='预约' onclick='subscribe("+list.id+")'></td>";
                    }

                    if (level == 2 && list.roomStatus==1){
                        html+="<td><input type='button' value='审核' onclick='audit("+list.id+")'></td>";
                    }
                    if (level != 1 ){
                        html+="<td><input type='button' value='详情' onclick='chakan("+list.room+")'></td>";
                    }
                    if (level != 1  && list.roomStatus==2 ){
                        html+="<td><input type='button' value='退房' onclick='updel("+list.id+","+list.room+")'></td>";
                    }
                    if (level != 1   && list.roomStatus==2 ){
                        html+="<td><input type='button' value='添加' onclick='adds("+list.id+","+list.room+")'></td>";
                    }

                    html +="</tr>";
                }
                $("#tb").html(html);
            })
    }
    function subscribe(id) {
        $.post("<%=request.getContextPath()%>/room/update",
            {"id":id,"roomStatus":1},
            function (data) {
                if(data.code==200){
                    layer.msg("已预约,等待审核");
                    search();
                }else{
                    layer.msg(data.msg);
                }

            })

    }
    function audit(id) {
        $.post("<%=request.getContextPath()%>/room/updateStatus",
            {"id":id,"roomStatus":2},
            function (data) {
                if(data.code==200){
                    layer.msg("审核成功");
                    search();
                }else{
                    layer.msg(data.msg);
                }

            })

    }
    //详情
    function chakan(room){
        layer.open({
            type: 2,
            title: '页面',
            shadeClose: true,
            shade: 0.8,
            area: ['500px', '90%'],
            content: '<%=request.getContextPath()%>/room/toUserShow/'+room
        });
    }
    //退房
    function updel(id,room) {
        $.post("<%=request.getContextPath()%>/roomUser/update",
            {"id":id,"room":room},
            function (data) {
                if(data.code==200){
                    layer.msg("退房成功");
                    search();
                }else{
                    layer.msg(data.msg);
                }

            })

    }

    //添加人员信息
    function adds(id){
        layer.open({
            type: 2,
            title: '添加页面',
            shadeClose: true,
            shade: 0.8,
            area: ['500px', '90%'],
            content: '<%=request.getContextPath()%>/room/toAdd/'+id
        });
    }

</script>
</html>