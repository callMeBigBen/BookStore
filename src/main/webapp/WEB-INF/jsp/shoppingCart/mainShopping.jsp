<%--
  Created by IntelliJ IDEA.
  User: ezreal
  Date: 2018/6/13
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookStore.dao.OrderItemDao" %>
<%@ page import="bookStore.domain.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
html>
<head>
    <title>岛上书店购物车页面</title>
    <link href="../../../bootstrap-3.3.7-dist/css/myCart.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../../bootstrap-3.3.7-dist/js/myCart.js"></script>
</head>

<body>
<div id="header"><img src="img/shoppingCart/header.png" alt="logo" height="80" width="250"/></div>
<br><br>
<div id="nav">您的位置：<a href="/WEB-INF/jsp/homePage/homePage.jsp">首页</a> >  我的购物车</div>

<div id="navlist">
    <ul>
        <li class="navlist_red_left"></li>
        <li class="navlist_red">1. 查看购物车  >>>&nbsp;&nbsp;</li>
        <li class="navlist_red_arrow"></li>
        <li class="navlist_gray">2. 确认订单信息   >>>&nbsp;&nbsp;</li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray">3. 付款    >>>&nbsp;&nbsp;</li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray">4. 确认收货   >>>&nbsp;&nbsp;</li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray">5. 评价</li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>

<div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
        <tr>
            <td class="title_1"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
            <td class="title_2" colspan="2">宝贝</td>
            <td class="title_3">类别</td>
            <td class="title_4">单价（元）</td>
            <td class="title_5">数量</td>
            <td class="title_6">小计（元）</td>
            <td class="title_7">操作</td>
        </tr>

        <%
            OrderItemDao orderItemDao = new OrderItemDao();
            ArrayList<OrderItem> orderItems = (ArrayList) orderItemDao.list();
            for(int i = 0; i < orderItems.size(); i++){
                if(orderItems.get(i)!=null){
                    if (orderItems.get(i).getOrderId()  > 0){
                    String index = "product" + i;
                    String bookName  = orderItems.get(i).getBook().getBookName();
                    String description  = orderItems.get(i).getBook().getDescription();
                    double price  = orderItems.get(i).getBook().getPrice();
                    int categoryId = orderItems.get(i).getBook().getCategoryId();
                    String src  = orderItems.get(i).getBookId() + "";
        %>
        <tr id="<%=index%>">
            <td class="cart_td_1"><input name="cartCheckBox" type="checkbox" value="<%=index%>" onclick="selectSingle()" /></td>
            <td class="cart_td_2"><img src="<%=src%>" alt="shopping"/></td>
            <td class="cart_td_3"><a href="#"><%=bookName%></a><br />
                <%=description%><br />
            </td>
            <td class="cart_td_4"><%=categoryId%></td>
            <td class="cart_td_5"><%=price%></td>
            <td class="cart_td_6"><img src="img/shoppingCart/minus.jpg" alt="minus" onclick="changeNum('num<%=i%>','minus','<%=orderItems.get(i).getId()%>')" class="hand"/>
                <input id="num<%=i%>" type="text"  value='<%=orderItems.get(i).getNum()%>' class="num_input" readonly="readonly"/> <img src="img/shoppingCart/adding.jpg" alt="add" onclick="changeNum('num<%=i%>','add','<%=orderItems.get(i).getId()%>')"  class="hand"/></td>
            <td class="cart_td_7"></td>
            <td class="cart_td_8">
                <a href="javascript:deleteRow('<%=index%>','<%=orderItems.get(i).getId()%>');">删除</a>
            </td>
        </tr>
        <%
                    }
                }
            }
        %>
        <tr>
            <td  colspan="3"><a href="javascript:deleteSelectRow()"><img src="../../../img/shoppingCart/del.jpg" alt="delete"/></a></td>
            <td colspan="5" class="shopend">商品总价（不含运费）：<label id="total" class="yellow"></label> 元<br />
                可获积分 <label class="yellow" id="integral"></label> 点<br />
                <input name=" " type="image" src="../../../img/shoppingCart/subtn.jpg" /></td>
        </tr>
    </table>
</div>

</body>
</html>
