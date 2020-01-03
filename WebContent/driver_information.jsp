<%@page import="cn.edu.zjut.po.Driver"%>
<%@page import="com.sun.xml.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>个人信息</title>
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
</head>

<body>
	<div class="x-body">
	
			<div class="layui-form-item">
				<label for="account" class="layui-form-label"> 姓名</label>
				<div class="layui-form-label" id="div1">
						</div>
			</div>
			<div class="layui-form-item">
				<label for="phone" class="layui-form-label" > 联系方式 </label>
				<div class="layui-form-label" id="div2">
					
						</div>
			</div>
			<div class="layui-form-item">
				<label for="nickname" class="layui-form-label" > 综合评分 </label>
				<div class="layui-form-label" id="div3">
					</div>
			</div>
			<div class="layui-form-item">
				<label for="password" class="layui-form-label" > 车牌号 </label>
				<div class="layui-form-label" id="div4">
					</div>
			</div>
	</div>
</body>
<script>
$(document).ready(function(){
	var drivername = localStorage.getItem("drivername");
	var drivertelephone = localStorage.getItem("drivertelephone");
	var driverscore = localStorage.getItem("driverscore");
	var drivercarplate = localStorage.getItem("drivercarplate");
	document.getElementById("div1").innerHTML=drivername;
	document.getElementById("div2").innerHTML=drivertelephone;
	document.getElementById("div3").innerHTML=driverscore;
	document.getElementById("div4").innerHTML=drivercarplate;
});

</script>
</html>