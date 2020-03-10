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
    <title>批量添加人员信息</title>
</head>
<body>
<form id="far">

    <input type="button" value="+" onclick="batch()">
    <input type="hidden" value="${id}" name="id"></br>

    用户名：<input type="text" name="roomUserList[0].userName"><br>
    级别：<input type="radio" name="roomUserList[0].userSex" value="1" onclick="isShow(this.value,0)">男
         <input type="radio" name="roomUserList[0].userSex" value="2" onclick="isShow(this.value,0)">女<br>




    <div id="frm">

    </div>

    <input type="button" value="确定添加" onclick="add()">



</form>
</body>
<script>

    var i=0;
    function add(){
        var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2



        $.post("<%=request.getContextPath() %>/roomUser/adds",
            $("#far").serialize(),
            function(data){
                if(data.code==200){
                    layer.close(index);
                    layer.msg(data.msg,{icon: 1,time:1000},function(){
                        parent.window.location.href="<%=request.getContextPath()%>/room/toShow";
                    })

                }else{
                    layer.msg(data.msg,{icon: 5,time:1000});
                    layer.close(index);
                }

            })
    }


    function batch(){
        i++;
        var html ='<div id="divcalss"> <hr> <input type="button" value="-" onclick="delDiv(this)"/></br>';

        html+='用户名：<input type="text" name="roomUserList['+i+'].userName"><br>'
        html+='性别： <input type="radio" name="roomUserList['+i+'].userSex" value="1" onclick="isShow(this.value,'+i+')">男'
        html+=' <input type="radio" name="roomUserList['+i+'].userSex" value="2" onclick="isShow(this.value,'+i+')">女<br>'

        html+='</div>'
        html+='</div>'

        $("#frm").append(html);

    }

    function delDiv(as){
        $(as).parent("#divcalss").remove();
    }

</script>
</html>