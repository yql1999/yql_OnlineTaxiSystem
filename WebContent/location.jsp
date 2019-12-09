<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<style type="text/css">
  html,
  body,
  #container {
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
  .info{
    width:26rem;
  }
</style>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<div id="container" onmouseup="test()"></div>
<div id="panel"></div>
<div class="info" style="visibility:hidden">
  <h4 id='status'style="visibility:hidden"></h4><hr>
  <p id='result' style="visibility:hidden"></p><hr>
  <p style="visibility:hidden">由于众多浏览器已不再支持非安全域的定位请求，为保位成功率和精度，请升级您的站点到HTTPS。</p>
</div>
<form style="absolute">
	<input type="text" id="minute" name="minute">
	<input type="text" id="distance" name="distance">
	<input type="submit" value="提交">
</form>
<s:text id="hzzsbstart" name="xxxx.start"/>
<s:text name="xxxx.destination"/>
<script>
  var map, route, marker;
  var path = [];
  var driving=new AMap.Driving({
      //map:map,
      panel:"panel"
    });
  //基本地图加载
  map = new AMap.Map("container", {
    resizeEnable: true,
    zoom: 13
  });
  AMap.plugin('AMap.Geolocation', function() {
    var geolocation = new AMap.Geolocation({
      enableHighAccuracy: true,//是否使用高精度定位，默认:true
      timeout: 10000,          //超过10秒后停止定位，默认：5s
      buttonPosition:'RB',    //定位按钮的停靠位置
      buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
      zoomToAccuracy: true,   //定位成功后是否自动调整地图视野到定位点

    });
    map.addControl(geolocation);
    geolocation.getCurrentPosition(function(status,result){
      if(status=='complete'){
    	  
        onComplete(result)
      }else{
        onError(result)
      }
    });
  });
  //解析定位结果
  function onComplete(data) {
    document.getElementById('status').innerHTML='定位成功'
    var str = [];
    console.log(path);
    path.push([data.position.Q, data.position.P]);
    
    //此处可能导致错误，原因是未通过表单传递数据进入该界面
    var tempdestination=document.getElementById('hzzsbstart').innerText;
    var str=tempdestination.split(',');
    path.push([str[0],str[1]]);
    
    path.push([120.033850948497, 30.22776547609972]);
    //console.log(path[0]);
    //console.log(path[1]);
    str.push('定位结果：' + data.position);
    str.push('定位类别：' + data.location_type);
    if(data.accuracy){
      str.push('精度：' + data.accuracy + ' 米');
    }//如为IP精确定位结果则没有精度信息
    str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
    document.getElementById('result').innerHTML = str.join('<br>');
    
    //绘制初始路径
    //path.push([116.303843, 39.983412]);
    //path.push([116.321354, 39.896436]);
    map.plugin("AMap.DragRoute", function() {
      route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE); //构造拖拽导航类
      route.search(); //查询导航路径并开启拖拽导航
    });
    //console.log(path[0].Q+"   "+path[0].P);
    driving.search(new AMap.LngLat(path[0].Q,path[0].P),new AMap.LngLat(path[1].Q,path[1].P),function(status, result) {
      // result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
      if (status === 'complete') {
        log.success('绘制驾车路线完成')
      } else {
        log.error('获取驾车数据失败：' + result)
      }
    });
    
  }
  //解析定位错误信息
  function onError(data) {
    document.getElementById('status').innerHTML='定位失败'
    document.getElementById('result').innerHTML = '失败原因排查信息:'+data.message;
  }
  function test(){
	  //document.getElementById('panel')="";
	  
	  driving.search(new AMap.LngLat(path[0].Q,path[0].P),new AMap.LngLat(path[1].Q,path[1].P),function(status, result) {
	      // result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
	      if (status === 'complete') {
	    	  get()
	        log.success('绘制驾车路线完成')
	      } else {
	        log.error('获取驾车数据失败：' + result)
	      }
	    });
	  
  }
  function get(){
	  var blank="";
	  document.getElementById("minute").value=blank;
	  document.getElementById("distance").value=blank;
	  //获取panel上的时间距离，并更新时间和距离的隐藏表单
	  var demo = document.getElementsByClassName("planTitle");
	  var p=demo[0].getElementsByTagName("p");
	  var text=p[0].innerText;
	  console.log(p[0].innerText);
	  var minutelocation=text.indexOf("(");
	  var minute=text.substring(0,minutelocation);
	  console.log(minute);
	  var distancelocation=text.indexOf(")");
	  var distance=text.substring(minutelocation+1,distancelocation);
	  document.getElementById("minute").value=minute;
	  document.getElementById("distance").value=distance;
	  console.log(distance);
	  console.log(AMap.GeometryUtil.distance(path[0], path[1]));
  }
</script>
</body>
</html>