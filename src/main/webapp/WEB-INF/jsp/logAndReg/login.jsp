<%--
  Created by IntelliJ IDEA.
  User: huhaomeng
  Date: 2018/6/14
  Time: 上午9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆BookStore</title>

    <link rel="stylesheet" href="./css/loginCss.css">

</head>
<body>
<div id="particles-js">

    <!-- particles.js lib (JavaScript CodePen settings): https://github.com/VincentGarreau/particles.js -->
    <script src="./js/login.js"></script>

    <div class="login" id="loginDiv" style="visibility: visible">
        <h1>BookStore</h1>
        <form action="loginChecker" method="post">
            <input type="text" name="username" placeholder="用户名" required="required"/>
            <input type="password" name="password" placeholder="密码" required="required"/>
            <br>
            <button type="submit" class="btn btn-primary btn-block btn-large" name="user">登录</button>

        </form>
        <form action="reg" method="post">
            <button type="submit" class="btn btn-primary btn-block btn-large" name="toRegister">
                注册
            </button>
        </form>
    </div>
</div>
</body>
</html>
