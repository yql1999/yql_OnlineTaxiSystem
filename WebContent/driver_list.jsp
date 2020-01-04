<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>司机界面</title>
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
<%!int idNum=0; 
	int i = 0;%>
    <script type="text/javascript" language="JavaScript">
    $(document).ready(function(){
			<%for(i=0;i<100;i++){%>
			//console.log("11111");
				$("#btn<%=i%>").click(function(){
					console.log("kaishi "+<%=i%>+"anniu ");
					document.getElementById("inp").value=document.getElementById("<%="td1"+i%>").innerHTML;
					document.getElementById("car").value=document.getElementById("<%="div1"+i%>").innerHTML;
					setTimeout(function(){
						document.getElementById("bt").click();
					},1000);
					
					//$("#orderModal").modal("show");
					return false;
				});
			<%}%>
		});
    </script>
</head>
<body class="layui-anim layui-anim-up">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="manager_welcome.jsp">首页</a> <a
			href="">司机列表</a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="driverlist" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>

		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>车辆ID</th>
					<th>用户名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>身份证号</th>
					<th>驾驶证号</th>
					<th>驾龄(年)</th>
					<th>评分</th>
					<th>联系方式</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
				<tbody>
					<s:iterator value="driver" var="object">
						<tr>
							<td id="<%="td1"+idNum%>"><s:property value="#object.driverID" /></td>
						    <td id="<%="div1"+idNum%>"><s:property value="#object.car.carID" /></td>
							<td><s:property value="#object.name" /></td>
							<td><!--<s:property value="#object.gender" />--><s:if test="#object.gender > 0">男</s:if><s:elseif test="#object.gender < 1">女</s:elseif></td>
							<td><s:property value="#object.age" /></td>
							<td><s:property value="#object.idnumber" /></td>
							<td><s:property value="#object.license" /></td>
							<td><s:property value="#object.experience" /></td>
							<td><s:property value="#object.score" /></td>
							<td><s:property value="#object.telephone" /></td>
							<td class="td-status"><span
								class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
							<td class="td-manage"><a onclick="member_stop(this,'10001')"
								href="javascript:;" title="停用"> <i class="layui-icon">&#xe601;</i>
							</a> <button id="<%="btn"+idNum%>" ><i class="layui-icon">&#xe640;</i></button>
							</td>
						</tr>
						<% idNum++; %>
					</s:iterator>
					<s:form action="managerdeletedriver" >
							要删除的司机ID:<input id="inp"  name="driv.driverID" >
							要删除的车辆ID:<input id="car"  name="car.carID" >
								<button type="submit" id="bt" value="删除" ></button>
					</s:form>
				</tbody>
		</table>
	</div>
	<script>
		/*用户-停用*/
		function member_stop(obj, id) {
			layer.confirm('确认要更改吗？', function(index) {

				if ($(obj).attr('title') == '停用') {

					//发异步把用户状态进行更改
					$(obj).attr('title', '启用')
					$(obj).find('i').html('&#xe62f;');

					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('已停用');
					layer.msg('已停用!', {
						icon : 5,
						time : 1000
					});

				} else {
					$(obj).attr('title', '停用')
					$(obj).find('i').html('&#xe601;');

					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已启用');
					layer.msg('已启用!', {
						icon : 5,
						time : 1000
					});
				}

			});
		}

	</script>
</body>
</html>