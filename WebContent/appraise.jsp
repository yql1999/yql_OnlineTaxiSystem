<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>评价页面</title>
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
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">
.box {
	color: #999;
}

.box .sel {
	color: #F00;
}

.icon {
	width: 70px;
	height: 70px;
}

.es {
	width: 200px;
	margin: 0px auto;
}

.fade { !
	important: visibility:visible;
	display: inline;
}
</style>
<!--[endif]-->
</head>
<body class="layui-anim layui-anim-up">
	<%@ include file="passenger_head.jsp"%>
	<div id="n1"style="visibility:hidden" ><s:property value="order.orderID"/></div>
	<div id="n2"style="visibility:hidden" ><s:property value="order.passenger.passengerID"/></div>
	<div class="page-content">
		
			<div class="x-nav">
				<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">行程</a>
					<a> <cite>乘客评价</cite></a>
				</span> <a class="layui-btn layui-btn-small"
					style="line-height: 1.6em; margin-top: 3px; float: right"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="layui-icon" style="line-height: 30px">ဂ</i>
				</a>
			</div>
			<div class="x-body">
			<s:form action="appraise" method="post">
				<table class="layui-table">
					<thead>
						<tr>
							<th>司机ID</th>
							<th>乘客ID</th>
							<th>起始时间</th>
							<th>终止时间</th>
							<th>费用</th>
							<th>起点</th>
							<th>终点</th>
							<th>是否中途更换路线</th>
							<th>评价</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><s:property value="order.driver.driverID" /></td>
							<td><s:property value="order.passenger.passengerID" /></td>
							<td><s:property value="order.starttime" /></td>
							<td><s:property value="order.endtime" /></td>
							<td><s:property value="order.sum" /></td>
							<td><s:property value="order.start" /></td>
							<td><s:property value="order.destination" /></td>
							<td>否</td>
							<td class="es"><span class="box"> <span>★</span> <span>★</span>
									<span>★</span> <span>★</span> <span>★</span>
							</span>
							<span id="2">0</span>分</td>
						</tr>
					</tbody>
				</table>
		        <input type="hidden" name="order.driver.driverID" value="1">
		        <input id="orderid" type="hidden" name="order.orderID">
		        <input id="passengerid" type="hidden" name="loginUser.passengerID">
				<input type="hidden"  id="1" name ="order.estimateptod" readonly="readonly" "/>
			<!-- <input type="submit" class="layui-btn" value="提交评价" onclick="f1()"> -->
			<input type="submit" class="layui-btn" value="提交评价并去支付"  onclick="get()"
				style="display:block;margin:0 auto">
		</s:form>
		</div>
		
		<script type="text/javascript">
			$(function() {
				$(".box span").click(function(event) {
					$(this).parent().find("span").addClass("sel");
					$(this).nextAll().removeClass("sel");
					$(this).parent().next().text($(this).index() + 1);
					var i=document.getElementById("2").innerHTML;
					document.getElementById("1").value=i;
					
				});
			});
			 function get(){
					document.getElementById("orderid").value=document.getElementById("n1").innerHTML;
					document.getElementById("passengerid").value=document.getElementById("n2").innerHTML;
				}
		</script>
	</div>
</body>
</html>