<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>中林首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body id="top">

<!--header-->
<%@include file="common/header.jsp"%>

<!--logo search weweima-->
<%@include file="common/logoAndSearch.jsp"%>

<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box">
                <c:forEach items="${indexNav}" var="categoryExt" varStatus="vs" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif"/><a
                                    href="${pageContext.request.contextPath}/product/products?cId=${categoryExt.cId}">${categoryExt.cName}</a></dt>
                            <dd>
                                <c:forEach items="${categoryExt.categorySecondList}" var="categorySecond" varStatus="vs"
                                           begin="0" end="2">
                                    <a href="${pageContext.request.contextPath}/product/products?csId=${categorySecond.csId}">${categorySecond.csName}</a>
                                    <c:if test="${!vs.last}">
                                        <span>|</span>
                                    </c:if>
                                </c:forEach>
                            </dd>

                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="${pageContext.request.contextPath}/product/products?cId=${categoryExt.cId}">${categoryExt.cName}</a></dt>
                                <dd>
                                    <c:forEach items="${categoryExt.categorySecondList}" var="categorySecond"
                                               varStatus="vs">
                                        <a href="${pageContext.request.contextPath}/product/products?csId=${categorySecond.csId}">${categorySecond.csName}</a>
                                        <c:if test="${!vs.last}">
                                            <span>|</span>
                                        </c:if>
                                    </c:forEach>
                                </dd>
                            </dl>

                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <ul class="nav-font f-l">
            <ul class="nav-font f-l">
                <c:forEach items="${indexNav}" var="categoryExt" varStatus="vs" begin="0" end="7">
                    <li><a href="${pageContext.request.contextPath}/product/products?cId=${categoryExt.cId}">${categoryExt.cName}</a></li>
                    <c:if test="${vs.last}">
                        <span><img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span>
                    </c:if>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>

<!--banner-->
<div class="banner">
    <ul class="ban-ul1">
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png"/></a></li>
    </ul>
    <div class="ban-box w1200">
        <ol class="ban-ol1">
            <li class="current"></li>
            <li></li>
            <li></li>
            <li></li>
            <div style="clear:both;"></div>
        </ol>
    </div>
</div>

<!--热门推荐-->
<div class="zl-tuijian w1200">
    <div class="tuijian-left f-l">
        <img src="${pageContext.request.contextPath}/images/zl2-14.png"/>
    </div>
    <ul class="tuijian-right f-l">
        <li>
            <div class="li-box li-box1">
                <a href="JavaScript:;" class="li-a1">锦尚世家</a>
                <a href="JavaScript:;" class="li-a2">锦绣花苑　传承世家</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box2">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box3">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box4">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box5">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box6">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box7">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box8">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div style="clear:both;"></div>
</div>

<!--1F  在线商城-->
<div class="zl-info w1200">
    <div class="zl-title1">
        <h3 class="title1-h3 f-l">1F 在线商城</h3>
        <ul class="title1-ul1 f-r">
            <li class="current"><a href="JavaScript:;">食品/饮料/酒水</a></li>
            <li><a href="JavaScript:;">粮油副食</a></li>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
    <div class="zl-con">
        <div class="zl-con-left f-l">
            <div class="zl-tu">
                <img src="${pageContext.request.contextPath}/images/zl2-33.gif" class="zl-img"/>
            </div>
            <p class="zl-lp">
                黑色星期五</br>
                优惠力度大
            </p>
            <ul class="zl-lhover">
                <li><a href="products.jsp">饼干糕点</a></li>
                <li><a href="products.jsp">厨房调味</a></li>
                <li><a href="products.jsp">厨房清洁</a></li>
                <li><a href="products.jsp">洗浴用品</a></li>
                <li><a href="products.jsp">宝宝喂养</a></li>
                <li><a href="products.jsp">家居彩电</a></li>
                <li><a href="products.jsp">宝宝喂养</a></li>
                <li><a href="products.jsp">家居彩电</a></li>
                <li><a href="products.jsp">厨房清洁</a></li>
                <li><a href="products.jsp">洗浴用品</a></li>
                <li><a href="products.jsp">宝宝喂养</a></li>
                <li><a href="products.jsp">家居彩电</a></li>
                <li><a href="products.jsp">宝宝喂养</a></li>
                <li><a href="products.jsp">家居彩电</a></li>
                <div style="clear:both;"></div>
            </ul>
        </div>
        <div class="zl-con-right f-l">
            <div class="zl-rbox lihover">
                <div class="rbox-left f-l">
                    <div class="rbox-ltop"><a href="商品详情.html"><img
                            src="${pageContext.request.contextPath}/images/zl2-48.png"/></a></div>
                    <ul class="rbox-lft">
                        <li>
                            <a href="商品详情.html" class="a1">周黑鸭 鸭翅</a>
                            <p>￥25.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-46.gif"/></a>
                        </li>
                        <li>
                            <a href="商品详情.html" class="a1">特产中国山西大枣</a>
                            <p>￥25.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-44.gif"/></a>
                        </li>
                        <li>
                            <a href="商品详情.html" class="a1">Wonderful 盐焗开心果</a>
                            <p>￥39.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-45.gif"/></a>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <ul class="rbox-right f-l">
                    <li>
                        <a href="商品详情.html" class="a1">人头马XO香槟干邑白兰地</a>
                        <p>￥1950.00/件</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-47.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">DNZ新西兰进口蜂蜜</a>
                        <p>￥199.00/500ML</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-42.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">可口可乐樱桃味碳酸饮料</a>
                        <p>￥5.90/罐</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-48.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">马爹利蓝带干邑白兰地</a>
                        <p>￥3450.00/件</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-43.gif"/></a>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <div class="zl-rbox lihover">
                <div class="rbox-left f-l">
                    <div class="rbox-ltop"><a href="商品详情.html"><img
                            src="${pageContext.request.contextPath}/images/zl2-48.png"/></a></div>
                    <ul class="rbox-lft">
                        <li>
                            <a href="商品详情.html" class="a1">特产中国山西大枣</a>
                            <p>￥25.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-44.gif"/></a>
                        </li>
                        <li>
                            <a href="商品详情.html" class="a1">Wonderful 盐焗开心果</a>
                            <p>￥39.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-45.gif"/></a>
                        </li>
                        <li>
                            <a href="商品详情.html" class="a1">周黑鸭 鸭翅</a>
                            <p>￥25.00/袋</p>
                            <a href="商品详情.html" class="a2"><img
                                    src="${pageContext.request.contextPath}/images/zl2-46.gif"/></a>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <ul class="rbox-right f-l">
                    <li>
                        <a href="商品详情.html" class="a1">DNZ新西兰进口蜂蜜</a>
                        <p>￥199.00/500ML</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-42.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">马爹利蓝带干邑白兰地</a>
                        <p>￥3450.00/件</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-43.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">人头马XO香槟干邑白兰地</a>
                        <p>￥1950.00/件</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-47.gif"/></a>
                    </li>
                    <li>
                        <a href="商品详情.html" class="a1">可口可乐樱桃味碳酸饮料</a>
                        <p>￥5.90/罐</p>
                        <a href="商品详情.html" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-48.gif"/></a>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>


<!--2F  餐饮娱乐-->
<c:forEach items="${indexNav}" var="category" varStatus="vs">
    <div class="zl-info w1200">
        <div class="zl-title1" style="border-color:#FF9A02;">
            <h3 class="title1-h3 f-l">${vs.count+1}F ${category.cName}</h3>
            <ul class="title1-ul1 title1-ul2 f-r">
                <c:forEach items="${category.categorySecondList}" var="categorySecond" varStatus="vs1">
                    <li class="${vs1.first?'current':''}"><a href="JavaScript:;">${categorySecond.csName}</a></li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>
        <div class="zl-con">
            <div class="zl-con-left f-l" style="background:#FBEAD0;">
                <div class="zl-tu">
                    <img src="${pageContext.request.contextPath}/images/zl2-34.gif" class="zl-img"/>
                </div>
                <p class="zl-lp" style="color:#FF9901;">
                    周末，嗨起来</br>
                    兄弟，躁起来
                </p>
                <ul class="zl-lhover" style=" background:#FF9A02;">
                    <c:forEach items="${category.categorySecondList}" var="categorySecond">
                        <li><a href="JavaScript:;">${categorySecond.csName}</a></li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
            </div>
            <div class="zl-con-right f-l">
                <c:forEach items="${category.categorySecondList}" var="categorySecond">
                    <ul class="zl-rul1 lihover">
                        <c:forEach items="${productMap[categorySecond.csId]}" var="product">
                            <li>
                                <div class="sy-tu1">
                                    <a href="${pageContext.request.contextPath}/${product.pId}"><img
                                            src="${pageContext.request.contextPath}/${product.image}"/></a>
                                </div>
                                <div class="sy-tit1">
                                    <a href="${pageContext.request.contextPath}/${product.pId}">${product.pName}</a>
                                </div>
                                <div class="sy-tit2">
                                    <p><a href="商品详情（餐饮）.html">${product.pDesc}</a></p>
                                    <p><span style="color: red">￥${product.marketPrice}</span></p>
                                    <p><span style="color: red">${product.shopPrice}</span></p>
                                </div>
                            </li>
                        </c:forEach>

                        <div style="clear:both;"></div>
                    </ul>
                </c:forEach>

            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
</c:forEach>


<!--底部一块-->
<%@include file="common/footer.jsp"%>

<!--固定右侧-->
<ul class="youce">
    <li class="li1">
        <a href="index.jsp" class="li1-tu1"><img src="${pageContext.request.contextPath}/images/zl2-94.png"/></a>
        <a href="index.jsp" class="li1-zi1">返回首页</a>
    </li>
    <li class="li2">
        <a href="购物车.html"><img src="${pageContext.request.contextPath}/images/zl2-95.png"/>购</br>物</br>车</a>
    </li>
    <li class="li3">
        <a href="#" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-96.png"/></a>
        <a href="#" class="li1-zi2">我关注的品牌</a>
    </li>
    <li class="li3">
        <a href="浏览记录.html" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-97.png"/></a>
        <a href="浏览记录.html" class="li1-zi2">我看过的</a>
    </li>
    <li class="li4">
        <a href="JavaScript:;" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-98.gif"/></a>
        <div class="li4-ewm">
            <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-101.gif"/></a>
            <p>扫一扫</p>
        </div>
    </li>
    <li class="li3 li5">
        <a href="#top" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-99.gif"/></a>
        <a href="#top" class="li1-zi2">返回顶部</a>
    </li>
</ul>


</body>
</html>
