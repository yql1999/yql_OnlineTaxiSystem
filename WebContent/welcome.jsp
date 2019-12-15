<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<meta name="renderer" content="webkit">
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
</head>
<body>
	<div class="x-body layui-anim layui-anim-up">
		<blockquote class="layui-elem-quote">
			欢迎您， <span class="x-red">！</span>当前时间：<%= new java.util.Date()%>
		</blockquote>

		<fieldset class="layui-elem-field">
			<legend>个人信息</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-skin="line">
					<tbody>
						<tr>
							<td><a 
								onclick="x_admin_show('查看个人信息','passenger_information.jsp',600,300)"
								class="x-a" target="_blank">查看个人信息</a></td>
						</tr>
						<tr>
							<td><a
								onclick="x_admin_show('修改个人信息','passenger_update.jsp',800,600)"
								class="x-a" target="_blank">修改个人信息</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend>我的历史订单</legend>
			<div class="layui-field-box">
				<table class="layui-table">
					<tbody>
						<tr>
							<th>1</th>
							<td>订单1</td>
						</tr>
						<tr>
							<th>2</th>
							<td>订单2</td>
						</tr>
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
</body>
</html>