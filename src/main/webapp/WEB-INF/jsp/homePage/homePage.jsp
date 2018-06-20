<%--
  Created by IntelliJ IDEA.
  User: 29256
  Date: 2018/5/24
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Bookstore</title>

    <script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>

    <link href="css/homePage.css" rel="stylesheet">
</head>

<body>


<nav class="top ">

    <span>欢迎来到Bookstore</span>


    <c:if test="true">
        <a href="log">请登录</a>
        <a href="reg">免费注册</a>
    </c:if>


    <span class="pull-right">
			<a href="#nowhere">我的订单</a>
			<a href="#nowhere">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>0</strong>件</a>
		</span>

</nav>



<form action="foresearch" method="post">

    <div class="searchDiv">
        <input name="keyword" type="text" value="" placeholder="三体" id="searchInput">
        <button type="submit" class="searchButton">搜索</button>
        <div class="searchBelow">
            <span><a href="#nowhere">科幻小说</a> <span>|</span></span>
            <span><a href="#nowhere">散文随笔</a> <span>|</span></span>
            <span><a href="#nowhere">推理悬疑</a> </span>
        </div>
    </div>
</form>


<script>
    function showProductsAsideCategorys(cid) {
        $("div.eachCategory[cid=" + cid + "]").css("background-color", "white");
        $("div.eachCategory[cid=" + cid + "] a").css("color", "#87CEFA");
        $("div.productsAsideCategorys[cid=" + cid + "]").show();
    }


    function hideProductsAsideCategorys(cid) {
        $("div.eachCategory[cid=" + cid + "]").css("background-color", "#e2e2e3");
        $("div.eachCategory[cid=" + cid + "] a").css("color", "#000");
        $("div.productsAsideCategorys[cid=" + cid + "]").hide();
    }

    $(function () {
        $("div.eachCategory").mouseenter(function () {
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.eachCategory").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseenter(function () {
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });

        $("div.rightMenu span").mouseenter(function () {
            var left = $(this).position().left;
            var top = $(this).position().top;
            var width = $(this).css("width");
            var destLeft = parseInt(left) + parseInt(width) / 2;
            $("img#catear").css("left", destLeft);
            $("img#catear").css("top", top - 20);
            $("img#catear").fadeIn(500);

        });
        $("div.rightMenu span").mouseleave(function () {
            $("img#catear").hide();
        });

        var left = $("div#carousel-of-product").offset().left;
        $("div.categoryMenu").css("left", left - 20);
        $("div.categoryWithCarousel div.head").css("margin-left", left);
        $("div.productsAsideCategorys").css("left", left - 20);

    });
</script>


<div class="categoryWithCarousel">

    <div class="headbar">
        <div class="head ">
            <span style="margin-left:10px" class="glyphicon glyphicon-th-list"></span>
            <span style="margin-left:10px">商品分类</span>
        </div>

        <div class="rightMenu">

            <span><a href="#nowhere">科幻小说</a> </span>
            <span><a href="#nowhere">人文社科</a> </span>
            <span><a href="#nowhere">人物传记</a> </span>
            <span><a href="#nowhere">青春文学</a> </span>
            <span><a href="#nowhere">成功励志</a> </span>
            <span><a href="#nowhere">中学教辅</a> </span>
            <span><a href="#nowhere">保健养生</a> </span>

        </div>

        <div id="carousel-of-product" class="carousel-of-product carousel slide1" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-of-product" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-of-product" data-slide-to="1"></li>
                <li data-target="#carousel-of-product" data-slide-to="2"></li>
                <li data-target="#carousel-of-product" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="carousel carouselImage"
                         src="http://img62.ddimg.cn/topic_img/gys_0015115/2018.6.4BJLYZTHDZT750_315.jpg">
                </div>
                <div class="item">
                    <img class="carouselImage"
                         src="http://img63.ddimg.cn/upload_img/00678/zsts/750x315_yyx_0531-1527844660.jpg">
                </div>
                <div class="item">
                    <img class="carouselImage" src="http://img63.ddimg.cn/topic_img/gys_04083/750315daguoxianzhi.jpg">
                </div>

                <div class="item">
                    <img class="carouselImage" src="http://img62.ddimg.cn/ddreader/dangebook/wenyijg750-315.jpg">
                </div>

            </div>

        </div>
    </div>


    <div style="position: relative">

        <div class="categoryMenu" style="left: 419.5px; top: -510px">
            <div cid="1" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/1">
                    科幻小说
                </a>
            </div>

            <div cid="2" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/2">
                    人文社科
                </a>
            </div>

            <div cid="3" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/3">
                    人物传记
                </a>
            </div>

            <div cid="4" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/4">
                    青春文学
                </a>
            </div>

            <div cid="5" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/5">
                    成功励志
                </a>
            </div>

            <div cid="6" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="category/6">
                    中学教辅
                </a>
            </div>

            <div cid="7" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">
                    保健养生
                </a>
            </div>

            <div cid="8" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">
                    网络文学
                </a>
            </div>

            <div cid="9" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">
                    哲学宗教
                </a>
            </div>

            <div cid="10" class="eachCategory">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">
                    政治经济
                </a>
            </div>
        </div>
    </div>


    <div style="position: relative;left: 0;top: -510px;">

        <script>
            $(function () {
                $("div.productsAsideCategorys div.row a").each(function () {
                    var v = Math.round(Math.random() * 6);
                    if (v == 1)
                        $(this).css("color", "#87CEFA");
                });
            });

        </script>

        <div cid="1" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="details/1">
                    三体
                </a>
                <a href="details/2">
                    银河帝国
                </a>
                <a href="details/3">
                    沙丘
                </a>
                <a href="details/4" style="color: rgb(135, 206, 250);">
                    神秘岛
                </a>
                <a href="details/5">
                    安德的游戏
                </a>
                <div class="seperator"></div>
            </div>

        </div>

        <div cid="2" class="productsAsideCategorys" style="left: 419.5px; display: none;">

            <div class="row show1">
                <a href="details/6">
                    国家宝藏
                </a>
                <a href="details/7" style="color: rgb(135, 206, 250);">
                    我们的孩子
                </a>
                <a href="details/8">
                    厚黑学
                </a>
                <a href="details/9">
                    乡土中国
                </a>
                <a href="details/10">
                    不列颠简明百科全书
                </a>
                <div class="seperator"></div>
            </div>
        </div>
        <div cid="3" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="details/11" style="color: rgb(135, 206, 250);">
                    王小波传
                </a>
                <a href="details/12">
                    金庸传
                </a>
                <a href="details/13">
                    奥黛丽赫本
                </a>
                <a href="details/14">
                    爱因斯坦传
                </a>
                <a href="details/15">
                    李嘉诚：我一生的理念
                </a>
                <div class="seperator"></div>
            </div>

        </div>

        <div cid="4" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="details/16">
                    听你的
                </a>
                <a href="details/17">
                    孤城闭
                </a>
                <a href="details/18">
                    无可替代的你
                </a>
                <a href="details/19">
                    半生温柔
                </a>
                <a href="details/20">
                    有人靠近，有人疏离
                </a>
                <div class="seperator"></div>
            </div>
        </div>
        <div cid="5" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="details/21">
                    人性的弱点
                </a>
                <a href="details/22">
                    断舍离
                </a>
                <a href="details/23">
                    非暴力沟通
                </a>
                <a href="details/24">
                    生活需要仪式感
                </a>
                <a href="details/25">
                    愿你的青春不负梦想
                </a>
                <div class="seperator"></div>
            </div>
        </div>
        <div cid="6" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="details/26">
                    中学教材全解
                </a>
                <a href="details/27" style="color: rgb(135, 206, 250);">
                    5年高考，3年模拟
                </a>
                <a href="details/28">
                    金考卷
                </a>
                <a href="details/29" style="color: rgb(135, 206, 250);">
                    试题调研
                </a>
                <a href="details/30" style="color: rgb(135, 206, 250);">
                    新东方考研英语词汇
                </a>
                <div class="seperator"></div>
            </div>
        </div>

        <div cid="7" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="#nowhere">
                    黄帝内经
                </a>
                <a href="#nowhere" style="color: rgb(135, 206, 250);">
                    说医不二
                </a>
                <a href="#nowhere">
                    经典中医启蒙
                </a>
                <div class="seperator"></div>
            </div>
        </div>

        <div cid="8" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="#nowhere">
                    华胥引
                </a>
                <a href="#nowhere" style="color: rgb(135, 206, 250);">
                    步步惊心
                </a>
                <a href="f#nowhere">
                    三生三世
                </a>
                <a href="#nowhere" style="color: rgb(135, 206, 250);">
                    夜旅人
                </a>
                <div class="seperator"></div>
            </div>
        </div>

        <div cid="9" class="productsAsideCategorys" style="left: 419.5px; display: none;">
            <div class="row show1">
                <a href="#nowhere">
                    中国哲学简史
                </a>
                <a href="#nowhere" style="color: rgb(135, 206, 250);">
                    西方哲学史
                </a>
                <a href="#nowhere">
                    哲学的故事
                </a>
                <a href="#nowhere" style="color: rgb(135, 206, 250);">
                    美的历程
                </a>
                <div class="seperator"></div>
            </div>
        </div>
    </div>

</div>


<div class="homepageCategoryProducts">


    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">科幻小说</span>
        <br>


        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m4.ddimg.cn/32/35/23579654-1_b_2.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    三体：全三册 刘慈欣代表作！
                </span>
            </a>
            <span class="productPrice">
                64.20
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m2.ddimg.cn/24/35/23765172-1_b_8.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    银河帝国：基地七部曲。
                </span>
            </a>
            <span class="productPrice">
                164.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m9.ddimg.cn/58/25/25169719-1_b_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    沙丘1-3大全集（套装共3册）
                </span>
            </a>
            <span class="productPrice">
                87.50
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m8.ddimg.cn/64/9/23950738-1_b_2.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    神秘岛(北大翻译家陈筱卿权威译作)
                </span>
            </a>
            <span class="productPrice">
                16.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m5.ddimg.cn/9/30/23973255-1_w_19.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    安德的游戏三部曲（全新典藏黑盒版）
                </span>
            </a>
            <span class="productPrice">
                108.70
            </span>
        </div>

        <div style="clear:both"></div>
    </div>



    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">人文社科</span>
        <br>


        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m0.ddimg.cn/37/6/25265530-1_w_8.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    国家宝藏：央视重磅综艺《国家宝藏》
                </span>
            </a>
            <span class="productPrice">
                64.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m5.ddimg.cn/43/2/25090405-1_w_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    我们的孩子（雅理译丛）
                </span>
            </a>
            <span class="productPrice">
                51.80
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m8.ddimg.cn/77/11/9214898-1_w_2.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    厚黑学(李宗吾著)
                </span>
            </a>
            <span class="productPrice">
                14.90
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m9.ddimg.cn/41/30/23678069-1_w_6.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    乡土中国（精装修订版）
                </span>
            </a>
            <span class="productPrice">
                20.50
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m7.ddimg.cn/33/19/23783397-1_w_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    不列颠简明百科全书（精粹本）
                </span>
            </a>
            <span class="productPrice">
                294.00
            </span>
        </div>

        <div style="clear:both"></div>
    </div>



    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">人物传记</span>
        <br>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m9.ddimg.cn/41/14/25226429-1_l_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    王小波传
                </span>
            </a>
            <span class="productPrice">
                29.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m6.ddimg.cn/91/8/25220836-1_l_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    金庸传
                </span>
            </a>
            <span class="productPrice">
                19.90
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m1.ddimg.cn/21/29/25233141-1_l_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    奥黛丽·赫本（新版·精装全彩典藏）
                </span>
            </a>
            <span class="productPrice">
                46.70
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m6.ddimg.cn/27/16/23630436-1_l_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    爱因斯坦传
                </span>
            </a>
            <span class="productPrice">
                66.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m2.ddimg.cn/47/15/23554622-1_w_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    李嘉诚：我一生的理念
                </span>
            </a>
            <span class="productPrice">
                28.40
            </span>
        </div>

        <div style="clear:both"></div>
    </div>


    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">青春文学</span>
        <br>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m9.ddimg.cn/91/0/25266079-1_l_12.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    听你的（张皓宸2018全新力作，销量突破30万册。）
                </span>
            </a>
            <span class="productPrice">
                24.90
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m1.ddimg.cn/98/23/25274501-1_l_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    孤城闭（全二册）（典藏版）
                </span>
            </a>
            <span class="productPrice">
                39.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m8.ddimg.cn/90/28/25197768-1_l_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    无可替代的你
                </span>
            </a>
            <span class="productPrice">
                24.90
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m1.ddimg.cn/49/20/25247821-1_l_6.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    半生温柔
                </span>
            </a>
            <span class="productPrice">
                34.50
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m7.ddimg.cn/84/13/25217067-1_w_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    有人靠近，有人疏离
                </span>
            </a>
            <span class="productPrice">
                34.70
            </span>
        </div>

        <div style="clear:both"></div>
    </div>



    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">成功励志</span>
        <br>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m0.ddimg.cn/23/18/23566280-1_w_4.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    人性的弱点（薛之谦推荐）
                </span>
            </a>
            <span class="productPrice">
                16.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m3.ddimg.cn/68/20/23271503-1_w_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    断舍离
                </span>
            </a>
            <span class="productPrice">
                16.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m1.ddimg.cn/44/26/23807861-1_w_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    非暴力沟通
                </span>
            </a>
            <span class="productPrice">
                19.80
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m4.ddimg.cn/58/12/25209814-1_w_2.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    生活需要仪式感
                </span>
            </a>
            <span class="productPrice">
                18.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m2.ddimg.cn/32/27/24156032-1_w_34.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    愿你的青春不负梦想
                </span>
            </a>
            <span class="productPrice">
                27.50
            </span>
        </div>

        <div style="clear:both"></div>
    </div>



    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">中学教辅</span>
        <br>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m0.ddimg.cn/29/20/25264730-1_b_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    中学教材全解 九年级化学上
                </span>
            </a>
            <span class="productPrice">
                28.70
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m4.ddimg.cn/29/13/25229684-1_w_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    五三 2019A版 高考语文
                </span>
            </a>
            <span class="productPrice">
                57.80
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m5.ddimg.cn/98/18/25247375-1_w_6.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    2018押题卷·高考最后一卷
                </span>
            </a>
            <span class="productPrice">
                13.50
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m9.ddimg.cn/88/12/25255879-1_w_3.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    试题调研 时政热点下
                </span>
            </a>
            <span class="productPrice">
                8.00
            </span>
        </div>

        <div class="productItem">
            <a href="details/1"><img width="100px" src="http://img3m1.ddimg.cn/18/24/23653791-1_w_1.jpg"></a>
            <a class="productItemDescLink" href="details/1">
                <span class="productItemDesc">
                    新东方考研英语词汇词根+联想记忆法乱序版
                </span>
            </a>
            <span class="productPrice">
                32.70
            </span>
        </div>

        <div style="clear:both"></div>
    </div>



    <div id="footer_ensure" class="footer_ensure">
        <a href="#nowhere">
            <img src="/img/ensure.png">
        </a>
    </div>

</div>

</div>
</body>
</html>
