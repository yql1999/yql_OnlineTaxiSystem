<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>预约打车</title>
<link rel="stylesheet"
	href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<link rel="stylesheet"
	href="https://cache.amap.com/lbs/static/main1119.css" />
<link rel="stylesheet"
	href="https://cache.amap.com/lbs/static/AMap.PlaceSearchRender1120.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<style>
.info {
	width: 26rem;
}

html, body, #container {
	height: 100%;
	width: 100%;
}

.btn {
	width: 10rem;
	margin-left: 6.8rem;
}
</style>
</head>
<body>
	<%@ include file="passenger_head.jsp"%>
	<div class="page-content">
		<div id="container"></div>
		<div class="input-card" style='width: 28rem; bottom: 400px;'>
			<div class="input-item">
				<input id='lnglat' type="text" value='116.39,39.9'
					style="display: none">
			</div>
			<form action="route.jsp">
				<div class="input-item">
					<div class="input-item-prepend">
						<span class="input-item-text">起始位置</span>
					</div>
					<input id='address' name='address' type="text">
				</div>
				<hr class="hr15">
				<div class="input-item-prepend">
					<span class="input-item-text" style="width: 8rem;">请输入目的地</span>
				</div>
				<input id='tipinput' name='tipinput' type="text"> 
				<hr class="hr15">
				<div class="input-item-prepend">
					<span class="input-item-text" style="width: 8rem;">预约出发时间</span>
				</div>
				<input id='starttime' name='starttime' type="text" placeholder="输入格式为2019.02.13"> 
				<hr class="hr15">
				<input
					type="button" value="确认地点" onclick="f()" class="layui-btn"> 
				<input
					type="submit" value="叫车" class="layui-btn" style="float:right">
			</form>
			<input id="regeo" type="button" class="btn" value="经纬度 -> 地址"
				style="display: none">
		</div>
	</div>

	<script
		src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript"
		src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
	<script type="text/javascript"
		src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript"
		src="https://cache.amap.com/lbs/static/PlaceSearchRender.js"></script>
	<script type="text/javascript">
		var map = new AMap.Map('container', {
			resizeEnable : true
		});
		var auto = new AMap.Autocomplete({
			input : "tipinput"
		});
		var startIcon = new AMap.Icon(
				{
					// 图标尺寸
					size : new AMap.Size(25, 34),
					// 图标的取图地址
					image : '//a.amap.com/jsapi_demos/static/demo-center/icons/dir-marker.png',
					// 图标所用图片大小
					imageSize : new AMap.Size(135, 40),
					// 图标取图偏移量
					imageOffset : new AMap.Pixel(-9, -3)
				});
		var endIcon = new AMap.Icon(
				{
					size : new AMap.Size(25, 34),
					image : '//a.amap.com/jsapi_demos/static/demo-center/icons/dir-marker.png',
					imageSize : new AMap.Size(135, 40),
					imageOffset : new AMap.Pixel(-95, -3)
				});
		function f() {
			var end = document.getElementById("tipinput").value;
			var placeSearch = new AMap.PlaceSearch()
			placeSearch.search(end, function(status, result) {
				// 查询成功时，result即对应匹配的POI信息
				console.log(result)
				var pois = result.poiList.pois;
				var poi = pois[0];
				var marker = new AMap.Marker({
					position : poi.location, // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
					title : poi.name,
					icon : endIcon
				});
				// 将创建的点标记添加到已有的地图实例：
				map.add(marker);
				map.setFitView();
			})

		}
		AMap.plugin('AMap.Geolocation', function() {
			var geolocation = new AMap.Geolocation({
				enableHighAccuracy : true,//是否使用高精度定位，默认:true
				timeout : 10000, //超过10秒后停止定位，默认：5s
				buttonPosition : 'RB', //定位按钮的停靠位置
				buttonOffset : new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
				zoomToAccuracy : true, //定位成功后是否自动调整地图视野到定位点

			});
			map.addControl(geolocation);
			geolocation.getCurrentPosition(function(status, result) {
				if (status == 'complete') {
					onComplete(result)
				} else {
					onError(result)
				}
			});
		});
		//解析定位结果
		function onComplete(data) {
			var marker = new AMap.Marker({
				map : map,
				icon : startIcon,
				position : data.position,
				draggable : true
			});
			var geocoder = new AMap.Geocoder({
				city : "010", //城市设为北京，默认：“全国”
				radius : 1000
			//范围，默认：500
			});
			geocoder.getAddress(marker.getPosition(), function(status, result) {
				if (status === 'complete' && result.regeocode) {
					var address = result.regeocode.formattedAddress;
					document.getElementById('address').value = address;
				} else {
					log.error('根据经纬度查询地址失败')
				}
			});
			function regeoCode() {

				var lnglat = document.getElementById('lnglat').value.split(',');
				marker.setPosition(lnglat);

				geocoder.getAddress(lnglat, function(status, result) {
					if (status === 'complete' && result.regeocode) {
						var address = result.regeocode.formattedAddress;
						document.getElementById('address').value = address;
					} else {
						log.error('根据经纬度查询地址失败')
					}
				});
			}

			marker.on('dragend', function(e) {
				document.getElementById('lnglat').value = e.lnglat;
				regeoCode();
			})
			document.getElementById("regeo").onclick = regeoCode;
			document.getElementById('lnglat').onkeydown = function(e) {
				if (e.keyCode === 13) {
					regeoCode();
					return false;
				}
				return true;
			};
		}
		//解析定位错误信息
		function onError(data) {
			document.getElementById('status').innerHTML = '定位失败'
			document.getElementById('result').innerHTML = '失败原因排查信息:'
					+ data.message;
		}
	</script>

</body>
</html>