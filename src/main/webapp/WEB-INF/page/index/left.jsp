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
<%--员工可看--%>
<c:if test="${user.id!=1}">
    <a href="<%=request.getContextPath()%>/user/toLeague" target="right"><font color="#ff69b4">餐厅加盟</font></a><br/><br/><br/>
</c:if>
<c:if test="${user.id!=1}">
    <a href="https://map.baidu.com/search/%E4%B8%89%E5%AE%B6%E4%B9%90%E6%B0%B4%E9%A5%BA/@12474124.125,4473981,19z?querytype=inf&uid=dfaf4b5ecd27079238e4a666&wd=%E4%B8%89%E5%AE%B6%E4%B9%90%E6%B0%B4%E9%A5%BA&all=1&c=327&provider=pc-aladin&da_src=shareurl" target="right"><font color="#ff69b4">总部地址信息</font></a><br/>
</c:if>
<br/><br/>
<%--老板可看--%>
<c:if test="${user.id==1}">
    <a href="<%=request.getContextPath()%>/user/toLeagueShow" target="right"><font color="#ff69b4">加盟意向展示</font></a>
<br/><br/>
<div id="demotree" class="ztree"></div>
</c:if>
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