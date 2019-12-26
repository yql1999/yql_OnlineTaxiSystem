
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功接单页面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">


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
<title>地点关键字 + 驾车路线规划</title>
<style type="text/css">
html, body, #container {
	width: 100%;
	height: 100%;
}
</style>
<style type="text/css">
#panel {
	position: fixed;
	background-color: white;
	max-height: 90%;
	overflow-y: auto;
	top: 10px;
	right: 10px;
	width: 280px;
}

#panel .amap-call {
	background-color: #009cf9;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

#panel .amap-lib-driving {
	border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
	overflow: hidden;
}

.order {
	background: white;
	height: 400px;
	width: 500px;
	position: absolute;
	bottom: 0px;
	left: 0px;
}

.order p {
	color: black;
	font-size: 1.5em;
}
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
</style>
<link rel="stylesheet"
	href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<script
	src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
	src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
<script type="text/javascript"
	src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>
	<%@ include file="passenger_head.jsp"%>
	<div class="page-content">
	<div id="n1" style="visibility:hidden"><s:property value="order.orderID"/></div>
	<form action="torun">
	<input id="orderid" type="hidden" name="order.orderID">
	<input type="submit" class="btn btn-primary btn-lg" value="确认上车" onclick="get()">
	</form>
	<div id="container"></div>
	<div id="panel" style="margin-top: 100px;"></div>
	<blockquote class="layui-elem-quote"
		style="merge-bottom: 200px; merge-right: 300px;">
		<!-- <div style="height: 210px; width: 500px;"> -->
		<div class="input-card"
			style="left: 100px; height: 240px; width: 500px; background: #333; opacity: .80;
    		position: fixed; left: 40%; top: 40%;">

			<span class="x-red"><h3>接单成功！</h3></span> 
			<img
				src="images/success.jpg"
				style="height: 30px; width: 30px; position: relative; left: 120px; top: -25px;">

			<div style="color:white;">
				司机已经接到订单，正在加速赶来的路上 <img src="images/car.gif"
					style="position: relatives; left: 400px; top: 35px; height: 70px; width: 70px;">
			</div>
			<a href="driverInformation.action" 
				onclick="x_admin_show('订单详情','passenger_currentorder.jsp',600,400)"
				class="x-a" target="_blank"><h3>点击获取订单详情...</h3></a> <br>
			
				<input type="submit" data-toggle="modal" data-target="#myModal"
				class="layui-btn" value="取消订单"
				style="display:block;margin:0 auto">
		</div>
	</blockquote>
	</div>
	<%
	String address=request.getParameter("order.start");
	String tipinput=request.getParameter("order.destination");
	%>
	<script type="text/javascript">
    //基本地图加载
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.397428, 39.90923],//地图中心点
        zoom: 13 //地图显示的缩放级别
    });
    //构造路线导航类
    var driving = new AMap.Driving({
        map: map,
        panel: "panel"
    });
    // 根据起终点名称规划驾车导航路线
    driving.search([
        {keyword: "<%=address%>"},
        {keyword: "<%=tipinput%>"
		} ], function(status, result) {
			// result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
			if (status === 'complete') {
				log.success('绘制驾车路线完成')
			} else {
				log.error('获取驾车数据失败：' + result)
			}
		});
    function get(){
		document.getElementById("orderid").value=document.getElementById("n1").innerHTML;
	}
	</script>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="myModalLabel">司机评价表</h4>
				</div>
				<form action="deleteorder">
				<input type="hidden" id="orderid"  name ="order.orderID" readonly="readonly"/>
				<input type="hidden" id="orderid"  name ="order.passenger.passengerID" readonly="readonly"/>
				<input type="hidden" id="orderid"  name ="order.driver.driverID" readonly="readonly"/>
					<div class="modal-footer">
				<div class="modal-body" style="position:absolute;left:100px;top:50px;">请对司机打分:<span class="box"> <span>★</span> <span>★</span>
									<span>★</span> <span>★</span> <span>★</span>
							</span> <span id="2"><s:property value="order.estimatedtod" />0</span>分</div>
							<input type="hidden" name="order.orderID">
							<input type="hidden" name="order.passenger.passengerID">
							<input type="hidden" name="order.driver.driverID">
							<input type="hidden"  id="1" name ="order.estimateptod" readonly="readonly" />
						<input type="submit" class="btn btn-primary" value="完成评价">
					</div>
				</form>
			</div>
		</div>
	</div>
		<script type="text/javascript">
			function f1() {
				alert("评价成功，点击确定跳转主页面");
			}
			$(function() {
				$(".box span").click(function(event) {
					$(this).parent().find("span").addClass("sel");
					$(this).nextAll().removeClass("sel");
					$(this).parent().next().text($(this).index() + 1);
					var i=document.getElementById("2").innerHTML;
					document.getElementById("1").value=i;
				});
			});
		</script>
</body>