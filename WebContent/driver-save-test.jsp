<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<s:form action="driversave" method="post">
		<s:textfield name="loginUser.name" label="请输入昵称"/>
		<s:radio name="loginUser.gender" list="#{true:'男',false:'女'}" label="请选择性别"/>
		<s:textfield name="loginUser.age" label="请输入年龄"/>
		<s:textfield name="loginUser.idnumber" label="请输入身份证号"/>
		<s:textfield name="loginUser.license" label="请输入驾照"/>
		<s:textfield name="loginUser.experience" label="请输入驾龄"/>
		<s:textfield name="loginUser.account" label="请输入账号"/>
		
		<s:password name="loginUser.password" label="请输入密码"/>
		请输入您的车辆信息
		<s:textfield name="loginUser.car.seats" label="请输入总座位数"/>
		<s:textfield name="loginUser.car.color" label="请输入颜色"/>
		<s:textfield name="loginUser.car.plate" label="请输入车牌"/>
		<s:textfield name="loginUser.car.type" label="请输入类别"/>
		<s:textfield name="loginUser.car.location" label="请输入位置"/>
		
		<s:submit value="提交"/>
	</s:form>
</body>
</html>