<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Titl</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/md5/md5-min.js"></script>
    <script src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/layui-v2.5.5/layui/css/layui.css"  media="all">

    <title>展示</title>
</head>
<script>
    $(function(){
        show();
    })


    var totalNum=0;
    function show(){
        $.post("<%=request.getContextPath()%>/roomUser/show",
            $("#fm").serialize(),
            function (data) {
                if (data.code != 200){
                    layer.msg(data.data.msg);
                    return;
                }
                var html = "";
                totalNum = data.data.totalNum;
                for (var i = 0; i < data.data.data.length; i++) {
                    var list =data.data.data[i];


                    html += "<tr>";
                    html += "<td>";
                    html += "<input type = 'checkbox' name = 'id' value = '"+list.id+"'>";
                    html += "<input type = 'hidden' id = '"+list.id+"' value = '"+list.isDel+"'/>"
                    html += "</td>";
                    html += "<td>"+list.id+"</td>";
                    html += list.userSex ==1 ? "<td>男</td>" : "<td>女</td>";
                    html += "<td>"+list.userName+"</td>";
                    html += "<td>"+list.room+"</td>";
                    html += "<td>"+list.roomType+"</td>";
                    html += "<td>"+list.roomStatusShow+"</td>";
                    html += "<td>"+list.startTime+"</td>";


                    html += "<td>"+list.endTime+"</td>";

                    html += "</tr>";
                }
                $("#tbd").html(html);
                var pageNo = $("#pageNo").val();
                var pageHtml = "<input type='button' value='上一页' onclick='page("+(parseInt(pageNo) - 1)+")'>";
                pageHtml += "<input type='button' value='下一页' onclick='page("+(parseInt(pageNo) + 1)+")')'>";
                $("#pageInfo").html(pageHtml);
            })
    }

    //分页
    function page(page) {

        if (page < 1) {
            layer.msg('已到首页', {icon:0});
            return;
        }
        if (page > totalNum) {
            layer.msg('已经到尾页', {icon:0});
            return;
        }
        $("#pageNo").val(page);
        show();

    }




    //上/下架
    function updateStatus(){
        var len = $("input[name='id']:checked").length;
        if(len <= 0){
            layer.msg("请选择一项", {icon: 0});
            return;
        }
        if(len > 1){
            layer.msg("只能选择一项", {icon: 0});
            return;
        }
        //id
        var id = "";
        $("input[name='id']:checked").each(function (index, item) {
            if ($("input[name='id']:checked").length-1==index) {
                id += $(this).val();
            }
        });
        //上线时间
        var data = $("#"+id+"s").val();
        //状态 = # + 状态ID.value
        var sta = $("#"+id).val();
        //设置全局变量,往后台传值1/2
        var statu;
        var msg1 = "您确定要设置为";
        if(sta == 1){
            msg1 += "下架吗？";
            statu = 0;
        } else {
            msg1 += "上架吗？";
            statu = 1;
        }
        layer.confirm(msg1, {icon: 3, title:'提示'}, function(index){
            //do something
            $.post("<%=request.getContextPath()%>/sell/updateStatus",
                {"id":id,"isDel":statu},
                function(data){
                    if (data.code == -1){
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg(data.msg, {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        show();
                    });
                });

            layer.close(index);
        });
    }




</script>
<body>
<form id="fm">

    <input type="hidden" value="1" id="pageNo" name="pageNo">

    <div align="center">



        用户姓名：<input type="text" name="userName"><br>
        房间号：<input type="text" name="room1"><br>

        <%--入住时间

        <input type="text" id="d241" name="agemin" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH-mm-ss'})" class="Wdate" style="width:300px"/>
        退房时间
        <input type="text" id="d242" name="agemax" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH-mm-ss'})" class="Wdate" style="width:300px"/>--%>
        <input type="button" value="搜索" onclick="show()">


    </div>
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
<div id="pageInfo">

</div>
</body>
</html>
