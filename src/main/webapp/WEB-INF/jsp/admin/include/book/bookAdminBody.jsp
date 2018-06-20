<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/10
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" isELIgnored="false" %>

<script type="text/javascript">

</script>

<title>书籍管理</title>

<div class="workingArea" style="padding-top:70px">

    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>书籍名称</th>
                <th>描述</th>
                <th>价格</th>
                <th width="150px">库存数量</th>
                <th width="80px">编辑</th>
                <th width="80px">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>
                        <img width="40px" src="../img/books/${p.id}.jpg">
                    </td>
                    <td>${p.bookName}</td>
                    <td>${p.description}</td>
                    <td>${p.price}</td>
                    <td>${p.remainNum}</td>
                    <td><a href="editBookRequest?id=${p.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true"
                           href="deleteBookRequest?id=${p.id}" onClick="show_confirm()"><span
                            class="     glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
