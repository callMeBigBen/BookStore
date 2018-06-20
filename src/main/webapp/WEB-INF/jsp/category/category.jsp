<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 29256
  Date: 2018/6/14
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@include file="../shared/top.jsp" %>

<div class="categoryProducts">
    <c:forEach items="${bookList}" var="book" varStatus="stc">
        <div class="productUnit" price="${book.price}">
            <div class="productUnitFrame">
                <a href="/details/${book.id}">
                    <img class="productImage" src="img/books/${book.category}-${book.id}.jpg">
                </a>

            </div>
        </div>
    </c:forEach>
    <div style="clear:both"></div>
</div>


</body>
</html>
