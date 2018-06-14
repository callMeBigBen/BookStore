<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/12
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" isELIgnored="false" %>

<title>编辑书籍</title>

<script>
    $(function() {
        $("#editForm").submit(function() {
            if (!checkEmpty("name", "书籍名称"))
                return false;
            if (!checkEmpty("description", "书籍描述"))
                return false;
            if (!checkNumber("price", "价格"))
                return false;
            if (!checkInt("remainNum", "库存"))
                return false;
            return true;
        });
    });
</script>

<div class="workingArea"  style="padding-top:70px">

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑书籍</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="editBookSubmit">
                <table class="editTable">
                    <tr>
                        <td>书籍名称</td>
                        <td><input id="name" name="name" value="${book.bookName}"
                                   type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>书籍描述</td>
                        <td><input id="description" name="description" value="${book.description}"
                                   type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td><input id="price" value="${book.price}" name="price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input id="remainNum"  value="${book.remainNum}" name="remainNum" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${book.id}">
                            <button type="submit" class="btn btn-success">提 交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>