<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/12
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<title>编辑售后</title>

<script>
    $(function() {
        $("#editForm").submit(function() {
            if (!checkState("state", "售后状态"))
                return false;
        });
    });
</script>

<div class="workingArea"  style="padding-top:70px">

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑售后</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="editBookSubmit">
                <table class="editTable">
                    <tr>
                        <td>售后状态</td>
                        <td><input id="state" name="state" value="${afterService.state}"
                                   type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${afterService.id}">
                            <button type="submit" class="btn btn-success">提 交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>