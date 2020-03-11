<%--
  Created by IntelliJ IDEA.
  User: chengch
  Date: 2020/3/10
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/md5/md5-min.js"></script>
    <script src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/css/layui.css"  media="all">
</head>
<body>
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col>
        </colgroup>
        <thead>
            <tr>
                <td>id</td>
                <td>姓名</td>
                <td>级别</td>
                <td>手机</td>
                <td>邮箱</td>
                <td>性别</td>
                <td>是否为vip</td>
                <td>vip等级</td>
                <td>vip积分</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody id="tbd">

        </tbody>
    </table>
</body>
<script type="text/javascript">
    $(function(){
        showUser();
    })
    function showUser(){
        $.post(
            "<%=request.getContextPath()%>/user/show",
            {},
            function(data){
                var html = "";
                for (var i = 0; i <data.data.userList.length ; i++) {
                    var user=data.data.userList[i];
                    html +="<tr>";
                    html+="<td>"+user.id+"</td>";
                    html+="<td>"+user.userName+"</td>";
                    if(user.userLevel == 1){
                        html+="<td>用户</td>";
                    } else if(user.userLevel == 2){
                        html+="<td>管理员</td>";
                    } else {
                        html+="<td>老板</td>";
                    }
                    html+="<td>"+user.userPhone+"</td>";
                    html+="<td>"+user.userEmail+"</td>";
                    html += user.userSex == 1 ? "<td>男</td>" : "<td>女</td>";
                    html+="<td>"+user.isVip+"</td>";
                    if(user.vipLevel == 1){
                        html+="<td>黄金</td>";
                    } else if(user.vipLevel == 2){
                        html+="<td>白金</td>";
                    } else if(user.vipLevel == 3){
                        html+="<td>黑金</td>";
                    } else{
                        html+="<td>暂无</td>"
                    }
                    html += user.vipPoints == null ? "<td>暂无积分</td>" : "<td>"+user.vipPoints+"</td>";
                    if(user.userLevel == 1 && user.isVip != 1){
                        html+="<td><input type='button' value='办会员' onclick='bhy("+user.id+")'></td>";
                    }
                    html +="</tr>";
                }
                $("#tbd").html(html);
            }
        )
    }

    function bhy(id) {
        layer.open({
            type: 2,
            title: [
                '会员办理',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toApplyForMembership?id='+id //iframe的url
        });
    }
</script>
</html>
