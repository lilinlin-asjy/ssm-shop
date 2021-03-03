<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="common/header.jsp" %>

<!--logo search weweima-->
<%@include file="common/logoAndSearch.jsp" %>


<!--内容开始-->
<form action="${pageContext.request.contextPath}/order/toPay" method="post">
    <div class="payment-interface w1200">
        <div class="pay-info">
            <div class="info-tit">
                <h3>选择收货地址</h3>
            </div>
            <table>
                <tr style="height: 40px;">
                    <td>收货人姓名</td>
                    <td><input type="text" name="name" value="${user.name}"></td>
                </tr>
                <tr style="height: 40px;">
                    <td>收货人地址</td>
                    <td><input type="text" name="addr" value="${user.addr}"></td>
                </tr>
                <tr style="height:40px;">
                    <td>联系方式</td>
                    <td><input type="text" name="phone" value="${user.phone}"></td>
                </tr>
            </table>
        </div>
        <div class="pay-info">
            <div class="info-tit" style="border-bottom:0;">
                <h3>订单信息</h3>
            </div>
        </div>

        <div class="cart-con-info">

            <div class="cart-con-tit" style="margin:20px 0 5px;">
                <p class="p1" style="width:400px;">
                    <span>商家：爱尚微购</span>
                </p>
                <p class="p4" style="width:130px;">数量</p>
                <p class="p5">单价（元）</p>
                <p class="p6" style="width:173px;">金额（元）</p>

            </div>
            <c:forEach items="${cart.cartItemMap}" var="cartItem" varStatus="vs">
                <div class="info-mid">
                    <div class="mid-tu f-l">
                        <a href="#"><img src="${pageContext.request.contextPath}/${cartItem.product.image}"
                                         style="width: 80px;height: 80px"/></a>
                    </div>
                    <div class="mid-font f-l" style="margin-right:40px;width: 232px">
                        <a href="#">${cartItem.product.pName}<br/>${fn:substring(cartItem.product.pDesc,0,30)}...</a>
                    </div>

                    <div class="mid-sl f-l" style="margin:10px 54px 0px 50px;width: 71px">

                            ${cartItem.count}


                    </div>
                    <p class="mid-dj f-l">¥ ${cartItem.product.shopPrice}</p>
                    <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${cartItem.subTotal}</p>

                    <div style="clear:both;"></div>
                </div>
            </c:forEach>
            <div class="info-heji">
                <p class="f-r">店铺合计(含运费)：<span>¥46.60</span></p>
                <h3 class="f-r">订单号：2015122332124565</h3>
            </div>
            <div class="info-tijiao">
                <p class="p1">实付款：<span>¥${cart.total}</span></p>
                <button class="btn" onclick="${pageContext.request.contextPath}/order/toP">提交订单</button>
            </div>
        </div>

    </div>
</form>
<!--底部一块-->
<%@include file="common/footer.jsp" %>


</body>
</html>
