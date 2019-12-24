<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
 <script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="./css/xadmin.css">
 <script src="https://cdn.bootcss.com/jquery/3.4.1/core.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  .connection{
  	position:absolute;
  	bottom:40px;
  	right:10px;
  }
  
  .cancel{
  	position:absolute;
  	bottom:40px;
  	left:10px;
  }
</style>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="en">
<head>
<meta charset="utf-8">
<title>前往始发地</title>
</head>
<body>
	<div id="container" onmouseup="test()"></div>
<div id="panel"></div>
<div class="info" style="visibility:hidden">
  <h4 id='status'style="visibility:hidden"></h4><hr>
  <p id='result' style="visibility:hidden"></p><hr>
  <p style="visibility:hidden">由于众多浏览器已不再支持非安全域的定位请求，为保位成功率和精度，请升级您的站点到HTTPS。</p>
</div>
<!--<s:property  value="order.passenger.nickname"/>
<form style="absolute">
	<input type="text" id="minute" name="minute">
	<input type="text" id="distance" name="distance">
	<input type="submit" value="提交">
</form>-->
<table>
	<tr>
		<td id="td1"><s:property value="order.passenger.nickname"/></td>
		<td id="td2"><s:property value="order.passenger.telephone"/></td>
		<td id="td3"><s:property value="order.start"/></td>
		<td id="td4"><s:property value="order.destination"/></td>
		<td id="td5"></td>
		<td id="td6"></td>
		<td id="td7"><s:property value="order.orderID"/></td>

	</tr>
</table>
<!-- Button trigger modal -->
<button type="button" id="btn1" class="layui-btn connection" data-toggle="modal" data-target="#myModal">
联系用户
</button>
<button type="button" id="btn2" class="layui-btn layui-btn-danger cancel" data-toggle="modal" data-target="#myModal1">
取消订单
</button>
 
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">乘客信息</h4>
      </div>
      <div class="modal-body">
                <form id="updateform" action="getpassenger" >
                	
                    <div class="form-group">
                        <label for="loginname" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="nickname" name="nickname" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">联系方式:</label>
                        <input type="text" class="form-control" id="telephone" name="telephone" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label">起点:</label>
                        <input type="text" class="form-control" id="start" name="start" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">终点:</label>
                        <input class="form-control" id="destination" name="destination" readonly="readonly">
                    </div>
                    <input type="hidden" class="form-control" id="id" name="order.orderID" readonly="readonly">
                    <input type="text" class="form-control" id="start" name="order.starttime" readonly="readonly">
                    <div class="text-right">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="submitBtn" type="submit" class="btn btn-primary"" >已接到乘客</button>
                    </div>
               </form>
      </div>
    </div>
  </div>
</div>
 <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header btn-danger">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title " id="myModalLabel">确认要取消订单吗！！！(无故取消会被给予低评分)</h4>
      </div>
      <div class="modal-body">
                <s:form id="cancelorder" action="cancelorder" >
                    <div class="form-group">
                        <label for="loginname" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="nickname1" name="loginname" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">联系方式:</label>
                        <input type="text" class="form-control" id="telephone1" name="email" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label">起点:</label>
                        <input type="text" class="form-control" id="start1" name="phone" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">终点:</label>
                        <input type="text" class="form-control" id="destination1" name="phone" readonly="readonly">
                    </div>
                    <input type="hidden" class="form-control" id="id1" name="order.orderID" readonly="readonly">
                    <div class="text-right">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="submitBtn" type="submit" class="btn btn-danger"  >确认取消</button>
                    </div>
                </s:form>
      </div>
    </div>
  </div>
</div>
</body>
 
<script>
    function add_info()
    {
        var form = document.getElementById('updateform');
        form.submit();
        $("#myModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
 
    }
</script>
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
  var options={
		  	'timeout': 10000,          //超过10秒后停止定位，默认：5s
		 	'showButton': true,//是否显示定位按钮
			'buttonPosition': 'LB',//定位按钮的位置
			/* LT LB RT RB */
			'buttonOffset': new AMap.Pixel(10, 20),//定位按钮距离对应角落的距离
			'showMarker': true,//是否显示定位点
			'markerOptions':{//自定义定位点样式，同Marker的Options
			  'offset': new AMap.Pixel(-18, -33),
			  'content':'<img src="./css/car.png" style="width:65px;height:65px"/>'
			},
			'showCircle': false,//是否显示定位精度圈
			'circleOptions': {//定位精度圈的样式
				'strokeColor': '#0093FF',
				'noSelect': true,
				'strokeOpacity': 0.5,
				'strokeWeight': 1,
				'fillColor': '#02B0FF',
				'fillOpacity': 0.25
			}
}
  AMap.plugin('AMap.Geolocation', function() {
    var geolocation = new AMap.Geolocation(options);
    map.addControl(geolocation);
    geolocation.getCurrentPosition(function(status,result){
    	if(status=='complete'){
        	onComplete(result)
        }else{
            onError(result)
    	}
    });
  });
//定时器30s一次重新定位
  
  setTimeout(function () {
	  AMap.plugin('AMap.Geolocation', function() {
		    var geolocation = new AMap.Geolocation(options);
		    map.addControl(geolocation);
		    geolocation.getCurrentPosition(function(status,result){
		      if(status=='complete'){		    	  
		        onComplete1(result)
		      }else{
		        onError(result)
		      }
		    });
		  });
  },10000);
  
  //解析定位结果
  function onComplete(data) {
    document.getElementById('status').innerHTML='定位成功'
    var str = [];
    console.log(path);
    //var test = document.getElementById("destination").innerText;
    //var location=text.indexOf(",");
	//var left=text.substring(0,minutelocation-1);
	//var right=text.substring(minutelocation+1,minutelocation.length);
    path.push([data.position.Q, data.position.P]);
    
    //此处可能导致错误，原因是未通过表单传递数据进入该界面
    //var tempdestination=document.getElementById('hzzsbstart').innerText;
    //var str=tempdestination.split(',');
    //path.push([str[0],str[1]]);
    path.push([120.04742974409801, 30.224854563803]);
    //path.push([left, right]);
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
    var drag={
    		'showMarker': false,
    		'visible':false
    };
    map.plugin("AMap.DragRoute", function() {
      route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE,{
    	  'startMarkerOptions':drag
      }); //构造拖拽导航类
      route.search(); //查询导航路径并开启拖拽导航
    });
    //console.log(path[0].Q+"   "+path[0].P);
    driving.search(new AMap.LngLat(path[0].Q,path[0].P),new AMap.LngLat(path[1].Q,path[1].P),function(status, result) {
      // result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
      if (status === 'complete') {
        log.success('绘制驾车路线完成')
        get();
      } else {
        log.error('获取驾车数据失败：' + result)
      }
    });
    
    
  }
  function onComplete1(data) {
	  	//map = new AMap.Map("container", {
		//   resizeEnable: true,
		//    zoom: 13
		//  });
	  	cli(data);
	    document.getElementById('status').innerHTML='定位成功'
	    var str = [];
	    console.log(data);
	    //var test = document.getElementById("destination").innerText;
	    //var location=text.indexOf(",");
		//var left=text.substring(0,minutelocation-1);
		//var right=text.substring(minutelocation+1,minutelocation.length);
	    path[0].Q=data.position.Q;
	    path[0].P=data.position.P;
	    
	    //此处可能导致错误，原因是未通过表单传递数据进入该界面
	    //var tempdestination=document.getElementById('hzzsbstart').innerText;
	    //var str=tempdestination.split(',');
	    //path.push([str[0],str[1]]);
	   
	    //console.log(path);
	    //path.push([left, right]);
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
	    var drag={
    		'showMarker': false,
    		'visible':false
	    };
	    route.destroy();
	    map.removeControl(route);
	    map.plugin("AMap.DragRoute", function() {
	      route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE,{
	    	  'startMarkerOptions':drag
		  }); //构造拖拽导航类
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
	    setTimeout(function () {
	  	  AMap.plugin('AMap.Geolocation', function() {
	  		    var geolocation = new AMap.Geolocation(options);
	  		    map.addControl(geolocation);
	  		    geolocation.getCurrentPosition(function(status,result){
	  		      if(status=='complete'){
	  		    	  
	  		        onComplete1(result)
	  		      }else{
	  		        onError(result)
	  		      }
	  		    });
	  		  });
	    },30000);
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
	    	  get();
	        log.success('绘制驾车路线完成')
	      } else {
	        log.error('获取驾车数据失败：' + result)
	      }
	    });
	  
  }
  function get(){
	  var blank="";
	  document.getElementById("td5").value=blank;
	  document.getElementById("td6").value=blank;
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
	  document.getElementById("td5").innerHTML=minute;
	  document.getElementById("td6").innerHTML=distance;
	  console.log(distance);
	  console.log(AMap.GeometryUtil.distance(path[0], path[1]));
  }
  $("#btn1").click(function(){console.log("btn1");set();});
  $("#btn2").click(function(){console.log("btn2");set();});
  function set(){
	  document.getElementById("nickname").value=document.getElementById("td1").innerHTML;
	  document.getElementById("telephone").value=document.getElementById("td2").innerHTML;
	  document.getElementById("start").value=document.getElementById("td3").innerHTML;
	  document.getElementById("destination").value=document.getElementById("td4").innerHTML;
	  document.getElementById("id").value=document.getElementById("td7").innerHTML;
	  document.getElementById("nickname1").value=document.getElementById("td1").innerHTML;
	  document.getElementById("telephone1").value=document.getElementById("td2").innerHTML;
	  document.getElementById("start1").value=document.getElementById("td3").innerHTML;
	  document.getElementById("destination1").value=document.getElementById("td4").innerHTML;
	  document.getElementById("id1").value=document.getElementById("td7").innerHTML;
  }
  function cli(data){
		
		var url='ajaxRequest';
		var params={
					longitude:data.position.Q,
					latitude:data.position.P
		};
		console.log(params);
		jQuery.post(url,params,callbackFun);
		/*$.ajax({
			type:"POST",
			url:url,
			dataType:"json",
			success:callbackFun(data)
		});*/
	}
	function callbackFun(data)
	{
		console.log(data);
		//alert(data);
	} 
</script>
</body>
</html>