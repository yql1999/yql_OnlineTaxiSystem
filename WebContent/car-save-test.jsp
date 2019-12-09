<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<s:form action="carsave" method="post">
		<s:textfield name="car.seats" label="请输入总座位数"/>
		<s:textfield name="car.color" label="请输入颜色"/>
		<s:textfield name="car.plate" label="请输入车牌"/>
		<s:textfield name="car.type" label="请输入类别"/>
		<s:textfield name="car.location" label="请输入位置"/>

		<s:submit value="提交"/>
	</s:form>
</body>
</html>