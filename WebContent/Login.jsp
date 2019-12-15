<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>叶子打车</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="login.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body class="login-bg">
	<div class="login layui-anim layui-anim-up">
		<div class="message">登录</div>
		<div id="darkbannerwrap"></div>

		<s:form action="login" method="post" id="form1">
			<ul class="logintype" style="display: block; list-style: none; text-align: center;">
				<li><select id="logintype" onchange="login()">
						<option>用户类别</option>
						<option value="0">乘客</option>
						<option value="1">司机</option>
						<option value="2">管理员</option>
				</select></li>
			</ul>
			<s:textfield name="loginUser.account" placeholder="账号"  lay-verify="required" class="layui-input" style="width: 340px; margin-bottom: 10px;"/>
			<s:password name="loginUser.password" lay-verify="required" placeholder="密码"  class="layui-input" style="width: 340px; margin-bottom: 10px;"/>
			<s:submit value="登录" style="width: 340px; margin-bottom: 10px;" />
		</s:form>
		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="background-color:#009688; width: 100%;">注册</button>
	</div>
<!-- 模态框（Modal）<option>value="用户类别"</option> -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					请选择注册身份
				</h4>
			</div>
			<div class="modal-body" style=" text-align:center; font-size:20px;" >
			<a href = "re.html" style = "color: #ffffff; background-color:#009688; text-decoration: none;  border-radius: 2px; padding: 5px 20px;">乘客</a><br>
				<br>
				<a href = "re.html" style = "color: #ffffff; background-color:#009688; text-decoration: none; border-radius: 2px; padding: 5px 20px;">司机</a><br>
				<br>
				<a href = "re.html" style = "color: #ffffff; background-color:#009688; text-decoration: none; border-radius: 2px; padding: 5px 20px;">管理员</a>
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

	
</body>
</html>