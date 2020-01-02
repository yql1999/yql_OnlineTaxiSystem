<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>乘客注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->

</head>
<body>
    <!-- main -->
    <div class="w3layouts-main">
        <h1>填写注册表单</h1>
        <div class="agilesign-form">
            <div class="agileits-top">
                <form action="register">
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.name" required="" />
                        <label>姓名</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.nickname" required="" />
                        <label>昵称/用户名</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.gender" required="">
                        <label>性别</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.age" required="">
                        <label>年龄</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.idnumber" required="">
                        <label>身份证号码</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="text" name="loginUser.account" required="">
                        <label>账号</label>
                        <span></span>
                    </div>
                    <div class="styled-input w3ls-text">
                        <input type="password" name="loginUser.password" required="">
                        <label>密码</label>
                        <span></span>
                    </div>
                       <div class="styled-input w3ls-text">
                        <input type="password" name="loginUser.telephone" required="">
                        <label>电话号码</label>
                        <span></span>
                    </div>
                    <div class="wthree-text">
                        <p>
                            <input type="checkbox" id="brand" value="">
                            <label for="brand"><span></span>同意用户协议</label>
                        </p>
                    </div>
                    <div class="agileits-bottom">
                        <input type="submit" value="注册">
                    </div>
                </form>
            </div>
            <div class="w3agile-btm">
                <p>已经有账号 ? <a href="Login.jsp"> 登录</a> </p>
            </div>
        </div>
    </div>
    <!-- //main -->
    <!-- copyright -->
    <div class="copyright">
        <p><a href="http://www.bootstrapmb.com/"></a></p>
    </div>
    <!-- //copyright -->
</body>
<script>
</script>
</html>
