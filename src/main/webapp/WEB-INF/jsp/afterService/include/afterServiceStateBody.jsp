<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/10/2018
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div class="after-service-state-div">
    <div class="after-service-state-title">状态查看</div>

    <div class="after-service-state-info">
        <div class="after-service-state-text">
            <span class="after-service-state-text-title">书名：</span>
            <span class="after-service-state-text-content">${afterService.orderItem.book.bookName}</span>
        </div>
        <div class="after-service-state-text">
            <span class="after-service-state-text-title">申请数量：</span>
            <span class="after-service-state-text-content">${afterService.num}</span>
        </div>
        <div class="after-service-state-text">
            <span class="after-service-state-text-title">售后类型：</span>
            <span class="after-service-state-text-content">${afterService.type}</span>
        </div>
        <div class="after-service-state-text">
            <span class="after-service-state-text-title">申请理由：</span>
            <pre class="after-service-state-reason-content">${afterService.reason}</pre>
        </div>
        <div class="after-service-state-text">
            <span class="after-service-state-text-title">状态：</span>
            <span class="after-service-state-text-content">${afterService.state}</span>
        </div>
    </div>

    <div class="after-service-state-ops">
        <button class="btn btn-default after-service-state-cancel-but" data-toggle="modal" data-target="#alertCancelModal">取消申请</button>
        <c:if test="${afterService.state eq '失败'}">
            <a class="btn btn-default after-service-state-change-but" href="afterServiceChangePage?afterServiceId=${afterService.id}">修改申请</a>
        </c:if>
    </div>

    <div class="modal fade" id="alertCancelModal" tabindex="-1" role="alert" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        警告
                    </h4>
                </div>
                <div class="modal-body">
                    是否要取消当前售后服务，注意：取消之后无法再次发起售后服务
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <a type="button" class="btn btn-primary" href="afterServiceCancel?afterServiceId=${afterService.id}">
                        确定
                    </a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
