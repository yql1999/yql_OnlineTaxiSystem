<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="cn.edu.zjut.po.Passenger"%>
		<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>路线规划</title>
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
		<div id="container"></div>
		<div id="panel" style="margin-top: 100px;"></div>
		<div class="input-card"
			style="left: 100px; height: 150px; width: 400px; background: #202020; position: fixed; left: 40%; top: 40%;">
			<p style="color: white; font-size: 1.2em; cellspacing: 0">请耐心等待，系统正在为你加速派车</p>
			<br>
			<br>
						<%Passenger passenger=(Passenger)request.getSession().getAttribute("passenger");%>
					<div id="n1" style="visibility:hidden"><%=passenger.getPassengerID()%></div>
			<form action="cancel">
				<input type="submit" data-toggle="modal" class="layui-btn"
					value="停止叫车" style="merge-top: 10px; merge-left: 20px;" onclick="get()">
					<input type="hidden" name="order.passenger.passengerID" id="spassenger">
					<input type="hidden" name="loginUser.passengerID" id="spassenger2">
			</form>
			<img src="images/timg.gif"
				style="width: 100px; height: 100px; margin: -56px 0px 0px 284px;">
		</div>
	</div>
	<%
		String address = request.getParameter("order.start");
		String tipinput = request.getParameter("order.destination");
	%>
	<script type="text/javascript">
	function get(){
		document.getElementById("spassenger").value=document.getElementById("n1").innerHTML;
		document.getElementById("spassenger2").value=document.getElementById("n1").innerHTML;
	}
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
	</script>
</body>
</html>