<%--
  Created by IntelliJ IDEA.
  User: huhaomeng
  Date: 2018/6/20
  Time: 上午12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>状态</title>
</head>
<body>
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

    <div class="register" id="registerDiv" style="visibility: visible">
        <form action="/reg" method="post">
            <button type="submit" class="btn btn-primary btn-block btn-large" name="toRegister">
                注册失败
            </button>
        </form>
    </div>
</div>
</body>
</html>

</body>
</html>
