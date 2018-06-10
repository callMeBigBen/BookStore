<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/10/2018
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>

<script type="text/javascript">
    $(function(){
        var type = "${afterService.type}";
        if( type == $("#refund-type").html())
            $("#refund-type").addClass("after-service-change-type-selected");
        else
            $("#exchange-type").addClass("after-service-change-type-selected");

        $(".after-service-change-reason-div textarea").html("${afterService.reason}");

        $(".after-service-change-type-select").click(function(){
            $(".after-service-change-type-selected").removeClass("after-service-change-type-selected");
            $(this).addClass("after-service-change-type-selected");
        });

        $(".after-service-change-num-add").click(function(){
            var numValue = parseInt($(".after-service-change-num-input").val());

            if(numValue < ${afterService.orderItem.num})
                $(".after-service-change-num-input").val(numValue+1);
        });

        $(".after-service-change-num-minus").click(function(){
            var numValue = parseInt($(".after-service-change-num-input").val());

            if(numValue > 1)
                $(".after-service-change-num-input").val(numValue-1);
        });

        $(".after-service-change-num-input").change(function(){
            var minNum = 1;
            var maxNum = ${afterService.orderItem.num};

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

        $(".after-service-change-submit").click(function(){
            var reason = $(".after-service-change-reason-div textarea").val();
            var maxReasonLength = 500;
            if(!reason)
            {
                $(".after-service-change-reason-div textarea").focus();
                alert("请输入问题描述");
                return false;
            }
            if(reason.length > maxReasonLength)
            {
                $(".after-service-change-reason-div textarea").focus();
                alert("问题描述字数不能超过500字");
                return false;
            }

            var pictureInput = $(".after-service-change-picture-choise input");
            if(pictureInput.val())
            {
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
            }

            var type = $(".after-service-change-type-selected").html();
            $(".after-service-change-type-hidden-input").val(type);
        })
    });
</script>

<div class="after-service-change-div">
    <div class="after-service-change-title">修改售后申请</div>

    <form class="after-service-change-form" action="afterServiceChange" method="post" enctype="multipart/form-data">
        <div class="after-service-change-type-div" style="overflow: hidden">
            <div class="after-service-change-type-text">
                <span class="after-service-change-text-star">*</span>
                <span class="item-title-text">服务类型：</span>
            </div>
            <div class="after-service-change-type-select" id="refund-type">退款退货</div>
            <div class="after-service-change-type-select" id="exchange-type">换货</div>
        </div>

        <input type="hidden" name="id" value="${afterService.id}"/>
        <input type="hidden" class="after-service-change-type-hidden-input" name="type"/>
        <input type="hidden" name="orderItemId" value="${afterService.orderItemId}"/>

        <div class="after-service-change-num-div">
            <div class="after-service-change-num-text">
                <span class="after-service-change-text-star">*</span>
                <span class="item-title-text">申请数量：</span>
            </div>
            <div class="after-service-change-num-ops">
                <span class="after-service-change-num-add">+</span>
                <input type="text" value="${afterService.num}" class="after-service-change-num-input" name="num"/>
                <span class="after-service-change-num-minus">-</span>
            </div>
            <span class="small-description-text">您最多可以申请的数量为 ${afterService.orderItem.num} 个</span>
        </div>

        <div class="after-service-change-reason-div">
            <div class="after-service-change-reason-text">
                <span class="after-service-change-text-star">*</span>
                <span class="item-title-text">问题描述：</span>
            </div>
            <textarea cols="50" rows="5" name="reason"></textarea>
        </div>

        <div class="after-service-change-picture-div">
            <div class="after-service-change-picture-text">
                <span class="after-service-change-text-star">*</span>
                <span class="item-title-text">图片信息：</span>
            </div>
            <div class="after-service-change-picture-choise">
                <input type="file" accept="image/*" name="picture">
                <div class="small-description-text">如有需要，可以上传新的图片</div>
            </div>
        </div>

        <button type="submit" class="btn btn-default after-service-change-submit">修改</button>
    </form>
</div>