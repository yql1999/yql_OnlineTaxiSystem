<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%!int idNum=0; 
	int i = 0;%>
    <script type="text/javascript" language="JavaScript"> 
    $(document).ready(function(){
    	
			<%for(i=0;i<100;i++){%>
				$("#btn<%=i%>").click(function(){
					console.log("kaishi "+<%=i%>+"anniu ");
					document.getElementById("i1").value=$(<%="td1"+i%>).html();
					document.getElementById("i2").value=$(<%="td3"+i%>).html();
					document.getElementById("i3").value=$(<%="td4"+i%>).html();
					document.getElementById("i4").value=$(<%="td5"+i%>).html();
					document.getElementById("i5").value=$(<%="td6"+i%>).html();
					document.getElementById("i6").value=$(<%="td7"+i%>).html();
					document.getElementById("i7").value=$(<%="td8"+i%>).html();
					document.getElementById("i8").value=$(<%="td9"+i%>).html();
					document.getElementById("i9").value=$(<%="td10"+i%>).html();
					document.getElementById("i10").value=$(<%="td11"+i%>).html();
					document.getElementById("i11").value=$(<%="td12"+i%>).html();
					document.getElementById("i12").value=$(<%="td13"+i%>).html();
					document.getElementById("i13").value=$(<%="td2"+i%>).html();
					document.getElementById("ID").value=document.getElementById("id").innerHTML;
					$("#orderModal").modal("show");
					return false;
				});
			<%}%>
		});
    </script>
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so">

				<input type="text" name="username" placeholder="请输入订单号"
					autocomplete="off" class="layui-input">
				<button class="layui-btn" lay-submit="" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
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
					<th></th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="orders" var="object">
			   <s:if test="#object.isCompleted==0">
               <tr id="<%="tr"+idNum%>">
                   <!--<td>
                       <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                   </td>  -->
                   
                   <td id="<%="td1"+idNum%>"><s:property value="#object.orderID"/></td>
                   <td id="<%="td2"+idNum%>"><s:property value="#object.passenger.passengerID"/></td>
                   <td id="<%="td3"+idNum%>"><s:property value="#object.start"/></td>
                   <td id="<%="td4"+idNum%>"><s:property value="#object.destination"/></td>
                   <td id="<%="td5"+idNum%>"><s:property value="#object.passnum"/></td>
                   <td id="<%="td6"+idNum%>"><s:property value="#object.type"/></td>
                   <td id="<%="td7"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.starttime"/></td>
                   <td id="<%="td8"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.endtime"/></td>
                   <td id="<%="td9"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.sum"/></td>
                   <td id="<%="td10"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.estimateptod"/></td>
                   <td id="<%="td11"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.estimatedtop"/></td>
                   <td id="<%="td12"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.isEstimated"/></td>
                   <td id="<%="td13"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.isCompleted"/></td>
                   <td id="<%="td14"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.slng"/></td>
                   <td id="<%="td15"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.slat"/></td>
                   <td>
                   <button id="<%="btn"+idNum%>" class="layui-btn layui-btn-sm" data-toggle="modal" data-target="#orderModal">确认接单</button>
                   </td>
               </tr>
            <% idNum++; %>
            </s:if>
            </s:iterator>
            </tbody>
			
		</table>
		<div id="id" style="visibility:hidden;display:none;"><s:property value="order.driver.driverID"/></div>
		<div style=" text-align:center">
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
					<s:form method="post" action="ordertaking">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">请确认是否接单</h4>
						</div>
						<div class="modal-body">
								<div class="form-group">
									<label>订单编号</label>
									<input type="text" class="form-control" name="order.orderID" readonly="readonly" id="i1"/>
								</div>
								<div class="form-group">
									<label>出发地</label>
									<input type="text" class="form-control" name="order.start" readonly="readonly" id="i2"/>
								</div>
								<div class="form-group">
									<label>目的地</label>
									<input type="text" class="form-control" name="order.destination" readonly="readonly" id="i3"/>
								</div>
								<div class="form-group">
									<label>乘客人数</label>
									<input type="text" class="form-control" name="order.passnum" readonly="readonly" id="i4"/>
								</div>
								<div class="form-group">
									<label>司机编号</label>
									<input type="text" class="form-control" name ="order.driver.driverID" readonly="readonly" id="ID"/>
									<!--<s:property value="loginUser.driverID"/>-->
								</div>
								<input type="text" class="form-control" name="order.type" readonly="readonly" style="visibility: hidden; display: none;" id="i5"/>
								<input type="text" class="form-control" name="order.starttime" readonly="readonly" style="visibility: hidden; display: none;" id="i6"/>
								<input type="text" class="form-control" name="order.endtime" readonly="readonly" style="visibility: hidden; display: none;" id="i7"/>
								<input type="text" class="form-control" name="order.sum" readonly="readonly" style="visibility: hidden; display: none;" id="i8"/>
								<input type="text" class="form-control" name="order.estimateptod" readonly="readonly" style="visibility: hidden; display: none;" id="i9"/>
								<input type="text" class="form-control" name="order.estimatedtop" readonly="readonly" style="visibility: hidden; display: none;" id="i10"/>
								<input type="text" class="form-control" name="order.isEstimated" readonly="readonly" style="visibility: hidden; display: none;" id="i11"/>
								<input type="text" class="form-control" name="order.isCompleted" readonly="readonly" style="visibility: hidden; display: none;" id="i12"/>
								<input type="text" class="form-control" name="order.passenger.passengerID" readonly="readonly" style="visibility: hidden; display: none;" id="i13"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">确认</button>
						</div>
						</s:form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		<div class="page" >
			<div>
				<a class="prev" href="#">&lt;&lt;</a> 
				<a class="num" href="#">1</a> 
				
				<a class="num" href="#">2</a> 
				<a class="num" href="#">3</a> 
				<a class="next" href="#">&gt;&gt;</a>
			</div>
		</div>
        </div>
	</div>
</body>
<script>
window.onload=function(){
	var flag=$("#td10").val();
	var fla=0;
	for(var t=0;t<100;t++){
		flag=$("#td1"+t).val();
		if(flag!=null){
			fla=1;
			break;
		}
		
	}
	console.log(flag);
	if(fla==0)
	{
		alert("现在没有可接订单，请稍后刷新");
	}
}
</script>
</html>