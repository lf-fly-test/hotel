<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript">

        function getCode(){
            $.post(
                "<%=request.getContextPath() %>/user/getCode",
                $("#fm").serialize(),
                function(data){
                    alert(data.msg);
                    if (data.code != 200) {
                        return;
                    }
                }
            );
        }

        $(function(){
            $("#fm").validate({
                rules:{
                    userPhone:{
                        required:true,
                        isPhone:true,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByPhone",
                            data:{
                                userName:function() {
                                    return $("#userPhone").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'false'){
                                        return true;
                                    }else {
                                        return false    ;
                                    }
                                }

                            }
                        }
                    }
                },
                messages:{
                    userPhone:{
                        required:"请填写手机号码",
                        isPhone:"手机号有误",
                        remote:"手机号不存在"
                    }
                }
            })

        })
        // 手机验证
        jQuery.validator.addMethod("isPhone",
            function(value, element) {
                var userPhone = new RegExp(/^1[3578]\d{9}$/);
                return userPhone.test(value)
            }, "请正确填写您的手机号码");


        //手机号登录
        $.validator.setDefaults({
            submitHandler: function () {
                var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
                layer.msg('请稍等', {
                    icon: 1,
                    time: 2000, //2秒关闭（如果不配置，默认是3秒）
                    shade: [0.8, '#393D49']
                }, function () {
                    //do something
                    $.post("<%=request.getContextPath()%>/user/phoneLogin ",
                        $("#fm").serialize(),
                        function (data) {
                            layer.close(index);
                            if (data.code == -1) {
                                layer.msg(data.msg, {icon: 5});
                                return;
                            }
                            parent.window.location.href = "<%=request.getContextPath()%>/index/toIndex";
                        });
                });
                layer.msg("成功", {icon: 6});
            }
        });
    </script>
    <style>
        .error{
            color: red;
        }
    </style>
    <title>Insert title here</title>
<body>
<form id="fm">
    手机号：<input type="text" name="userPhone" id="userPhone" placeholder="请输入已绑定的手机号"><br/>
    验证码：<input type="text" name="code" placeholder="请输入收到的信息"><br/>
    <input type="button" value="点我发送验证码" onclick="getCode()">
    <input type="submit" value="登录" >
</form>
</body>
</html>