<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.edu.zjut.po.Passenger"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
	<div class="x-body layui-anim layui-anim-up">
	<%Passenger passenger=(Passenger)request.getSession().getAttribute("passenger");%>
		<blockquote class="layui-elem-quote">
			欢迎您，<span class="x-red"><%=passenger.getName() %></span>！ 当前时间：<%= new java.util.Date()%>
		</blockquote>

		<fieldset class="layui-elem-field">
			<legend>个人信息</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-skin="line">
					<tbody>
						<tr>
							<td><a
								onclick="x_admin_show('查看个人信息','passenger_information.jsp',600,400)"
								class="x-a" target="_blank">查看个人信息</a></td>
						</tr>
						<tr>
							<td><a
								onclick="x_admin_show('修改个人信息','passenger_update.jsp',600,400)"
								class="x-a" target="_blank">修改个人信息</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend>我的历史订单</legend>
			<div class="layui-field-box">
				<table class="layui-table">
			<%int num=1;%>
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</th>
						<th>订单编号</th>
						<th>出发地</th>
						<th>目的地</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>乘客数量</th>
						<th>订单状态</th>
						<th>金额</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody><%-- <s:set name="orders" var="#session['orders']"/> --%>
				<%-- <s:iterator value="#session.orders" var='order'> --%>
				<s:iterator value="#session.orders">
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary" data-id='2'>
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td><%=num++ %></td>
						<td><s:property value='start'/></td>
						<td><s:property value='destination'/></td>
						<td><s:property value='starttime'/></td>
						<td><s:property value='endtime'/></td>
						<td><s:property value='passnum'/></td>
						<td><s:property value='isCompleted!=0 ? "已完成" : "未完成"'/></td>
						<td><s:property value='sum'/></td>
						<td class="td-manage">
							<!-- 
              <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a> --> <a title="删除" onclick="member_del(this,'要删除的id')"
							href="javascript:;"> <i class="layui-icon">&#xe640;</i>
						</a>
						</td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
			</div>
		</fieldset>
	</div>
</body>
</html>