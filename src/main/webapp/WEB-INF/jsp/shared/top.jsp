<%--
  Created by IntelliJ IDEA.
  User: 29256
  Date: 2018/6/14
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<link href="/bookStore/css/homePage.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>


<nav class="top ">

    <span>欢迎来到Bookstore</span>


    <c:if test="true">
        <a href="/bookStore/log">请登录</a>
        <a href="/bookStore/req">免费注册</a>
    </c:if>


    <span class="pull-right">
			<a href="#nowhere">我的订单</a>
			<a href="#nowhere">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>0</strong>件</a>
		</span>

</nav>


<form action="foresearch" method="post">

    <div class="searchDiv">
        <input name="keyword" type="text" value="" placeholder="C++ Primer">
        <button type="submit" class="searchButton">搜索</button>
        <div class="searchBelow">
            <span><a href="#nowhere">科幻小说</a> <span>|</span></span>
            <span><a href="#nowhere">散文随笔</a> <span>|</span></span>
            <span><a href="#nowhere">推理悬疑</a> </span>
        </div>
    </div>
</form>