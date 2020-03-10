<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/zTree_v3/js/jquery.ztree.all.min.js"></script>
</head>
<body align="center"  lay-size="10px">

<a href="<%=request.getContextPath()%>/room/toShow" target="right">房间信息查询</a>
<%--    <a href="<%=request.getContextPath()%>/user/toShow" target="right">用户管理展示</a>--%>
<%--员工可看--%>
<c:if test="${user.id!=1}">

</c:if>
<c:if test="${user.id!=1}">

</c:if>
<br/><br/>
<%--老板可看--%>
    <a href="<%=request.getContextPath()%>/room/toRoomUserShow" target="right"><h1>用户入住信息</h1></a>
<br/><br/>
<div id="demotree" class="ztree"></div>

</body>
<script>

    var setting = {
        data: {
            simpleData: {
                enable: true,	//开启简单数据格式
                //上级Id
                pIdKey: "pid",
                idKey: "id",
                open:true
            },
            key : {
                //名称
                name : "resourceName",
                url: "xUrl"
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) { // 匿名函数
                parent.right.location.href = "<%=request.getContextPath()%>" + treeNode.url;
            }
        },

    };

    $(document).ready(function(){
        $.post(
            "<%=request.getContextPath()%>/resource/left",
            {},
            function (data) {
                $.fn.zTree.init($("#demotree"),setting, data.data);
                var treeObj = $.fn.zTree.getZTreeObj("demotree");
                treeObj.expandAll(true);
            }
        )
    });
</script>
</html>