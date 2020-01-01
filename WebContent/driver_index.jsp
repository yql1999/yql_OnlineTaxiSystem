<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>司机主页</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
	
</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.html">叶子打车</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
          <div id="a" style="visiblity:hidden;display:none;"><s:property value="loginUser.driverID"/></div>
            <a href="javascript:;" ><s:property value="loginUser.name"/></a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd>
						<a
							onclick="x_admin_show('个人信息','manager_information.jsp',600,300)">查看个人信息</a>
					</dd>
					
					<dd>
						<a href="Login.jsp">退出登录</a>
					</dd>
      
            </dl>
          </li>
          <li class="layui-nav-item to-index"><a href="manager_index.jsp">前台首页</a></li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">                 
                    <li>
                        <a _href="driverInfo1" id="driverID">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人信息管理</cite>                            
                        </a>
                    </li > 
                    <li>
                        <a _href="driverhistory" id="riverID1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>查看历史订单</cite>                            
                        </a>
                    </li >                
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="findorders" id="orderlist">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                         </a>
                    </li >
                    <li>
                        <a _href="driverEstimate" id="driver">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>司机评价</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
      </div>
    </div>
   
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./manager_welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Leaf-Booking-Car</div>  
    </div>
    <!-- 底部结束 -->
    
</body>
<script>
var map,result,t,g;
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
        console.log(result.position);
        t=result.position.P;
        g=result.position.Q;
        var a=document.getElementById("a").innerHTML;
    	console.log(t);
    	console.log(g);
    	document.getElementById("orderlist").setAttribute("_href","findorders?order.driver.driverID="+a+"&latitude="+t+"&longitude="+g);
    	document.getElementById("driverID").setAttribute("_href","driverInfo1?loginUser.driverID="+a);
    	document.getElementById("riverID1").setAttribute("_href","driverhistory?order.driver.driverID="+a);
		document.getElementById("driver").setAttribute("_href","findestimate?order.driver.driverID="+a)
      }else{
        onError(result);
      }})
})
/*window.onload=function(){
	//document.getElementById("driverid").value=document.getElementById("a").innerHTML;
	var a=document.getElementById("a").innerHTML;
	console.log(t);
	console.log(g);
	document.getElementById("orderlist").setAttribute("_href","findorders?order.driver.driverID="+a+"&latitude="+t+"&longitude="+g);
	//document.getElementById("orderlist").click();
	//document.getElementById("sbtn").click();
	//window.open="localhost:8080/leaf/findorders?order.driver.driverID="+a;
}*/
</script>
</html>