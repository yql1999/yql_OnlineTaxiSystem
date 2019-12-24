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
	
	<div class="page-content">
		
			<div class="x-body">
			<s:form action="passenger_pay.action" method="post">
				<table class="layui-table">
					<thead>
						<tr>
							<th>起点</th>
							<th>终点</th>
							<th>金额</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><s:property value="order.start" />浙江工业大学屏峰校区</td>
							<td><s:property value="order.destination" />西溪印象城</td>
							<td><s:property value="order.sum" />30.00</td>
						</tr>
					</tbody>
				</table>
			
			<!-- <input type="submit" class="layui-btn" value="提交评价" onclick="f1()"> -->
			<input type="submit" class="layui-btn" value="支付" 
				style="display:block;margin:0 auto">
		</s:form>
		</div>
		
		<%-- <script type="text/javascript">
			function f1() {
				alert("评价成功，点击确定跳转主页面");
			}
			$(function() {
				$(".box span").click(function(event) {
					$(this).parent().find("span").addClass("sel");
					$(this).nextAll().removeClass("sel");
					$(this).parent().next().text($(this).index() + 1);
				});
			});
		</script> --%>
	</div>
</body>
</html>