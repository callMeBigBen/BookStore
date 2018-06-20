<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/12
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>


<title>订单管理</title>

<div class="workingArea" style="padding-top:70px">

    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>订单ID</th>
                <th>地址</th>
                <th>总价格</th>
                <th >订单状态</th>
                <th width="80px">用户ID</th>
                <th width="80px">修改</th>
                <th width="80px">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.address}</td>
                    <td>${p.totalPrice}</td>
                    <td>${p.state}</td>
                    <td>${p.userId}</td>
                    <td><a href="editOrderRequest?id=${p.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true"
                           href="deleteOrderRequest?id=${p.id}" onClick="show_confirm()"><span
                            class="     glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>