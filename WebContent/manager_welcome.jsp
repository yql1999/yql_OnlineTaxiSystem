<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<blockquote class="layui-elem-quote">
			尊贵的管理员，欢迎您<span class="x-red">！</span>当前时间：<%= new java.util.Date()%>
		</blockquote>

		<fieldset class="layui-elem-field">
			<legend>个人信息</legend>
			<div class="x-body">
        <form class="layui-form" action="apssenger_update.do" method="post">
          <div class="layui-form-item">
              <label for="userid" class="layui-form-label">用户ID</label>
              <div class="layui-input-inline">
                  <label for="userid" class="layui-form-label">1</label>
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label">角色</label>
              <div class="layui-input-inline">
                  <label for="userid" class="layui-form-label">管理员</label>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="useraccount" class="layui-form-label">账号</label>
              <div class="layui-input-inline">
                  <label for="userid" class="layui-form-label">GYT</label>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="userpassword" class="layui-form-label">密码</label>
              <div class="layui-input-inline">
                  <label for="userid" class="layui-form-label">GYT</label>
              </div>
          </div>
      </form>
    </div>
		</fieldset>
		
	</div>
</body>
</html>