<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">
.box {
    color: #999;
}
.box .sel {
    color: #f00;
}
.icon{
	width:70px;
	height:70px;
}
.es{
	width:200px;
	margin:0px auto;
}
.fade{
	!important:visibility:visible;
	display:inline;
}
</style>
</head>

<body>
<div class="es">
	
	<img src="./css/drivericon.jpg" class="icon">
	<s:label name="order.passenger.name"/>
	<s:if test="order.passenger.gender==1">
		<s:text name="先生"/>
	</s:if>
	<s:else>
		<s:text name="女士"/>
	</s:else><br>
	<span class="box">
    	<span>★</span>
	    <span>★</span>
	    <span>★</span>
	    <span>★</span>
	    <span>★</span>
	</span>
	<span>0</span>分
</div>
<script type="text/javascript">
$(function(){
    $(".box span").click(function(event){
        $(this).parent().find("span").addClass("sel");
        $(this).nextAll().removeClass("sel");
        $(this).parent().next().text($(this).index()+1);
    });
});
 
</script>
</body>
</html>