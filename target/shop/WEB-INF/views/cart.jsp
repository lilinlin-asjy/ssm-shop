<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <style>

        input[type=number] {
            -moz-appearance:textfield;

        }
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <script>
        $(function(){
            //手动修改购物项数量
            $("#count").blur(function(){
                var count = $(this).val()
                var pId =  $(this).attr("id")
                if(count==''){
                    $(this).val(1)
                }
                changeCount(count,pId)

            })
            //点击修改购物项数量
            $("[name='changeCount']").click(function(){
                var count = $(this).parent().find("[name='count']").val()
                var pId =  $(this).parent().find("[name='count']").attr("id")
                changeCount(count,pId)
            })
            //删除购物项
            $("[name='del']").click(function(){
                var pId = $(this).attr("id")
                if(confirm("确定删除吗？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/delCartItem",
                        data:{
                             pId:pId
                        },
                        success:function(data){
                            $("#total").text(data)
                            var size = $("#cartItemSize").text()
                            $("#cartItemSize").text(Number(size)-1)
                            $("#cartItem"+pId).remove()
                        }
                    })
                }
            })

            //清空购物项
            $("#clear").click(function(){
                if(confirm("确认清空购物车吗")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/clearCartItem",
                        success:function(data){
                            $("#total").text(data)
                            $("#clearAll").remove()
                            $("#cartItemSize").text(0)
                        }
                    })
                }

            })
        })

        //修改购物项数量ajax请求
        function changeCount(count,pId){
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/changeCount",
                data:{
                    count:count,
                    pId:pId
                },
                success:function(data){
                    var shopPrice =  $("#shopPrice"+pId).text()
                    var subTotal =  $("#subTotal"+pId).text(Number(shopPrice)*Number(count));
                    $("#total").text(data)
               }
            })
        }
    </script>
</head>

<body style="position:relative;">

	<!--header-->
    <%@include file="common/header.jsp"%>
	
    <!--logo search weweima-->
    <%@include file="common/logoAndSearch.jsp"%>

    
    <!--内容开始-->
    <div class="cart-content w1200">
    	<ul class="cart-tit-nav">
        	<li class="current"><a href="#">全部商品   <span id="cartItemSize">${fn:length(cart.cartItemMap)}<span></span></a></li>

            <div style="clear:both;"></div>
        </ul>
        <c:if test="${!empty cart.cartItemMap}">
        <div class="cart-con-tit">
        	<p class="p1">
            	<input type="checkbox" value="" name="hobby"></input>
				<span>全选</span>
            </p>
            <p class="p2">商品信息</p>
            <p class="p3">规格</p>
            <p class="p4">数量</p>
            <p class="p5">单价（元）</p>
            <p class="p6">金额（元）</p>
            <p class="p7">操作</p>
        </div>
        </c:if>
        <div id="clearAll">
        <c:forEach items="${cart.cartItemMap}" var="cartItem" varStatus="vs">
        <div class="cart-con-info" id="cartItem${cartItem.product.pId}">
        	<div class="info-top">
            	<input type="checkbox" value="" name="hobby"></input>
				<span>商家：爱尚微购</span>
            </div>
            <div class="info-mid" >
            	<input type="checkbox" value="" name="hobby" class="mid-ipt f-l"></input>
                <div class="mid-tu f-l">
                	<a href="#"><img src="${pageContext.request.contextPath}/${cartItem.product.image}" style="width: 80px;height: 80px"/></a>
                </div>
                <div class="mid-font f-l" style="width: 232px;height: 41px;">
                	<a href="#">${cartItem.product.pName}<br />${fn:substring(cartItem.product.pDesc,0 ,10 )}...</a>
                    <span>满赠</span>
                </div>
                <div class="mid-guige f-l">
                	<p>颜色：蓝色</p>
                    <p>尺码：XL</p>
                    <a href="JavaScript:;" class="xg" xg="xg1">修改</a>
                    <div class="guige-xiugai" xg-g="xg1">
                    	<div class="xg-left f-l">
                        	<dl>
                            	<dt>颜  色</dt>
                                <dd>
                                	<a href="JavaScript:;" class="current">黑色</a>
                                    <a href="JavaScript:;">白色</a>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <dl>
                            	<dt>尺  码</dt>
                                <dd>
                                	<a href="JavaScript:;" class="current">M</a>
                                    <a href="JavaScript:;">L</a>
                                    <a href="JavaScript:;">XL</a>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <a href="JavaScript:;" class="qd">确定</a>
                            <a href="JavaScript:;" class="qx" qx="xg1">取消</a>
                        </div>
                    	<div class="xg-right f-l">
                        	<a href="#"><img src="${pageContext.request.contextPath}/images/dai2.gif" /></a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
                <div class="mid-sl f-l">
                	<a href="JavaScript:;" name="changeCount" class="sl-left">-</a>
                    <input type="number" value="${cartItem.count}" name="count" id="${cartItem.product.pId}"/>
                    <a href="JavaScript:;" name="changeCount" class="sl-right">+</a>
                </div>
                <p class="mid-dj f-l">¥ <span id="shopPrice${cartItem.product.pId}">${cartItem.product.shopPrice}</span>.00</p>
                <p class="mid-je f-l">¥ <span id="subTotal${cartItem.product.pId}">${cartItem.subTotal}</span>.00</p>
                <div class="mid-chaozuo f-l">
                	<a href="#">移入收藏夹</a>
                    <a href="javaScript:;" name="del" id="${cartItem.product.pId}">删除</a>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
        </c:forEach>
        </div>

        <p style="margin-top:100px;font-size: 40px">${empty cart.cartItemMap?"购物车空空如也！快去选购吧":''}</p>

        <c:if test="${!empty cart.cartItemMap}">
       	<div class="cart-con-footer">
        	<div class="quanxuan f-l">
            	<input type="checkbox" value="" name="hobby"></input>
                <span>全选</span>
                <a href="javaScript:;" id="clear">清空购物车</a>
                <a href="#">加入收藏夹</a>
                <p>（此处始终在屏幕下方）</p>
            </div>
            <div class="jiesuan f-r">
            	<div class="jshj f-l">
                	<p>合计（不含运费）</p>
                	<p class="jshj-p2">
                    	￥：<span id="total">${cart.total}</span>.00
                    </p>
                </div>
            	<a href="${pageContext.request.contextPath}/order/orderConfirm" class="js-a1 f-l">结算</a>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
        </c:if>

    </div>

    <!--底部一块-->
    <%@include file="common/footer.jsp"%>
</body>
</html>
