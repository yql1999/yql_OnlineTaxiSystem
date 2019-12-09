<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<html lang="en">
<head>
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>shiro</title>
    
        <script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
    
    
    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
        <script src="https://cdn.bootcss.com/jquery/3.4.1/core.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
    <title>Title</title>
</head>
<body>
      <div class="container">
    
    
        <button class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal">
            开始演示模态框
        </button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                     确认接收订单
                        </h4>
                    </div>
                    <div class="modal-body">
                        <h5><b>订单信息</b></h5>
                        <s:text name="订单编号"/>
                        <s:text name="#dingdan.id"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-warning">
                            确定接收
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    
    
    </div>

</body>


</html>