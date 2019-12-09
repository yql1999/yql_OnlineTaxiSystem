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
	<s:form action="ordersave" method="post">
		<s:textfield name="order.start" label="请输入始发地"/>
		<s:textfield name="order.destination" label="请输入终点"/>
		<s:textfield name="order.starttime" label="请输入开始时间"/>
		<s:textfield name="order.endtime" label="请输入结束时间"/>
		<s:textfield name="order.passengerID" label="请输入乘客ID"/>
		<s:textfield name="order.driverID" label="请输入司机ID"/>

		<s:textfield name="order.passnum" label="请输入乘客数量"/>
		<s:textfield name="order.type" label="请输入类别"/>
		<s:textfield name="order.sum" label="请输入总价"/>
		<s:submit value="提交"/>
	</s:form>
</body>
</html>