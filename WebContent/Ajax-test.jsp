<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<button id="btn" onclick="cli()"></button>
	<s:property value="order.orderID"/>
</body>
<script>
	//以下是未测试废弃版
	/*if (window.XMLHttpRequest) {
	// code for IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp=new XMLHttpRequest();
	}
	else { // code for IE6, IE5
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function() {		    
	if (this.readyState==4 && this.status==200) {
	document.getElementById("txtHint").innerHTML=this.responseText;
	}
	}
	xmlhttp.open("GET","/driverlocation",false);
	xmlhttp.send();*/
	
	//以下是成功版(不需order实例化,仍需new)
	function cli(){
		
		var url='ajaxRequest';
		var params={
				testid:1
		};
		jQuery.post(url,params,callbackFun,'json');
	}
	function callbackFun(data)
	{
		console.log(data);
		//alert(data);
	}
	
	//以下是测试版(未来order先被实例化后可能可以使用)
	/*function cli(){
		
		var url='ajaxRequest';
		var params={
				order:{
					orderID:1
				}
		};
		jQuery.post(url,params,callbackFun,'json');
	}
	function callbackFun(data)
	{
		console.log(data);
		alert(data.orderID);
	}*/
</script>
</html>