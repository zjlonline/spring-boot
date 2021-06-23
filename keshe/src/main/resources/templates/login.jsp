<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<link rel="stylesheet" th:href="@{/layui/css/layui.css}">
<script th:src="@{/layui/layui.js}"></script>
<link rel="shortcut icon" th:href="@{/img/favicon.ico}" />
<link rel="bookmark" th:href="@{/img/favicon.ico}" />
<style type="text/css">
.bg {
	background: #F2F2F2;
    /* 加载背景图 */
    background: url("img/logbg1.jpg") no-repeat;
    /* 背景图垂直、水平均居中 */
    background-position: center center;
    /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
    background-attachment: fixed;
    /* 让背景图基于容器大小伸缩 */
    background-size: 100% 100%;
    width:100%;
    height:100%;
}

.warp {
	max-width: 600px;
	margin: 10px auto;
}

.window {
	width: 400px;
	position: absolute;
	margin-left: -200px;
	margin-top: -150px;
	top: 50%;
	left: 50%;
	display: block;
	z-index: 2000;
	background: #fff;
	padding: 20px 0;
}
</style>
<title>请登录系统 - 学生公寓管理系统</title>
<script>
function DoMsgReg(){
    window.location.href='/StudentApartmentMS/LoginNew.jsp';
}
function DoMsgLogin(){
	window.location.href='/StudentApartmentMS/Main.jsp';
}
</script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
<div class="layui-header">
	<div class="layui-logo" style="color:#FFF;"><i class="layui-icon layui-icon-home"></i>&nbsp;学生公寓管理系统</div>
</div>

<div class="layui-body" style="left:0px;bottom:0px;">
<div class="bg">
<div class="window">
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">登录</li>
    <li>注册</li>
  </ul>
<div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
        <div class="layui-card">
            <div class="layui-card-header">请登录系统</div>
            <div class="layui-card-body">
<!--                  <form class="layui-form layui-form-pane">  -->
 <form th:action="@{/login}" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-username">&nbsp;</i>用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-password">&nbsp;</i>密&nbsp;&nbsp;码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formLogin">登录</button>
                            <button type="reset" class="layui-btn layui-btn-normal">重置</button></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="layui-tab-item">
        <div class="layui-tab-item layui-show">
        <div class="layui-card">
            <div class="layui-card-header">注册管理员</div>
            <div class="layui-card-body">
<!--                 <form class="layui-form layui-form-pane" lay-filter="regForm" id="regForm">  -->
<form action="/resiter" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-username">&nbsp;</i>用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" required lay-verify="required|username" placeholder="请输入用户名" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-password">&nbsp;</i>密&nbsp;&nbsp;码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" required lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formReg">注册</button>
                            <button type="reset" class="layui-btn layui-btn-normal">重置</button></div>
                    </div>
                </form>
            </div>
        </div>
    	</div>
    </div>
</div>
</div>


</div>
</div>
</div>
</div>
<script>
layui.use(['layer','form','element'], function(){
  var form = layui.form;
  var element = layui.element;
  var layer = layui.layer;
  var $ = layui.jquery; 
	  //表单验证
	  form.verify({
		  username: function(value){ 
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '用户名不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '用户名首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '用户名不能全为数字';
		    }
		  }
		  
		  ,password: [
		    /^[\S]{6,12}$/
		    ,'密码必须6到12位，且不能出现空格'
		  ] 
		});
 });
</script>
</body>
</html>