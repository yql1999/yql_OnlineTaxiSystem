<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>我的订单</title>
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

<link rel="stylesheet"
	href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<script
	src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
	src="https://webapi.amap.com/maps?v=1.4.15&key=a008fd73a62e235f98ff8247f00db18c&plugin=AMap.Driving"></script>
<script type="text/javascript"
	src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>

<body>
	<%@ include file="passenger_head.jsp"%>
	<div class="page-content">
		<div class="x-body">
			<xblock>
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<span class="x-right" style="line-height: 40px">共有数据：88 条</span> </xblock>
			<table class="layui-table">
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
				<tbody>
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary" data-id='2'>
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td>01</td>
						<td>浙江工业大学屏风校区</td>
						<td>杭州东站</td>
						<td>2019-12-07 12:00:00</td>
						<td>2019-12-07 13:00:00</td>
						<td>2</td>
						<td>已完成</td>
						<td>92.00</td>
						<td class="td-manage">
							<!-- 
              <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a> --> <a title="删除" onclick="member_del(this,'要删除的id')"
							href="javascript:;"> <i class="layui-icon">&#xe640;</i>
						</a>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="page">
				<div>
					<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> <span
						class="current">2</span> <a class="num" href="">3</a> <a
						class="next" href="">&gt;&gt;</a>
				</div>
			</div>

		</div>
		<script>
			layui.use('laydate', function() {
				var laydate = layui.laydate;

				//执行一个laydate实例
				laydate.render({
					elem : '#start' //指定元素
				});

				//执行一个laydate实例
				laydate.render({
					elem : '#end' //指定元素
				});
			});

			/*用户-停用*/
			function member_stop(obj, id) {
				layer.confirm('确认要停用吗？', function(index) {

					if ($(obj).attr('title') == '启用') {

						//发异步把用户状态进行更改
						$(obj).attr('title', '停用')
						$(obj).find('i').html('&#xe62f;');

						$(obj).parents("tr").find(".td-status").find('span')
								.addClass('layui-btn-disabled').html('已停用');
						layer.msg('已停用!', {
							icon : 5,
							time : 1000
						});

					} else {
						$(obj).attr('title', '启用')
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

			/*用户-删除*/
			function member_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					//发异步删除数据
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				});
			}

			function delAll(argument) {

				var data = tableCheck.getData();

				layer.confirm('确认要删除吗？' + data, function(index) {
					//捉到所有被选中的，发异步进行删除
					layer.msg('删除成功', {
						icon : 1
					});
					$(".layui-form-checked").not('.header').parents('tr')
							.remove();
				});
			}
		</script>
		<script>
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
		</script>
	</div>
</body>

</html>