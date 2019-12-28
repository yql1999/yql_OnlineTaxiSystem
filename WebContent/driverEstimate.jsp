<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>-->
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <style type="text/css">
        .box {
            color: #999;
        }
        .box .sel {
            color: #F00;
        }
        .icon{
            width:70px;
            height:70px;
        }
        .es{
            width:200px;
            margin:0px auto;
        }
        .fade{
        !important:visibility:visible;
            display:inline;
        }
    </style>
    <%!int idNum=0; 
	int i = 0;%>
    <script type="text/javascript" language="JavaScript">
    $(document).ready(function(){
		<%for(i=0;i<100;i++){%>
			console.log(<%=i%>);
		//console.log("11111");
			$("#btn<%=i%>").click(function(){
				console.log("kaishi "+<%=i%>+"anniu ");
				document.getElementById("i1").value=$(<%="td1"+i%>).html();
				document.getElementById("i2").value=$(<%="td2"+i%>).html();
				var esform = document.getElementById('esform');
				esform.submit();
				return false;
			});
		<%}%>
	});
    </script>
    <!--[endif]-->
</head>
<body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">行程</a>
        <a>
          <cite>司机评价</cite></a>
      </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
    	<xblock>
        	<button class="layui-btn" onclick="javascript:window.location.href='order-list.jsp'">下次再评</button>
      	</xblock>
        <table class="layui-table">
            <thead>
              <tr>
                  <th>司机ID</th>
                  <th>乘客ID</th>
                  <th>行程时长</th>
                  <th>行程距离</th>
                  <th>起点</th>
                  <th>终点</th>
                  <th>是否中途更换路线</th>
                  <th>评价</th>
                  <th>反馈内容</th>
                  <th></th>
              </tr>
            </thead>
            <tbody>
            <s:iterator value="orders" var="object">
			   <s:if test="#object.isEstimatedD!=1">
              <tr>
                  <td><s:property value="order.driver.driverID" /></td>
                  <td><s:property value="order.passenger.passengerID" /></td>
                  <td>18:11</td>
                  <td>6.4km</td>
                  <td><s:property value="order.start"/></td>
                  <td><s:property value="order.destination"/></td>
                  <td>否</td>
                  <td id="<%="td2"+idNum%>"><span class="box">
                      <span>★</span>
                      <span>★</span>
                      <span>★</span>
                      <span>★</span>
                      <span>★</span>
                  </span>
                  <span>0</span>分</td>
                  <td><input type="text"/></td>
                  <td><button id="<%="btn"+idNum%>" class="layui-btn layui-btn-sm" >提交评价</button></td>
                  <td id="<%="td1"+idNum%>" style="visibility: hidden; display: none;"><s:property value="#object.orderID"/></td>
              </tr>
              <% idNum++; %>
              </s:if>
              </s:iterator>
            </tbody>
        </table>
        <s:form action="driverEstimate" method="post" id="esform" style="visibility: hidden; display: none;">
        <input id="i1" name="order.orderID"/>
        <input id="i2" name="estimatedtop"/>
        <input type="submit" value="tijiao"/>
        </s:form>
    </div>
    <script type="text/javascript">
        $(function(){
            $(".box span").click(function(event){
                $(this).parent().find("span").addClass("sel");
                $(this).nextAll().removeClass("sel");
                $(this).parent().next().text($(this).index()+1);
            });
        });
    </script>
</body>
</html>