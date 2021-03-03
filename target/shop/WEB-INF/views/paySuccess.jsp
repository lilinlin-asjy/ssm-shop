<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>支付成功</title>
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


    
    <!--内容开始-->
    <div class="payment w1200">
    	<div class="payment-hd">
        	<h3 class="success">支付成功</h3>
        </div>
        <div class="payment-bd">
            <c:forEach items="${orderExt.orderItemExtList}" var="orderItemExt" varStatus="vs">
        	<dl class="dl-hd">
            	<dt><a href="#"><img src="${pageContext.request.contextPath}/${orderItemExt.product.image}" style="widows: 123; height: 122px;"/></a></dt>
                <dd>
                	<h3><a href="#">${orderItemExt.product.pName}</a></h3>
                    <P>${fn:substring(orderItemExt.product.pDesc,0 ,30 )}...</P>
                    <P>数量:${orderItemExt.count}</P>
                    <P style="color: red">单价:￥${orderItemExt.product.shopPrice}</P>
                    <P style="color: red">小计:￥${orderItemExt.subTotal}</P>
                </dd>

                <div style="clear:both;"></div>
            </dl>
            </c:forEach>
            <ul class="ul-bd">

            	<li><span>价格</span><p><i>¥${orderExt.total}</i></p></li>
            	<li><span>卖家名称</span><p>爱尚微购</p></li>
            	<li><span>收货信息</span><p>${orderExt.addr}， ${orderExt.name}， ${orderExt.phone}</p></li>
            	<li><span>成交时间</span><p><fmt:formatDate value="${orderExt.orderTime}" pattern="yyyy-MM-dd HH:MM:SS"></fmt:formatDate></p></li>
            	<li><span>订单号</span><p>${orderExt.oId}</p></li>
            </ul>
        </div>
        <div class="payment-ft">
        	<button class="btn2" onclick="window.location.href='${pageContext.request.contextPath}/order/toOrder'">我的订单</button>
        </div>
    </div>

<!--底部一块-->
<%@include file="common/footer.jsp"%>
</body>
</html>
