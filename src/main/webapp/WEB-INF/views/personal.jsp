<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script>
        $(function(){
            $("form").submit(function(){
                if($("#name").val()==null || $("#name").val().trim()==""){
                    alert("昵称必填")
                    $("#name").focus()
                    return false
                }
                if($("#addr").val()==null || $("#addr").val().trim()==""){
                    alert("地址必填")
                    $("#name").focus()
                    return false
                }
                if($("#oldPassword").val()!="${user.password}"){
                    alert("原密码错误")
                    $("#oldPassword").focus()
                    return false
                }
                var partten = /^(?=.*[a-zA-z])(?=.*[\d])(?=.*[\W])[a-zA-Z\d\W]{6,16}$/
                if(!partten.test($("#password").val())){
                    alert("密码由6-16的字母、数字、符号组成")
                    $("#password").focus()
                    return false
                }


                return true;
            })


        })
    </script>
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

    	<div class="personal-r f-r">
        	<div class="personal-right">
                <div class="personal-r-tit">
                    <h3>个人资料</h3>
                </div>
                <form action="${pageContext.request.contextPath}/user/doPersonal" method="post">
                <input type="hidden" name="uId" value="${user.uId}"/>
                    <div class="data-con">
                	<div class="dt1">
                    	<p class="f-l">当前头像：</p>
                        <div class="touxiang f-l">
                        	<div class="tu f-l">
                            	<a href="#">
                                	<img src="${pageContext.request.contextPath}/images/data-tu.gif" />
                                    <input type="file" name="" id="" class="img1" />
                                </a>
                            </div>
                            <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                            <div style="clear:both;"></div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">用户名：</p>
                        <input type="text" name="username" id="username" value="${user.username}" readonly style="border:none"/>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                    	<p class="dt-p f-l">昵称：</p>
                        <input type="text" placeholder=""  value="${user.name}" name="name" id="name"/>
                        <div style="clear:both;"></div>
                    </div>

                     <div class="dt1 dt3">
                    	<p class="dt-p f-l">手机号：</p>
                        <input type="tel" value="${user.phone}" name="phone" id="phone" />
                    </div>

                    <div class="dt1">
                        <p class="dt-p f-l">邮箱：</p>
                        <input type="email" value="${user.email}" name="email" id="email" />
                        <div style="clear:both;"></div>
                    </div>

                   <div class="dt1">
                        <p class="dt-p f-l">地址：</p>
                        <input type="text" value="${user.addr}" name="addr" id="addr" />
                        <div style="clear:both;"></div>
                    </div>

                    <div class="dt1">
                    	<p class="dt-p f-l">原密码：</p>
                        <input type="text" value="" name="oldPassword" id="oldPassword"/>
                        <div style="clear:both;"></div>
                    </div>

                    <div class="dt1 dt4">
                        <p class="dt-p f-l">新密码：</p>
                        <input type="text" value="" name="password" id="password"/>
                        <div style="clear:both;"></div>
                    </div>
                    <button class="btn-pst">保存</button>
                </div>
                </form>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>



<!--底部一块-->
<%@include file="common/footer.jsp"%>
</body>
</html>
