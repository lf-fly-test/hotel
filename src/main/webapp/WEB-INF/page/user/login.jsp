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
<script src="<%=request.getContextPath()%>/res/validate/jquery.validate.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<html>
<head>
    <title>登陆</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap {height: 300px;width:150%;overflow: hidden;}
        #result {width:100%;font-size:12px; }
        dl,dt,dd,ul,li{
            margin:0;
            padding:0;
            list-style:none;
        }
        dt{
            font-size:14px;
            font-family:"微软雅黑";
            font-weight:bold;
            border-bottom:1px dotted #000;
            padding:5px 0 5px 5px;
            margin:5px 0;
        }
        dd{
            padding:5px 0 0 5px;
        }
        li{
            line-height:28px;
        }
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=gXbO3YIOYmuTq0uqC9DmXAmvUxYOsYmx"></script>
    <script type="text/javascript" src="//api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="//api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <title>带检索功能的信息窗口</title>
</head>
<body>


    <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583594308426&di=6682cf62004def14c5c2b3245c8935ef&imgtype=0&src=http%3A%2F%2Fcdn-ly.mama.cn%2F251da825b837b82f57e92e51d256623d.jpg" alt="" style="width: 100%;height: 80%;object-fit: cover">
<div style="width: 80%">
    <div style="float: left;width: 30%">
        <h1>欢迎登陆<font color="red">点金</font><font color="#1e90ff">五星级</font>宾馆</h1>
        <form id = "fm">
            用 户 名 <input type="text" name="userName">   <input type ="button" value="登陆" onclick="login()">    <input type ="button" value="注册" onclick="toAdd()"><br/><br/>
            密&nbsp;&nbsp;&nbsp;码 <input type = "text" name = "userPwd"> <input type ="button" value="邮箱登录" onclick="toforget()"> <input type ="button" value="忘记密码" onclick="tophone()"><br/>

        </form>
    </div>
    <div style="float: right; width: 70%">
        <div id="allmap" >
        </div>
        <div>
            <input type="button" value="点击导航到酒店" onclick="searchInfoWindow.open(marker);"/>

        </div>
    </div>
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

    //新增
    function toforget(){
        layer.open({
            type: 2,
            title: [
                '忘记密码',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toforget' //iframe的url
        });
    }
    //新增
    function tophone(){
        layer.open({
            type: 2,
            title: [
                '忘记密码',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/tophone' //iframe的url
        });
    }
    //判断当前窗口路径与加载路径是否一致。
    if(window.top.document.URL != document.URL){
        //将窗口路径与加载路径同步
        window.top.location = document.URL;
    }

    // 百度地图API功能
    var map = new BMap.Map('allmap');
    var poi = new BMap.Point(116.461958,40.026807);
    map.centerAndZoom(poi, 16);
    map.enableScrollWheelZoom();

    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
        '<img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583594308426&di=6682cf62004def14c5c2b3245c8935ef&imgtype=0&src=http%3A%2F%2Fcdn-ly.mama.cn%2F251da825b837b82f57e92e51d256623d.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
        '地址：北京市朝阳区来广营西路1号<br/>电话：(010)59928888<br/>简介：点金五星级宾馆，酒店总共设有234间奢华现代的客房。其中，包含140个套房，采用欧洲设计理念配以中式艺术装饰，体现酒店超凡气魄。奢华典雅的客房面积从45平米到488平米不等，世界顶级的设计大师为宾客营造精彩绝伦的舒适空间。盘古宴会厅设有三个多功能厅可提供所有会议、宴会活动；先进完善的设施足以保证会议、宴会的顺利和圆满成功。' +
        '</div>';

    //创建检索信息窗口对象
    var searchInfoWindow = null;
    searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
        title  : "点金五星级酒店",      //标题
        width  : 290,             //宽度
        height : 105,              //高度
        panel  : "panel",         //检索结果面板
        enableAutoPan : true,     //自动平移
        searchTypes   :[
            BMAPLIB_TAB_SEARCH,   //周边检索
            BMAPLIB_TAB_TO_HERE,  //到这里去
            BMAPLIB_TAB_FROM_HERE //从这里出发
        ]
    });
    var marker = new BMap.Marker(poi); //创建marker对象
    marker.enableDragging(); //marker可拖拽
    marker.addEventListener("click", function(e){
        searchInfoWindow.open(marker);
    })
    map.addOverlay(marker); //在地图中添加marker
    //样式1
    var searchInfoWindow1 = new BMapLib.SearchInfoWindow(map, "信息框1内容", {
        title: "信息框1", //标题
        panel : "panel", //检索结果面板
        enableAutoPan : true, //自动平移
        searchTypes :[
            BMAPLIB_TAB_FROM_HERE, //从这里出发
            BMAPLIB_TAB_SEARCH   //周边检索
        ]
    });
    function openInfoWindow1() {
        searchInfoWindow1.open(new BMap.Point(116.463378,116.463378));
    }
    //样式2
    var searchInfoWindow2 = new BMapLib.SearchInfoWindow(map, "信息框2内容", {
        title: "信息框2", //标题
        panel : "panel", //检索结果面板
        enableAutoPan : true, //自动平移
        searchTypes :[
            BMAPLIB_TAB_SEARCH   //周边检索
        ]
    });
    function openInfoWindow2() {
        searchInfoWindow2.open(new BMap.Point(116.463378,116.463378));
    }
    //样式3
    var searchInfoWindow3 = new BMapLib.SearchInfoWindow(map, "信息框3内容", {
        title: "信息框3", //标题
        width: 290, //宽度
        height: 40, //高度
        panel : "panel", //检索结果面板
        enableAutoPan : true, //自动平移
        searchTypes :[
        ]
    });
    function openInfoWindow3() {
        searchInfoWindow3.open(new BMap.Point(116.463378,116.463378));
    }
</script>
</html>
