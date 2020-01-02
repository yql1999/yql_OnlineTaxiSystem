<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.edu.zjut.po.Driver"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>订单详情</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!-- <script type="text/javascript"> 
  setTimeout("window.opener=null;window.location.href='driverInformation.action'",100);
</script> -->
</head>

<body>
	<div class="x-body">
		<%
			Driver driver = (Driver) request.getSession().getAttribute("driver");
		%>
		<form class="layui-form" action="#">
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> 司机姓名 </label>
				<div class="layui-input-inline">
					<input type="text" id="name" name="name" id="name" required=""
						autocomplete="off" class="layui-input"
						value="<%=driver.getName()%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="gender" class="layui-form-label"> 司机性别 </label>
				<div class="layui-input-inline">
					<input type="text" id="gender" class="layui-input"
						autocomplete="off" value="<%=driver.getGender() == true ? "男" : "女"%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="type" class="layui-form-label"> 车辆类别 </label>
				<div class="layui-input-inline">
					<input type="text" id="type" class="layui-input" autocomplete="off"
						value="<%=driver.getCar().getType()%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="type" class="layui-form-label"> 汽车牌号 </label>
				<div class="layui-input-inline">
					<input type="text" id="plate" class="layui-input"
						autocomplete="off" value="<%=driver.getCar().getPlate()%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="color" class="layui-form-label"> 汽车颜色 </label>
				<div class="layui-input-inline">
					<input type="text" id="color" class="layui-input"
						autocomplete="off" value="<%=driver.getCar().getColor()%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="age" class="layui-form-label"> 司机年龄 </label>
				<div class="layui-input-inline">
					<input type="text" id="age" class="layui-input" autocomplete="off"
						value="<%=driver.getAge()%>">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="estimate" class="layui-form-label"> 司机评价 </label>
				<div class="layui-input-inline">
					<input type="text" id="estimate" class="layui-input"
						autocomplete="off" value="<%=driver.getScore()%>">
				</div>
			</div>
		</form>
	</div>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>

</html>