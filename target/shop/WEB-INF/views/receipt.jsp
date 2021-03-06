<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单(确认收货)</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">
<!--header-->
<%@include file="common/header.jsp"%>

<!--logo search weweima-->
<%@include file="common/logoAndSearch.jsp"%>

<!--nav-->
<%@include file="common/nav.jsp"%>
    
    <!--内容开始-->
    <div class="personal w1200">
    	<div class="personal-left f-l">
        	<div class="personal-l-tit">
            	<h3>个人中心</h3>
            </div>
            <ul>
            	<li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            	<li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            	<li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            	<li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            	<li class="per-li5"><a href="#">购物车<span>></span></a></li>
            	<li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            	<li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            	<li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            	<li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            	<li class="per-li10"><a href="#">会员积分<span>></span></a></li>
            </ul>
        </div>
    	<div class="f-r">
            <div class="confirmation">
            	<div class="in-tit">
                    <h3>商品信息</h3>
                </div>
                <c:forEach items="${orderExt.orderItemExtList}" var="orderItemExt">
                    <div class="commodity" style="border-bottom:0;">
                        <div class="matong f-l">
                            <a href="#"><img style="width: 220px;height: 219px" src="${pageContext.request.contextPath}/${orderItemExt.product.image}" /></a>
                        </div>
                        <div class="com-con f-l">
                            <h3>${orderItemExt.product.pName}</h3>
                            <p class="pt">${fn:substring(orderItemExt.product.pDesc,0 ,30 )}...</p>

                            <dl>
                                <dt>数量</dt>
                                <dd><span class="sp2">${orderItemExt.count}</span></dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <dl>
                                <dt>小计</dt>
                                <dd><span class="sp2">¥${orderItemExt.subTotal}</span></dd>
                                <div style="clear:both;"></div>
                            </dl>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </c:forEach>
            </div>
            <div class="confirmation">
            	<div class="in-tit">
                    <h3>订单信息</h3>
                </div>
                <div class="odr-cf">
                	<p>卖家名称：爱尚微购专营店</p>
                	<p>收货信息： ${orderExt.addr}，  ${orderExt.name}，  ${orderExt.phone}</p>
                	<p>成交时间： <fmt:formatDate value="${orderExt.orderTime}" pattern="yyyy-MM-dd HH:MM:SS"></fmt:formatDate></p>
                	<p>订单号：${orderExt.oId}</p>
                </div>
            </div>
            <div class="confirmation">
            	<div class="in-tit">
                    <h3>确认收货</h3>
                </div>
                <div class="odr-sh">
                	<P class="reminder">温馨提示：请收到货后，再确认收货！否则您可能钱货两空！</P>
                    <div class="zfb">
                    	<P class="zfmm">支付宝支付密码：</P>
                        <input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" style="border-right:1px solid #E5E5E5;"/>
                        <p class="shuzi">请输入6位数字支付密码</p>
                        <button class="zfb-btn" onclick="window.location.href='${pageContext.request.contextPath}/order/doReceipt.do?oId=${orderExt.oId}'">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>

<!--底部一块-->
<%@include file="common/footer.jsp"%>
</body>
</html>
