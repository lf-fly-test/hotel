<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/1/16
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
<html>
<head>
    <title>登陆</title>
</head>
<body>

<img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583594308426&di=6682cf62004def14c5c2b3245c8935ef&imgtype=0&src=http%3A%2F%2Fcdn-ly.mama.cn%2F251da825b837b82f57e92e51d256623d.jpg" alt="" style="width: 100%;height: 100%;object-fit: cover">
<div align="center">
    <h1>欢迎登陆<font color="red">点金</font><font color="#1e90ff">五星级</font>宾馆</h1>
    <form id = "fm">
        用户名<input type="text" name="userName">  <input type ="button" value="登陆" onclick="login()"><br/>
        密码&nbsp;&nbsp;&nbsp;<input type = "text" name = "userPwd"> <input type ="button" value="注册" onclick="toAdd()"><br/>
    </form>
</div>
</body>
<script>

    function login() {
        var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
        layer.msg('请稍等', {
            icon: 1,
            time: 2000, //2秒关闭（如果不配置，默认是3秒）
            shade: [0.8, '#393D49']
        }, function () {
            //do something

            $.post("<%=request.getContextPath()%>/user/login ",
                $("#fm").serialize(),
                function (data) {
                    layer.close(index);
                    if (data.code == -1) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    window.location.href = "<%=request.getContextPath()%>/index/toIndex";
                });
        });
    }

    //新增
    function toAdd(){
        layer.open({
            type: 2,
            title: [
                '新增',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toAdd' //iframe的url
        });
    }
</script>
</html>
