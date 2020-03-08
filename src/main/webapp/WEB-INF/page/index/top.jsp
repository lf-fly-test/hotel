<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>

		<h1 align="center">欢迎<font color="#ff69b4 ">${user.userName}</font>登录<font color="#FFFF00 "></font>点金五星级宾馆</h1>
		
		<div align="right"><a href="<%=request.getContextPath() %>/user/exitLoginUser"><font color="red">退出登录</font></a></div>
	
		<div id="datetime" align="right" style="color:black">
		 <script>
	 			setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
	 	  </script>
		</div>
		
		
</body>
</html>