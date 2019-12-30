<%@page import="cn.edu.zjut.po.Driver"%>
<%@page import="com.sun.xml.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>司机信息</title>
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
</head>
<script type="text/javascript">
      /*  function f(){
            window.location.href = "driverInformation";
        }*/ 
window.onload=function(){
	$.ajax( {url : 'driverInformation',// 跳转到 action
	data : {
	},
	type : 'post',
	cache : false,
	dataType : 'json',
	success : function(data) {
	},
	error : function() {
	}
	})5000;
	}
</script>
<body onLoad=f() >
	<div class="x-body">

		<form class="layui-form" action="passenger_select.action"
			method="post" validate="true">
			<%Driver driver=(Driver)request.getSession().getAttribute("driver");%>
			<%-- <s:set name="driver" value="#session['driver']"/> --%>

			<div class="layui-form-item">
				<label for="account" class="layui-form-label"> 司机姓名</label>
				<div class="layui-input-inline">
					<input type="text" id="name" name="name" id="name" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getName() %>">
						</div>
			</div>
			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> 联系电话 </label>
				<div class="layui-input-inline">
					<input type="text" id="phone" name="phone" id="phone" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getTelephone() %>">
						</div>
			</div>
			<div class="layui-form-item">
				<label for="age" class="layui-form-label"> 司机年龄 </label>
				<div class="layui-input-inline">
					<input type="text" id="age" name="age" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getAge() %>">
					</div>
			</div>
			<div class="layui-form-item">
				<label for="experience" class="layui-form-label"> 司机驾龄 </label>
				<div class="layui-input-inline">
					<input type="text" id="experience" name="experience" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getExperience() %>">
					</div>
			</div>
			<div class="layui-form-item">
				<label for="plate" class="layui-form-label"> 车牌 </label>
				<div class="layui-input-inline">
					<input type="text" id="plate" name="plate" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getCar().getPlate() %>">
					</div>
			</div>
			<div class="layui-form-item">
				<label for="color" class="layui-form-label"> 车辆颜色 </label>
				<div class="layui-input-inline">
					<input type="text" id="color" name="color" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getCar().getColor() %>">
					</div>
			</div>
			<div class="layui-form-item">
				<label for="type" class="layui-form-label"> 车辆类型 </label>
				<div class="layui-input-inline">
					<input type="text" id="type" name="type" disabled="disabled"
						autocomplete="off" class="layui-input"
						value="<%=driver.getCar().getType() %>">
					</div>
			</div>
		</form>
	</div>
	<script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //èªå®ä¹éªè¯è§å
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return 'æµç§°è³å°å¾5ä¸ªå­ç¬¦å';
              }
            }
            ,pass: [/(.+){6,12}$/, 'å¯ç å¿é¡»6å°12ä½']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return 'ä¸¤æ¬¡å¯ç ä¸ä¸è´';
                }
            }
          });

          //çå¬æäº¤
          form.on('submit(add)', function(data){
            console.log(data);
            //åå¼æ­¥ï¼ææ°æ®æäº¤ç»php
            layer.alert("å¢å æå", {icon: 6},function () {
                // è·å¾frameç´¢å¼
                var index = parent.layer.getFrameIndex(window.name);
                //å³é­å½åframe
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
    </script>
	<script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
</body>

</html>