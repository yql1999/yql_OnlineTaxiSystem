<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<title>司机注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div class="w3layouts-main">
        <h1>填写注册表单</h1>
        <div class="agilesign-form">
            <div class="agileits-top">
                <s:form action="driverregister" method="post">
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.name required="" />
                        <label>姓名</label>
                        <span></span>
                    </div>                
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.gender required="">
                        <label>性别</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.age required="">
                        <label>年龄</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.idnumber required="">
                        <label>身份证号码</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.license required="" />
                        <label>驾照</label>
                        <span></span>
                    </div>
                     <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.experience required="" />
                        <label>驾龄</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.account required="">
                        <label>账号</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="password" name=loginUser.password required="">
                        <label>密码</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.telephone required="" />
                        <label>电话</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.car.seats required="" />
                        <label>车辆总座位数</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.car.color required="" />
                        <label>颜色</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.car.plate required="" />
                        <label>车牌</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name=loginUser.car.type required="" />
                        <label>类别</label>
                        <span></span>
                    </div>
                    <div class="wthree-text">
                        <p>
                            <input type="checkbox" id="brand" value="">
                            <label for="brand"><span></span>同意用户协议</label>
                        </p>
                    </div>
                    <div class="agileits-bottom">
                        <input type="submit" value="注册" id="btn"/>
                    </div>
                </s:form>
            </div>
            <div class="w3agile-btm">
                <p> <a href="Login.jsp">已经有账号 ? 登录</a> </p>
            </div>
        </div>
    </div>
    <!-- //main -->
    <!-- copyright -->
    <div class="copyright">
        <p><a href="http://www.bootstrapmb.com/"></a></p>
    </div>
</body>
</html>