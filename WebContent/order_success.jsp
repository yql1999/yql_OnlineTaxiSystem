<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="cn.edu.zjut.po.Order"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	<%Order order=(Order)request.getSession().getAttribute("order");%>
	<div id="n1" style="visibility:hidden" ><%=order.getOrderID() %></div>
	<form action="torun">
	<input id="orderid" type="hidden" name="order.orderID">
	<input type="button" class="btn btn-primary btn-lg" onclick="refresh()" value="获取司机位置">
	<input type="submit" class="btn btn-primary btn-lg" value="确认上车" onclick="get()">
	</form>
	<div id="container"></div>
	<div id="panel" style="margin-top: 100px;visibility:hidden"></div>
	<blockquote class="layui-elem-quote"
		style="merge-bottom: 200px; merge-right: 300px;">
		<!-- <div style="height: 210px; width: 500px;"> -->
		<div class="input-card"
			style="left: 100px; height: 280px; width: 300px; background: #333; opacity: .80;
    		position: fixed; left: 40%; top: 40%;">

			<span class="x-red"><h3>接单成功！</h3></span> 
			<img
				src="images/success.jpg"
				style="height: 30px; width: 30px; position: relative; left: 120px; top: -25px;">

			<div style="color:white;">
				司机已经接到订单
			</div>
			<div style="color:white;">
				正在加速赶来的路上 <img src="images/car.gif"
					style="position: relatives; left: 400px; top: 35px; height: 70px; width: 70px;">
			</div>
			<input type="submit"  
				onclick="x_admin_show('订单详情','driverInformation.action',480,500)"
				class="layui-btn" value="点击获取订单详情" style="display:block;mergin:0 auto;"> 
				<input type="submit" data-toggle="modal" data-target="#myModal"
				class="layui-btn" value="取消订单"
				style="display:block;mergin:0 auto;margin-top:20px;">
		</div>
	</blockquote>
	</div>
	<script type="text/javascript">
	  var map = new AMap.Map("container", {
	        resizeEnable: true,
	        center: [116.397428, 39.90923],//地图中心点
	        zoom: 13 //地图显示的缩放级别
	    });
	    //构造路线导航类
	    var driving = new AMap.Driving({
	        map: map,
	        panel: "panel",
	        hideMarkers:true
	    }); 
	    var slng=<%=order.getSlng()%>;
	    var slat=<%=order.getSlat()%>;
	    var lon=<%=order.getDriver().getLongitude()%>;
	    var lat=<%=order.getDriver().getLatitude()%>;
	    var startIcon = new AMap.Icon({
	        // 图标尺寸
	        size: new AMap.Size(50, 50),
	        // 图标的取图地址
	        image: 'css/car.png',
	        // 图标所用图片大小
	        imageSize: new AMap.Size(50, 50),
	        // 图标取图偏移量
	        imageOffset: new AMap.Pixel(-5, -20)
	    });
	    var endIcon = new AMap.Icon({
	        // 图标尺寸
	        size: new AMap.Size(25, 34),
	        // 图标的取图地址
	        image: "https://a.amap.com/jsapi_demos/static/resource/img/user.png",
	        // 图标所用图片大小
	        imageSize: new AMap.Size(25, 34),
	        // 图标取图偏移量
	        imageOffset: new AMap.Pixel(0, 0)
	    });
	    var startMarker = new AMap.Marker({
	        position: new AMap.LngLat(lon,lat),
	        icon: startIcon,
	        offset: new AMap.Pixel(-13, -30)
	    });
	    var endMarker = new AMap.Marker({
	        position: new AMap.LngLat(slng,slat),
	        icon: endIcon,
	        offset: new AMap.Pixel(-13, -30)
	    });
	    // 根据起终点经纬度规划驾车导航路线
	     driving.search(new AMap.LngLat(lon, lat), new AMap.LngLat(slng,slat ), function(status, result) {
	         // result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
	         if (status === 'complete') {
	             log.success('绘制驾车路线完成')
	         } else {
	             log.error('获取驾车数据失败：' + result)
	         }
	     });
	    map.add([startMarker,endMarker]);
	    <%System.out.println(order.getSlng());%>
	    <%System.out.println(order.getSlat());%>
	    <%System.out.println(order.getDriver().getLongitude());%>
	    <%System.out.println(order.getDriver().getLatitude());%>
    function get(){
		document.getElementById("orderid").value=document.getElementById("n1").innerHTML;
	}
    function refresh(){
    	location.reload();
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
				<div id="n2"  style="visibility:hidden"><%=order.getOrderID()%></div>
				<div id="n3"  style="visibility:hidden"><%=order.getPassenger().getPassengerID() %></div>
				<div id="n4"  style="visibility:hidden"><%=order.getDriver().getDriverID()%></div>
				<form action="deleteorder">
					<div class="modal-footer">
				<div class="modal-body" style="position:absolute;left:100px;top:50px;">请对司机打分:<span class="box"> <span>★</span> <span>★</span>
									<span>★</span> <span>★</span> <span>★</span>
							</span> <span id="2"><s:property value="order.estimatedtod" />0</span>分</div>
							<input type="hidden" id="order" name="order.orderID">
							<input type="hidden" id="passenger" name="order.passenger.passengerID">
							<input type="hidden" id="driver" name="order.driver.driverID">
							<input type="hidden"  id="1" name ="order.estimateptod" readonly="readonly" />
						<input type="submit" class="btn btn-primary" value="完成评价" onclick="f()">
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
			function f(){
				document.getElementById("order").value=document.getElementById("n2").innerHTML;
				document.getElementById("passenger").value=document.getElementById("n3").innerHTML;
				document.getElementById("driver").value=document.getElementById("n4").innerHTML;
			}
		</script>
</body>