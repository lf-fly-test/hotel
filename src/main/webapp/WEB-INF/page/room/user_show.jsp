<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/My97DatePicker/skin/WdatePicker.css"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/css/layui.css"  media="all">
<html>

<head>

    <title>展示</title>
</head>
<script>
    $(function(){
        show();
    })



    function show(){
        $.post("<%=request.getContextPath()%>/roomUser/show",
            $("#fm").serialize(),
            function (data) {
                if (data.code != 200){
                    layer.msg(data.data.msg);
                    return;
                }
                var html = "";

                for (var i = 0; i < data.data.data.length; i++) {
                    var list =data.data.data[i];


                    html += "<tr>";
                    html += "<td>";
                    html += "<input type = 'checkbox' name = 'id' value = '"+list.id+"'>";
                    html += "<input type = 'hidden' id = '"+list.id+"' value = '"+list.isDel+"'/>"
                    html += "</td>";
                    html += "<td>"+list.id+"</td>";
                    html += "<td>"+list.userName+"</td>";
                    html += list.userSex ==1 ? "<td>男</td>" : "<td>女</td>";
                    html += "<td>"+list.room+"</td>";
                    html += "<td>"+list.roomType+"</td>";
                    html += "<td>"+list.roomStatusShow+"</td>";
                    html += "<td>"+list.startTime+"</td>";


                    html += "<td>"+list.endTime+"</td>";

                    html += "</tr>";
                }
                $("#tbd").html(html);

            })
    }



</script>
<body>
<form id="fm">
    <input type="hidden" name="room" value="${room}">

</form>
<table  class="layui-table">
    <colgroup>
        <col width="100">
        <col width="100">
        <col width="100">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th >√</th>
        <th >编号</th>
        <th >入住人员名称</th>
        <th >性别</th>
        <th >房间号</th>
        <th >房间类型</th>
        <th >入住状态</th>
        <th >入住时间</th>
        <th >退房时间</th>



    </tr>
    </thead>
    <tbody id = "tbd">
    </tbody>
</table>

</body>
</html>
