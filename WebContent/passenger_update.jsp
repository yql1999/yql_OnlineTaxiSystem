<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" action="apssenger_update.do" method="post">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="nickname" class="layui-form-label">
                  <span class="x-red">*</span>昵称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="nickname" name="nickname" required="" lay-verify="nickname"
                  autocomplete="off" class="layui-input">
              </div><!-- 
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>
              </div> -->
          </div>
          <!-- <div class="layui-form-item">
              <label class="layui-form-label"><span class="x-red">*</span>角色</label>
              <div class="layui-input-block">
                <input type="checkbox" name="like1[write]" lay-skin="primary" title="普通用户" checked="">
                <input type="checkbox" name="like1[read]" lay-skin="primary" title="开通VIP">
                <input type="checkbox" name="like1[write]" lay-skin="primary" title="开通SVIP" >
              </div>
          </div> -->
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  密码长度为6~20位
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="submit" class="layui-btn" lay-filter="add" lay-submit="">
                  	提交 
              </button>
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