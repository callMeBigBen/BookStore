<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/12
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<title>售后管理</title>

<div class="workingArea" style="padding-top:70px">

    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>所申订单项ID</th>
                <th>申请数量</th>
                <th>原因</th>
                <th>售后类型</th>
                <th>状态</th>
                <th width="80x">编辑</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${afterServices}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.orderItemId}</td>
                    <td>${p.num}</td>
                    <td>${p.reason}</td>
                    <td>${p.type}</td>
                    <td>${p.state}</td>
                    <td><a href="editAfterServiceRequest?id=${p.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>