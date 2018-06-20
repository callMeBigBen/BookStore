<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/9/2018
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
    <script type="text/javascript" src="../jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/style.css"/>
</head>

<script>
    function checkState(id, name) {
        var value = $("#" + id).val();
        if (value != "待处理" || value != "成功" || value != "失败") {
        alert(name + "只能是：待处理、成功、失败");
        $("#" + id)[0].focus();
        return false;
        }
        return true;
    }
    
    function checkEmpty(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    function checkNumber(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(isNaN(value)){
            alert(name+ "必须是数字");
            $("#"+id)[0].focus();
            return false;
        }

        return true;
    }
    function checkInt(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(parseInt(value)!=value){
            alert(name+ "必须是整数");
            $("#"+id)[0].focus();
            return false;
        }

        return true;
    }

    function show_confirm()
    {
        var r=confirm("确定要删除吗？");
        if (r==true)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

</script>


<body>


