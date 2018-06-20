<%--
  Created by IntelliJ IDEA.
  User: zhong
  Date: 2018/6/11
  Time: 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${book.bookName}</title>
    <link href="<%=request.getContextPath() %>/css/templatemo_style.css?v=1.0" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ddsmoothmenu.css" />

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ddsmoothmenu.js?v=1.0">
    </script>

    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })

    </script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slimbox2.css" type="text/css" media="screen" />
    <script type="text/JavaScript" src="${pageContext.request.contextPath}/js/slimbox2.js"></script>


</head>

<body>
<%@include file="../shared/top.jsp" %>

<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">
        <div id="templatemo_main">
            <div id="content" class="float_r">
                <h1 id="${book.id}">${book.bookName}</h1>
                <div class="content_half float_l">
                    <a  rel="lightbox[portfolio]" href="images/product/10_l.jpg"><img src="images/product/10.jpg" alt="image" /></a>
                </div>
                <div class="content_half float_r">
                    <table>
                        <tr>
                            <td width="160">价格:</td>
                            <td>${book.price}</td>
                        </tr>
                        <tr>
                            <td>分类:</td>
                            <td>${book.categoryId}</td>
                        </tr>
                        <tr>
                            <td>Model:</td>
                            <td>Product 14</td>
                        </tr>
                        <tr>
                            <td>Manufacturer:</td>
                            <td>Apple</td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="text" value="1" style="width: 20px; text-align: right" id="num"/></td>
                        </tr>
                    </table>
                    <div class="cleaner h20"></div>

                    <a id="add2Cart" onclick="addCart()" class="addtocart"></a>

                </div>
                <div class="cleaner h30"></div>

                <h5>描述</h5>
                <p>${book.description}</p>

                <div class="cleaner h50"></div>

                <h3>相关商品</h3>
                <div class="product_box">
                    <a href="productdetail.html"><img src="images/product/01.jpg" alt="" /></a>
                    <h3>Ut eu feugiat</h3>
                    <p class="product_price">$ 100</p>
                    <a href="shoppingcart.html" class="addtocart"></a>
                    <a href="productdetail.html" class="detail"></a>
                </div>
                <div class="product_box">
                    <a href="productdetail.html"><img src="images/product/02.jpg" alt="" /></a>
                    <h3>Curabitur et turpis</h3>
                    <p class="product_price">$ 200</p>
                    <a href="shoppingcart.html" class="addtocart"></a>
                    <a href="productdetail.html" class="detail"></a>
                </div>
                <div class="product_box no_margin_right">
                    <a href="productdetail.html"><img src="images/product/03.jpg" alt="" /></a>
                    <h3>Mauris consectetur</h3>
                    <p class="product_price">$ 120</p>
                    <a href="shoppingcart.html" class="addtocart"></a>
                    <a href="productdetail.html" class="detail"></a>
                </div>
            </div>
            <div class="cleaner"></div>
        </div> <!-- END of templatemo_main -->
        <div id="templatemo_footer">
            <p><a href="#">Home</a> | <a href="#">Products</a> | <a href="#">About</a> | <a href="#">FAQs</a> | <a href="#">Checkout</a> | <a href="#">Contact Us</a>
            </p>

            Copyright © 2072 <a href="#">Your Company Name</a> <!-- Credit: www.templatemo.com -->

        </div> <!-- END of templatemo_footer -->
    </div> <!-- END of templatemo_wrapper -->
</div> <!-- END of templatemo_body_wrapper -->

</body>
</html>
