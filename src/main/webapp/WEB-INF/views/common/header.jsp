<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2021/2/26
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            <c:if test="${empty sessionScope.user}">
                Hi!您好，欢迎来到宅客微购，
                <a href="${pageContext.request.contextPath}/user/login">请登录</a>
                <a href="${pageContext.request.contextPath}/user/toRegister">【免费注册】</a>
            </c:if>
            <c:if test="${!empty sessionScope.user}">
                Hi!您好，${user.username}欢迎来到宅客微购
                <a href="${pageContext.request.contextPath}/user/logout">退出登录</a>
            </c:if>
        </p>
        <p class="hd-p2 f-r">
            <a href="${pageContext.request.contextPath}/user/toPersonal">返回首页 (个人中心)</a><span>|</span>
            <a href="${pageContext.request.contextPath}/cart/toCart">我的购物车</a><span>|</span>
            <a href="${pageContext.request.contextPath}/order/toOrder">我的订单</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>