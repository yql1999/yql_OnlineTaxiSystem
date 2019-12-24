<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<script type="text/javascript"
	src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
<script
	src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
	src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="https://cdn.bootcss.com/jquery/3.4.1/core.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

.info {
	width: 26rem;
}

.connection {
	position: absolute;
	bottom: 40px;
	right: 10px;
}

.alert1 {
	position: absolute;
	bottom: 40px;
	left: 10px;
}
</style>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>前往目的地</title>
</head>
<body>
	<%@ include file="passenger_head.jsp"%>
	<div class="page-content">
		<div id="container" onmouseup="test()"></div>
		<div id="panel" style="margin-top:100px;"></div>
		<div class="info" style="visibility: hidden">
			<h4 id='status' style="visibility: hidden"></h4>
			<hr>
			<p id='result' style="visibility: hidden"></p>
			<hr>
			<p style="visibility: hidden">由于众多浏览器已不再支持非安全域的定位请求，为保位成功率和精度，请升级您的站点到HTTPS。</p>
		</div>
		<form action="#">
			<input type="button" value="支付" onclick="x_admin_show('支付','pay.jsp',400,300)"
			 data-toggle="modal" class="layui-btn" 
				style="height:50px;width:260px;position: absolute; bottom: 100px; right: 20px;display:block;margin:0 auto;">
		</form>
		
		<form action="appraise.jsp">
			<input type="submit" value="对此次行程完成评价" data-toggle="modal" class="layui-btn" 
				style="height:50px;width:260px;position: absolute; bottom: 30px; right: 20px;display:block;margin:0 auto;">
		</form>
		<script>
			function add_info() {
				var form = document.getElementById('updateform');
				form.submit();
				$("#myModal").on("hidden.bs.modal", function() {
					$(this).removeData("bs.modal");
				});

			}
		</script>
		<script>
			var map, route, marker;
			var geolocation;
			var path = [];
			var driving = new AMap.Driving({
				//map:map,
				panel : "panel"
			});
			//基本地图加载
			map = new AMap.Map("container", {
				resizeEnable : true,
				zoom : 13
			});
			var options = {
				'timeout' : 10000, //超过10秒后停止定位，默认：5s
				'showButton' : false,//是否显示定位按钮
				'buttonPosition' : 'LB',//定位按钮的位置
				/* LT LB RT RB */
				'buttonOffset' : new AMap.Pixel(10, 20),//定位按钮距离对应角落的距离
				'showMarker' : true,//是否显示定位点
				'markerOptions' : {//自定义定位点样式，同Marker的Options
					'offset' : new AMap.Pixel(-18, -33),
					'content' : '<img src="./css/car.png" style="width:65px;height:65px"/>'
				},
				'showCircle' : false,//是否显示定位精度圈
				'circleOptions' : {//定位精度圈的样式
					'strokeColor' : '#0093FF',
					'noSelect' : true,
					'strokeOpacity' : 0.5,
					'strokeWeight' : 1,
					'fillColor' : '#02B0FF',
					'fillOpacity' : 0.25
				}
			}
			AMap.plugin('AMap.Geolocation', function() {
				geolocation = new AMap.Geolocation(options);
				map.addControl(geolocation);
				geolocation.getCurrentPosition(function(status, result) {
					if (status == 'complete') {

						onComplete(result)
					} else {
						onError(result)
					}
				});
			});
			

			setTimeout(function() {
				AMap.plugin('AMap.Geolocation', function() {
					map.removeControl(geolocation);
					geolocation = new AMap.Geolocation(options);
					map.addControl(geolocation);
					geolocation.getCurrentPosition(function(status, result) {
						if (status == 'complete') {

							onComplete1(result)
						} else {
							onError(result)
						}
					});
				});
			}, 10000);//定时器10s一次重新定位

			//解析定位结果
			function onComplete(data) {
				document.getElementById('status').innerHTML = '定位成功'
				var str = [];
				console.log(data);
				//var test = document.getElementById("destination").innerText;
				//var location=text.indexOf(",");
				//var left=text.substring(0,minutelocation-1);
				//var right=text.substring(minutelocation+1,minutelocation.length);
				path.push([ data.position.Q, data.position.P ]);

				//此处可能导致错误，原因是未通过表单传递数据进入该界面
				//var tempdestination=document.getElementById('hzzsbstart').innerText;
				//var str=tempdestination.split(',');
				//path.push([str[0],str[1]]);
				path.push([ 120.04742974409801, 30.224854563803 ]);
				console.log(path);
				//path.push([left, right]);
				//console.log(path[0]);
				//console.log(path[1]);
				str.push('定位结果：' + data.position);
				str.push('定位类别：' + data.location_type);
				if (data.accuracy) {
					str.push('精度：' + data.accuracy + ' 米');
				}//如为IP精确定位结果则没有精度信息
				str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
				document.getElementById('result').innerHTML = str.join('<br>');

				//绘制初始路径
				//path.push([116.303843, 39.983412]);
				//path.push([116.321354, 39.896436]);
				var drag = {
					'showMarker' : false,
					'visible' : false
				};
				map.plugin("AMap.DragRoute", function() {
					route = new AMap.DragRoute(map, path,
							AMap.DrivingPolicy.LEAST_FEE, {
								'startMarkerOptions' : drag
							}); //构造拖拽导航类
					route.search(); //查询导航路径并开启拖拽导航
				});
				//console.log(path[0].Q+"   "+path[0].P);
				driving.search(new AMap.LngLat(path[0].Q, path[0].P),
						new AMap.LngLat(path[1].Q, path[1].P), function(status,
								result) {
							// result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
							if (status === 'complete') {
								log.success('绘制驾车路线完成')
							} else {
								log.error('获取驾车数据失败：' + result)
							}
						});

			}
			function onComplete1(data) {
				//map.removeControl(geolocation);
				/*map = new AMap.Map("container", {
				  resizeEnable: true,
				  zoom: 13
				});*/
				//var geolocation = new AMap.Geolocation(options);
				//map.addControl(geolocation);
				//geolocation.getCurrentPosition();
				document.getElementById('status').innerHTML = '定位成功'
				var str = [];
				console.log(data);
				//var test = document.getElementById("destination").innerText;
				//var location=text.indexOf(",");
				//var left=text.substring(0,minutelocation-1);
				//var right=text.substring(minutelocation+1,minutelocation.length);
				path[0].Q = data.position.Q;
				path[0].P = data.position.P;

				//此处可能导致错误，原因是未通过表单传递数据进入该界面
				//var tempdestination=document.getElementById('hzzsbstart').innerText;
				//var str=tempdestination.split(',');
				//path.push([str[0],str[1]]);

				console.log(path);
				//path.push([left, right]);
				//console.log(path[0]);
				//console.log(path[1]);
				str.push('定位结果：' + data.position);
				str.push('定位类别：' + data.location_type);
				if (data.accuracy) {
					str.push('精度：' + data.accuracy + ' 米');
				}//如为IP精确定位结果则没有精度信息
				str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
				document.getElementById('result').innerHTML = str.join('<br>');

				//绘制初始路径
				//path.push([116.303843, 39.983412]);
				//path.push([116.321354, 39.896436]);
				var drag = {
					'showMarker' : false,
					'visible' : false
				};
				route.destroy();
				map.removeControl(route);
				map.plugin("AMap.DragRoute", function() {
					route = new AMap.DragRoute(map, path,
							AMap.DrivingPolicy.LEAST_FEE, {
								'startMarkerOptions' : drag
							}); //构造拖拽导航类
					route.search(); //查询导航路径并开启拖拽导航
				});
				//console.log(path[0].Q+"   "+path[0].P);

				driving.search(new AMap.LngLat(path[0].Q, path[0].P),
						new AMap.LngLat(path[1].Q, path[1].P), function(status,
								result) {
							// result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
							if (status === 'complete') {
								log.success('绘制驾车路线完成')
							} else {
								log.error('获取驾车数据失败：' + result)
							}
						});
				setTimeout(function() {
					AMap.plugin('AMap.Geolocation', function() {
						map.removeControl(geolocation);
						geolocation = new AMap.Geolocation(options);
						map.addControl(geolocation);
						geolocation
								.getCurrentPosition(function(status, result) {
									if (status == 'complete') {

										onComplete1(result)
									} else {
										onError(result)
									}
								});
					});
				}, 10000);
			}
			//解析定位错误信息
			function onError(data) {
				document.getElementById('status').innerHTML = '定位失败'
				document.getElementById('result').innerHTML = '失败原因排查信息:'
						+ data.message;
			}
			function test() {
				//document.getElementById('panel')="";

				driving.search(new AMap.LngLat(path[0].Q, path[0].P),
						new AMap.LngLat(path[1].Q, path[1].P), function(status,
								result) {
							// result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
							if (status === 'complete') {
								get()
								log.success('绘制驾车路线完成')
							} else {
								log.error('获取驾车数据失败：' + result)
							}
						});

			}
			function get() {
				var blank = "";
				document.getElementById("minute").value = blank;
				document.getElementById("distance").value = blank;
				//获取panel上的时间距离，并更新时间和距离的隐藏表单
				var demo = document.getElementsByClassName("planTitle");
				var p = demo[0].getElementsByTagName("p");
				var text = p[0].innerText;
				console.log(p[0].innerText);
				var minutelocation = text.indexOf("(");
				var minute = text.substring(0, minutelocation);
				console.log(minute);
				var distancelocation = text.indexOf(")");
				var distance = text.substring(minutelocation + 1,
						distancelocation);
				document.getElementById("minute").value = minute;
				document.getElementById("distance").value = distance;
				console.log(distance);
				console.log(AMap.GeometryUtil.distance(path[0], path[1]));
			}
		</script>
	</div>
</body>
</html>