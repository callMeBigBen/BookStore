<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/12
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<title>用户管理</title>

<div class="workingArea" style="padding-top:70px">

    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>id</th>
                <th>用户名</th>
                <th>电话</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.userName}</td>
                    <td>${p.phone}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>