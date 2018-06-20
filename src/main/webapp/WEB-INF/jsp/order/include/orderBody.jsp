<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/20/2018
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function(){
        $("a[orderState]").click(function(){
            var orderState = $(this).attr("orderState");
            if('所有订单'==orderState){
                $("table[orderState]").show();
            }
            else{
                $("table[orderState]").hide();
                $("table[orderState="+orderState+"]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function(){
            deleteOrderid = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function(){
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if(deleteOrder){
                var page="foredeleteOrder";
                $.post(
                    page,
                    {"oid":deleteOrderid},
                    function(result){
                        if("success"==result){
                            $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                        }
                        else{
                            location.href="loginPage";
                        }
                    }
                );

            }
        })

        $(".ask2delivery").click(function(){
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function(result){
                    alert("卖家已秒发，刷新当前页面，即可进行确认收货")
                }
            });

        });
    });

</script>

<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderState="所有订单" href="#nowhere">所有订单</a></div>
        <div><a orderState="待付款" href="#nowhere">待付款</a></div>
        <div><a orderState="待发货" href="#nowhere">待发货</a></div>
        <div><a orderState="待收货" href="#nowhere">待收货</a></div>
        <div><a orderState="完成" href="#nowhere">完成</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder">&nbsp;</a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
                <td>书籍</td>
                <td width="120px">单价</td>
                <td width="120px">售后服务</td>
                <td width="120px">数量</td>
                <td width="120px">实付款</td>
                <td width="120px">交易操作</td>
            </tr>
        </table>
    </div>

    <div class="orderListItem">
        <c:forEach items="${orders}" var="o">
            <table class="orderListItemTable" orderState="${o.state}" oid="${o.id}">
                <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemProductInfoPartTR" >
                        <td class="orderItemProductInfoPartTD" width="120px"><img width="80" height="80" src="../img/books/${oi.book.id}.jpg"></td>
                        <td class="orderItemProductInfoPartTD">
                            <div class="orderListItemProductLinkOutDiv">
                                <a href="">${oi.book.bookName}</a>
                            </div>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="120px">
                            <div class="orderListItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.book.price}" minFractionDigits="2"/></div>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="120px">
                            <c:choose>
                                <c:when  test="${oi.isAfterServiceOpened == 1}">
                                    <a href="../afterServiceRequestPage">申请售后服务</a>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${oi.isAfterServiceExisted}">
                                        <a href="../afterServiceStatePage?orderItemId=${oi.id}">查看售后状态</a>
                                    </c:if>
                                    <c:if test="${not oi.isAfterServiceExisted}">
                                        <span>订单未完成，不能申请售后</span>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <c:if test="${st.count==1}">

                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="120px">
                                <span class="orderListItemNumber">${o.totalNum}</span>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <div class="orderListItemProductRealPrice">￥<fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.totalPrice}"/></div>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="120px">
                                <c:if test="${o.state eq '待收货' }">
                                    <a href="">
                                        <button class="orderListItemConfirm">确认收货</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.state eq '待付款' }">
                                    <a href="">
                                        <button class="orderListItemConfirm">付款</button>
                                    </a>
                                </c:if>

                                <c:if test="${o.state eq '待发货' }">
                                    <span>待发货</span>
                                </c:if>

                                <c:if test="${o.state eq '完成' }">
                                    <span>完成</span>
                                </c:if>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>

            </table>
        </c:forEach>

    </div>

</div>
