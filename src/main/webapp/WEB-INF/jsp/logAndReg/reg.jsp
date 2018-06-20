<%--
  Created by IntelliJ IDEA.
  User: huhaomeng
  Date: 2018/6/15
  Time: 下午5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册账户</title>

    <link rel="stylesheet" href="./css/loginCss.css">
</head>
<body>
<!-- particles.js lib (JavaScript CodePen settings): https://github.com/VincentGarreau/particles.js -->
<div id="particles-js">
    <script src="./js/login.js"></script>


    <div class="register" id="registerDiv" style="visibility: visible">
        <h1>RegisterNow</h1>
        <form action="regToBookStore" method="post">
            <input type="text" name="username" placeholder="用户名" required="required"/>
            <input type="password" name="password" placeholder="密码" required="required"/>
            <input type="text" name="phone" placeholder="联系方式" required="required" maxlength="11"/>
            <br>
            <button type="submit" class="btn btn-primary btn-block btn-large" name="register">注册</button>
        </form>
        <form action="log" method="post">
            <button type="submit" class="btn btn-primary btn-block btn-large" name="toRegister" onclick="toLoginPage()">
                已有账号
            </button>
        </form>
    </div>
</div>
</body>
</html>
