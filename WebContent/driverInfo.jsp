<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>司机主页</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="./css/xadmin.css">
 <script src="https://cdn.bootcss.com/jquery/3.4.1/core.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <script type="text/javascript" language="JavaScript"> 
    $(document).ready(function(){
    	$("#btn").click(function(){

        	//var loginUserID=document.getElementById("hzzsb").value;
        	//console.log(loginUserID);
			console.log(document.getElementById("td1").innerHTML);
    		document.getElementById("i1").value=document.getElementById("td1").innerHTML;
    		document.getElementById("i2").value=document.getElementById("td2").innerHTML;
       		document.getElementById("i3").value=document.getElementById("td3").innerHTML;
        	document.getElementById("i4").value=document.getElementById("td4").innerHTML;
        	document.getElementById("i5").value=document.getElementById("td5").innerHTML;
        	document.getElementById("i6").value=document.getElementById("td6").innerHTML;
        	document.getElementById("i7").value=document.getElementById("td7").innerHTML;
        	document.getElementById("i8").value=document.getElementById("td8").innerHTML;
       		document.getElementById("i9").value=document.getElementById("td9").innerHTML;

    		document.getElementById("i10").value=document.getElementById("td10").innerHTML;
        	document.getElementById("i11").value=document.getElementById("td11").innerHTML;
        	document.getElementById("i12").value=document.getElementById("td12").innerHTML;
        	document.getElementById("i13").value=document.getElementById("td13").innerHTML;
        	document.getElementById("i14").value=document.getElementById("td14").innerHTML;
        	$("#driverModal").modal("show");
    					return false;
    	});
		});
    </script>
	
</head>
<body class="layui-anim layui-anim-up">
	<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.jsp">首页</a>
        <a href="">个人信息</a>
        
      </span>
      <td id="hzzsb" style="visibility:hidden;display:none;"><s:property value="loginUser.driverID"/></td>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
    	<table class="layui-table">
    	
        <thead>
          <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>身份证号</th>
            <th>驾驶证号</th>
            <th>密码</th>
            <th>电话</th>
            <th>综合评分</th>
           </tr>
        </thead>
        <tbody>
          <tr>
          	<td id="td1"><s:property value="loginUser.driverID"/></td>
          	<td id="td2"><s:property value="loginUser.name"/></td>
          	<td id="td3" style="visibility:hidden;display:none;"><s:property value="loginUser.gender"/></td>
          	<td id="td4"><s:property value="loginUser.age"/></td>
          	<td id="td5"><s:property value="loginUser.idnumber"/></td>
          	<td id="td6"><s:property value="loginUser.license"/></td>
          	<td id="td7"><s:property value="loginUser.password"/></td>
          	<td id="td8"><s:property value="loginUser.telephone"/></td>
          	<td id="td9"><s:property value="loginUser.score"/></td>
          </tr>
          </tbody>
          <thead>
          <tr>
            <th>车辆ID</th>
            <th>座位数</th>
            <th>颜色</th>
            <th>车牌号</th>
            <th>车型</th>
           </tr>
           </thead>
           <tbody>
          <tr>
          	<td id="td10"><s:property value="loginUser.car.carID"/></td>
          	<td id="td11"><s:property value="loginUser.car.seats"/></td>
          	<td id="td12"><s:property value="loginUser.car.color"/></td>
          	<td id="td13"><s:property value="loginUser.car.plate"/></td>
          	<td id="td14"><s:property value="loginUser.car.type"/></td>
          </tr>
          </tbody>
          
          </table>
          <button id="btn" class="layui-btn layui-btn-sm" data-toggle="modal" data-target="#driverModal">修改信息</button>
    </div>
    <div style="text-align:center;">
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="driverModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
					<s:form method="post" action="driverinfochange">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">请确认是否修改信息</h4>
						</div>
						<div class="modal-body">
								<div class="form-group">
									<label>司机编号</label>
									<input type="text" class="form-control" name="loginUser.orderID" readonly="readonly" id="i1"/>
								</div>
								<div class="form-group">
									<label>姓名</label>
									<input type="text" class="form-control" name="loginUser.name" id="i2"/>
								</div>
								<div class="form-group">
									<label>性别（false代表女，true代表男）</label>
									<input type="text" class="form-control" name="loginUser.gender"id="i3"/>
								</div>
								<div class="form-group">
									<label>年龄</label>
									<input type="text" class="form-control" name="loginUser.age" id="i4"/>
								</div>
								<div class="form-group">
									<label>身份证号</label>
									<input type="text" class="form-control" name ="loginUser.idnum" id="i5"/>
								</div>
								<div class="form-group">
									<label>驾驶证号</label>
									<input type="text" class="form-control" name ="loginUser.license" id="i6"/>
								</div>
								<div class="form-group">
									<label>密码</label>
									<input type="text" class="form-control" name ="loginUser.password" id="i7"/>
								</div>
								<div class="form-group">
									<label>联系电话</label>
									<input type="text" class="form-control" name ="loginUser.telephone" id="i8"/>
								</div>
								<div class="form-group">
									<label>综合评分</label>
									<input type="text" class="form-control" name ="loginUser.idnum" readonly="readonly" id="i9"/>
								</div>
								<div class="form-group">
									<label>车辆ID</label>
									<input type="text" class="form-control" name ="loginUser.car.carID" readonly="readonly" id="i10"/>
								</div>
								<div class="form-group">
									<label>座位数</label>
									<input type="text" class="form-control" name ="loginUser.car.seats" id="i11"/>
								</div>
								<div class="form-group">
									<label>颜色</label>
									<input type="text" class="form-control" name ="loginUser.car.color" id="i12"/>
								</div>
								<div class="form-group">
									<label>车牌号</label>
									<input type="text" class="form-control" name ="loginUser.car.plate" id="i13"/>
								</div>
								<div class="form-group">
									<label>车型</label>
									<input type="text" class="form-control" name ="loginUser.car.type" id="i14"/>
								</div>
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
			</div>

</body>
</html>