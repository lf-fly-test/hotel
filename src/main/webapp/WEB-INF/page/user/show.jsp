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
<c:if test="${user.userLevel == 3}">
    <input type="button" value="添加管理员" onclick="add()"/>
</c:if>
查询:<input type="text" name="query" onblur="query()"/>
<table border="1px">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>职位</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>会员</th>
        <th>管理员状态</th>
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
            {"query":$("input[name='query']").val()},
            function(data){
                var html = "";
                for (var i = 0; i<data.data.length; i++){
                    var user = data.data[i];
                    html += "<tr>";
                    html += "<th>"+user.id+"</th>";
                    html += "<th>"+user.userName+"</th>";
                    html += user.userLevel == 2?"<th>管理员</th>":"<th>用户</th>";
                    html += "<th>"+user.userPhone+"</th>";
                    html += "<th>"+user.userEmail+"</th>";
                    html += user.userSex == 1?"<th>男</th>":"<th>女</th>";
                    html += user.isVip == 1?"<th>会员</th>":"<th>非会员</th>";
                    html += user.status == 1?"<th>已任命</th>":"<th>已撤职</th>";
                    html += "<th>";
                    if (${user.userLevel == 3}){
                        if (user.status == 1){
                            html += "<input type='button' value='撤职' onclick='userStatus("+user.id+",2,"+user.userLevel+")'/>";
                        }else {
                            html += "<input type='button' value='任命' onclick='userStatus("+user.id+",1,"+user.userLevel+")'/>";
                        }
                    }
                    html += "</tr>";
                }
                $("#tbd").html(html);
            }
        );
    }
    function query() {
        search();
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
    function userStatus(id,status,userLevel) {
        var index = layer.load(2, {shadeClose: false,shade: 0.5});
        $.post(
            "${ctx}/user/updateAdminStatus",
            {"status":status,"id":id,"userLevel":userLevel},
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
