<%@ page import="bookStore.dao.OrderItemDao" %>
<%@ page import="bookStore.domain.OrderItem" %>
<%--
  Created by IntelliJ IDEA.
  User: ezreal
  Date: 2018/6/14
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adding</title>
</head>
<body>
<%
    String ID = request.getParameter("_ID");
    OrderItemDao orderItemDao = new OrderItemDao();
    OrderItem orderItem = orderItemDao.get(Integer.parseInt(ID));
    orderItem.setNum(orderItem.getNum() + 1);
    orderItemDao.update(orderItem);
%>
</body>
</html>
