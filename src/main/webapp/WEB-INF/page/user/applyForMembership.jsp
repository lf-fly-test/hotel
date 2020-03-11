<%--
  Created by IntelliJ IDEA.
  User: chengch
  Date: 2020/3/10
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
</head>
<body>
    <form id="frm">
        <input type="hidden" name="id" value="${user.id}">
        <input type="radio" name="vipLevel" value="1">黄金
        <input type="radio" name="vipLevel" value="2">白金
        <input type="radio" name="vipLevel" value="3">黑金<br/>
        <input type="button" value="办理" onclick="bl()">
    </form>
</body>
<script type="text/javascript">
    function bl() {
        var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
        layer.msg('请稍等', {
            icon: 1,
            time: 2000, //2秒关闭（如果不配置，默认是3秒）
            shade: [0.8, '#393D49']
        }, function () {
            //do something
            $.post("<%=request.getContextPath()%>/user/applyForMembership",
                $("#frm").serialize(),
                function (data) {
                    layer.close(index);
                    if (data.code == -1) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    parent.window.location.href = "<%=request.getContextPath()%>/user/toShow";
                });
        });
    }

</script>
</html>
