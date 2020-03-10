<%--
  Created by IntelliJ IDEA.
  User: bj-lx
  Date: 2020/3/9
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/page/common/taglibs.jsp" %>
<html>
<head>
    <title>管理员展示</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/res/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/validate/messages_zh.js"></script>
</head>
<body>
<input type="button" value="添加管理员" onclick="add()"/>
<table border="1px">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>职位</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <tbody id="tbd"></tbody>
</table>
</body>
<script type="text/javascript">
$(function(){
    search();
})
    function search() {
        $.post(
            "${ctx}/user/adminShow",
            {},
            function(data){
                for (var i = 0; i<data.data.length; i++){
                    var user = data.data[i];
                    var html = "";
                    html += "<tr>";
                    html += "<th>"+user.id+"</th>";
                    html += "<th>"+user.userName+"</th>";
                    html += "<th>管理员</th>";
                    html += "<th>"+user.userPhone+"</th>";
                    html += "<th>"+user.userEmail+"</th>";
                    html += user.userSex == 1?"<th>男</th>":"<th><女/th>";
                    html += user.isDel == 1?"<th>任命</th>":"<th>撤职</th>";
                    html += "<th>";
                    if (user.isDel == 1){
                        html += "<input type='button' value='撤职' onclick='userStatus("+user.id+",2)'/>";
                    }else {
                        html += "<input type='button' value='任命' onclick='userStatus("+user.id+",1)'/>";
                    }
                    html += "</th>";
                }
                $("#tbd").html(html);
            }
        );
    }
function add(){
    layer.open({
        type: 2,
        title: [
            '添加管理员',
            'background-color:#8DCE16; color:#fff;'
        ],
        shadeClose: true,
        shade: 0.3,
        area: ['380px', '80%'],
        content: '<%=request.getContextPath()%>/user/toAdminAdd' //iframe的url
    });
}
function userStatus(id,isDel) {
    var index = layer.load(2, {shadeClose: false,shade: 0.5});
    $.post(
        "${ctx}/user/updateAdminStatus",
        {"isDel":isDel,"id":id},
        function (data) {
            layer.close(index);
            if (data.code == -1) {
                layer.msg(data.msg,function(){});
                return;
            }
            layer.alert(data.msg, {icon: 6},function (){
                window.location.href = "${ctx}/user/toAdminShow";
            });

        }
    );
}
</script>
</html>
