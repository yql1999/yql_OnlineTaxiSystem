<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>乘客界面</title>
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

</head>
<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="./passenger_index.jsp">乘客界面</a>
		</div>
		<div class="left_open">
			<i title="展开左侧栏" class="iconfont">&#xe699;</i>
		</div>
		<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="x_admin_show('资讯','http://www.baidu.com')"><i
							class="iconfont">&#xe6a2;</i>资讯</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">我的</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a
							onclick="x_admin_show('个人信息','passenger_information.jsp',600,400)">查看个人信息</a>
					</dd>
					<dd>
						<a onclick="x_admin_show('修改个人信息','passenger_update.jsp',600,400)">修改个人信息</a>
					</dd>
					<dd>
						<a href="Login.jsp">退出登录</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a
				href="passenger_index.jsp">首页</a></li>
		</ul>

	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				
				<li>
					<a href="allOrder.action"> 
						<i class="iconfont">&#xe723;</i>
						<cite>我的订单</cite> 
					</a>
				</li>
				
				<li>
					<a href="currOrder.action"> 
						<i class="iconfont">&#xe6b8;</i>
						<cite>当前订单</cite>
					</a>
				</li>
				
				<li>
					<a href="intime_call.jsp"> 
						<i class="iconfont">&#xe6a7;</i>
						<cite>实时打车</cite>
					</a>
				</li>
						
				<li>
					<a href="appointment_call.jsp"> 
						<i class="iconfont">&#xe6a7;</i>
						<cite>预约打车</cite>
					</a>
				</li>

			</ul>
			
		</div>
	</div>
</body>
</html>