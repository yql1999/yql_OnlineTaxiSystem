<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<meta charset="utf-8">
<title>历史订单</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="./driver_welcome.jsp">我的首页</a>
			<a> <cite>历史订单</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<table class="layui-table">
			<thead>
				<tr>
					<!--<th>
						<div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>  -->
					<th>订单编号</th>
					<th>乘客编号</th>
					<th>出发地</th>
					<th>目的地</th>
					<th>乘客人数</th>
					<th>订单类型</th>
					<th>总价</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="orders" var="object">
			   <s:if test="#object.isCompleted!=0">
               <tr>
                   <!--<td>
                       <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                   </td>  -->
                   
                   <td><s:property value="#object.orderID"/></td>
                   <td><s:property value="#object.passenger.passengerID"/></td>
                   <td><s:property value="#object.start"/></td>
                   <td><s:property value="#object.destination"/></td>
                   <td><s:property value="#object.passnum"/></td>
                   <td><s:property value="#object.type"/></td>
					<td><s:property value="#object.sum"/></td>
               </tr>
            
            </s:if>
            </s:iterator>
            </tbody>
			</table>
</body>
</html>