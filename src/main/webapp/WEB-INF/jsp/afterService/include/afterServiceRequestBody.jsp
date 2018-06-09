<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/9/2018
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div class="after-service-request-div">
    <h3 class="after-service-request-title">申请售后</h3>

    <div class="after-service-request-order-item-info">
        <table class="after-service-request-order-item-info-table">
            <tr class="after-service-request-order-item-info-title">
                <td>书名</td>
                <td>购买数量</td>
                <td>金额</td>
            </tr>
            <tr class="after-service-request-order-item-info-body">
                <td>${orderItem.book.bookName}</td>
                <td>${orderItem.num}</td>
                <td><fmt:formatNumber type="number" value="${orderItem.num*orderItem.book.price}" minFractionDigits="2" maxFractionDigits="2"></td>
            </tr>
        </table>
    </div>

</div>



