<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/9/2018
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<script type="text/javascript">
    $(function(){
        $(".after-service-request-type-select").click(function(){
            $(".after-service-request-type-selected").removeClass("after-service-request-type-selected");
            $(this).addClass("after-service-request-type-selected");
        });

        $(".after-service-request-num-add").click(function(){
            var numValue = parseInt($(".after-service-request-num-input").val());

            if(numValue < ${orderItem.num})
                $(".after-service-request-num-input").val(numValue+1);
        });

        $(".after-service-request-num-minus").click(function(){
            var numValue = parseInt($(".after-service-request-num-input").val());

            if(numValue > 1)
                $(".after-service-request-num-input").val(numValue-1);
        });

        $(".after-service-request-num-input").change(function(){
            var minNum = 1;
            var maxNum = ${orderItem.num};

            if($(this).val() > maxNum)
            {
                $(this).val(maxNum);
                return;
            }
            if($(this).val() < minNum)
            {
                $(this).val(minNum);
                return;
            }
        });

        $(".after-service-request-submit").click(function(){
            var reason = $(".after-service-request-reason-div textarea").val();
            var maxReasonLength = 500;
            if(!reason)
            {
                $(".after-service-request-reason-div textarea").focus();
                alert("请输入问题描述");
                return false;
            }
            if(reason.length > maxReasonLength)
            {
                $(".after-service-request-reason-div textarea").focus();
                alert("问题描述字数不能超过500字");
                return false;
            }

            var pictureInput = $(".after-service-request-picture-choise input");
            if(!pictureInput.val())
            {
                pictureInput.focus();
                alert("请选择图片");
                return false;
            }
            var picture = pictureInput[0].files[0];
            var pictureType = picture.type;
            var typePatt = /^image\//;
            if(!typePatt.test(pictureType))
            {
                pictureInput.focus();
                alert("图片格式不正确");
                return false;
            }
            if(picture.size > 2*1024*1024)
            {
                pictureInput.focus();
                alert("图片大小不能超过2M");
                return false;
            }

            var type = $(".after-service-request-type-selected").html();
            $(".after-service-request-type-hidden-input").val(type);
        })
    });
</script>


<div class="after-service-request-div">
    <div class="after-service-request-title">申请售后</div>

    <div class="after-service-request-order-item-info">
        <table class="after-service-request-order-item-info-table">
            <tr class="after-service-request-order-item-info-title">
                <td width="50%">书名</td>
                <td width="25%">购买数量</td>
                <td width="25%">金额</td>
            </tr>
            <tr class="after-service-request-order-item-info-body">
                <td>${orderItem.book.bookName}</td>
                <td>${orderItem.num}</td>
                <td><fmt:formatNumber type="number" value="${orderItem.num*orderItem.book.price}" minFractionDigits="2" maxFractionDigits="2"/></td>
            </tr>
        </table>
    </div>

    <form class="after-service-request-form" action="afterServiceRequest" method="post" enctype="multipart/form-data">
        <div class="after-service-request-type-div" style="overflow: hidden">
            <div class="after-service-request-type-text">
                <span class="after-service-request-text-star">*</span>
                <span class="item-title-text">服务类型：</span>
            </div>
            <div class="after-service-request-type-select after-service-request-type-selected">退款退货</div>
            <div class="after-service-request-type-select">换货</div>
        </div>
        <input type="hidden" class="after-service-request-type-hidden-input" name="type"/>

        <input type="hidden" name="orderItemId" value="${orderItem.id}"/>

        <div class="after-service-request-num-div">
            <div class="after-service-request-num-text">
                <span class="after-service-request-text-star">*</span>
                <span class="item-title-text">申请数量：</span>
            </div>
            <div class="after-service-request-num-ops">
                <span class="after-service-request-num-add">+</span>
                <input type="text" value="1" class="after-service-request-num-input" name="num"/>
                <span class="after-service-request-num-minus">-</span>
            </div>
            <span class="small-description-text">您最多可以申请的数量为 ${orderItem.num} 个</span>
        </div>

        <div class="after-service-request-reason-div">
            <div class="after-service-request-reason-text">
                <span class="after-service-request-text-star">*</span>
                <span class="item-title-text">问题描述：</span>
            </div>
            <textarea cols="50" rows="5" name="reason"></textarea>
        </div>

        <div class="after-service-request-picture-div">
            <div class="after-service-request-picture-text">
                <span class="after-service-request-text-star">*</span>
                <span class="item-title-text">图片信息：</span>
            </div>
            <div class="after-service-request-picture-choise">
                <input type="file" accept="image/*" name="picture">
                <div class="small-description-text">为了帮助你更好的解决问题，请上传图片</div>
            </div>
        </div>

        <button type="submit" class="btn btn-default after-service-request-submit">申请</button>
    </form>
</div>