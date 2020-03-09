<%--
  Created by IntelliJ IDEA.
  User: qinbb
  Date: 2020/1/29
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Titl</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>

        $(function(){
            $("#fm").validate({
                rules:{
                    userName:{
                        required:true,
                        minlength:1,
                        maxlength:4,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#userName").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }
                            }
                        }
                    },
                    password:{
                        required:true,
                        rangelength:[3,18],
                        digits:true
                    },
                    userPwd1:{
                        required:true,
                        rangelength:[3,18],
                        digits:true,
                        equalTo:"#pwd"
                    },
                    userEmail:{
                        required:true,
                        email:true,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#userEmail").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    userPhone:{
                        required:true,
                        isPhone:true,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#userPhone").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    role:{
                        required:true,
                    },
                    sex:{
                        required:true,
                    }
                },
                messages:{
                    userName:{
                        required:"请填写姓名",
                        minlength:"最少一个字",
                        maxlength:"最多四个字",
                        remote:"姓名已存在"
                    },
                    password:{
                        required:"请填写密码",
                        rangelength:"长度不符合规则",
                        digits:"必须是整数"
                    },
                    userPwd1:{
                        required:"请填写密码",
                        rangelength:"长度不符合规则",
                        equalTo:"两次密码不统一",
                        digits:"必须是整数"
                    },
                    userEmail:{
                        required:"请填写邮箱",
                        email:"请填写正确格式邮箱",
                        remote:"邮箱已存在"
                    },
                    userPhone:{
                        required:"请填写手机号码",
                        isPhone:"手机号有误",
                        remote:"手机号已存在"
                    },
                    role:{
                        required:"最少选择一项",
                    },
                    sex:{
                        required:"最少选择一项",
                    }
                },
                errorPlacement: function(error, element) {
                    if(element.is("[name='role']")){//如果需要验证的元素名为userSex
                        error.appendTo($("#levelError"));   //错误信息增加在id为‘radio-lang’中
                        
                    }else {
                        error.insertAfter(element);//其他的就显示在添加框后
                    }
                }
            })

        })

            //注册
            $.validator.setDefaults({
                submitHandler: function () {
                    var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
                    layer.msg('请稍等', {
                        icon: 1,
                        time: 2000, //2秒关闭（如果不配置，默认是3秒）
                        shade: [0.8, '#393D49']
                    }, function () {
                        //do something
                        $.post("<%=request.getContextPath()%>/user/add ",
                            $("#fm").serialize(),
                            function (data) {
                                layer.close(index);
                                if (data.code == -1) {
                                    layer.msg(data.msg, {icon: 5});
                                    return;
                                }
                                parent.window.location.href = "<%=request.getContextPath()%>/user/toLogin";
                            });
                    });
                    layer.msg("成功", {icon: 6});
                }
            });

        // 手机验证
        jQuery.validator.addMethod("isPhone",
            function(value, element) {
                var userPhone = new RegExp(/^1[3578]\d{9}$/);
                return userPhone.test(value)
            }, "请正确填写您的手机号码");


    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<form id="fm">
    姓名<input type="text" name="userName" id="userName" /><br>
    密码<input type="text" name="userPwd" id="pwd"/><br>
    确认密码<input type="text" name="userPwd1" /><br><br>
    手机<input type="text" name="userPhone" id="userPhone" /><br>
    邮箱<input type="text" name="userEmail" id="userEmail"/><br><br>
        <input type="hidden" name="userLevel" value="1" >
    <div id="levelError" class="error" ></div><br><br>
    性别<br>
        <input type="radio" name="userSex" value="1" checked>男
        <input type="radio" name="userSex" value="2">女
         <div id="sex" class="error" ></div>
        <input type="hidden" name="isDel" value="1"><br>
    <input type="submit" value="注册" />
</form>
</body>
</html>
