<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>订单界面</title>
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
</head>
<body class="layui-anim layui-anim-up">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="manager_welcome.jsp">首页</a>
			<a href="">订单列表</a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="managerfindorderlist" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
		<table class="layui-table">
			<thead>
				<tr>
					<th>orderID</th>
					<th>乘客ID</th>
					<th>司机ID</th>
					<th>起点</th>
					<th>终点</th>
					<th>出发时间</th>
					<th>到达时间</th>
					<th>乘客数量</th>
					<th>订单类型</th>
					<th>价钱</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="order" var="object">
					<tr>
						<td><s:property value="#object.orderID" /></td>
						<td><s:property value="#object.passenger.passengerID" /></td>
						<td><s:property value="#object.driver.driverID" /></td>
						<td><s:property value="#object.start" /></td>
						<td><s:property value="#object.destination" /></td>
						<td><s:property value="#object.starttime" /></td>
						<td><s:property value="#object.endtime" /></td>
						<td><s:property value="#object.passnum" /></td>
						<td><s:property value="#object.type" /></td>
						<td><s:property value="#object.sum" /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
			});
		});
		</script>
</body>
</html>