<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索列表页(有品牌)</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script>
        $(function () {

            $("[name='addCart']").click(function () {
                var count = $(this).parent().prev().find("[name='count']").text();
                var pId = $(this).parent().prev().find("[name='count']").attr("id")
                $.ajax({
                    url: "${pageContext.request.contextPath}/cart/addCart",
                    data:{
                        count: count,
                        pId: pId
                    },
                    success: function (data) {
                        if (data != "") {
                            alert("添加成功")
                        }
                    }
                })
            })
        })
    </script>
</head>

<body>

<!--header-->
<%@include file="common/header.jsp" %>

<!--logo search weweima-->
<%@include file="common/logoAndSearch.jsp" %>

<!--nav-->
<%@include file="common/nav.jsp" %>

<!--内容开始-->
<!--筛选结果-->
<div class="screening-results w1200">
    <p class="tiao">找到共 ${productForPageBean.total} 条</p>
    <c:forEach items="${indexNav}" var="categoryExt" varStatus="vs">
        <c:if test="${categoryExt.cId==productForPageBean.cId}">
            <c:set var="cName" value="${categoryExt.cName}"></c:set>
        </c:if>
        <c:forEach items="${categoryExt.categorySecondList}" var="categorySecond" varStatus="vs">
            <c:if test="${categorySecond.csId==productForPageBean.csId}">
                <c:set var="cName" value="${categoryExt.cName}"></c:set>
                <c:set var="csName" value="${categorySecond.csName}"></c:set>
            </c:if>
        </c:forEach>

    </c:forEach>
    <div class="results">
        <p class="re-p1 f-l">
            全部结果：${cName} <c:if test="${csName!=null}"> > <span>品牌：${csName}　</span>　</c:if>
        </p>

        <div style="clear:both;"></div>
    </div>
</div>


<!--内容↓↑-->
<div class="shop-page-con w1200">
    <div class="shop-pg-left f-l" style="width:215px">
        <div class="shop-left-buttom" style="margin-top:0;">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>
            <ul class="shop-left-ul">
                <c:forEach items="${isHotProducts}" var="product" varStatus="vs">
                    <li>
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/product_view?pId=${product.pId}"
                               class="li-top-tu"><img src="${pageContext.request.contextPath}/${product.image}"
                                                      style="width: 95px;height: 110px"/></a>
                            <p class="jiage"><span class="sp1">￥${product.shopPrice}</span><span
                                    class="sp2">￥${product.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${product.pName}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p class="md-l-l f-l" ap="" name="count" id="${product.pId}">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button class="md-l-btn2" name="addCart">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">爱尚微购自营</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li class="current"><a href="#">综合 ↓</a></li>
                <li><a href="#">销量 ↓</a></li>
                <li><a href="#">新品 ↓</a></li>
                <li><a href="#">评价 ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="shop-cmp-m f-l">
                <span>价格</span><input type="text"/><span>-</span><input type="text"/>
            </div>
            <div class="shop-cmp-r f-l">
                <ul class="f-l">
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>包邮</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>进口</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>仅显示有货</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满赠</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满减</span>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <button>确定</button>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <ul class="shop-ul-tu shop-ul-tu1">
                <c:forEach items="${productForPageBean.list}" var="product" varStatus="vs">
                    <li style="margin-right:0;">
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/product_view?pId=${product.pId}"
                               class="li-top-tu"><img src="${pageContext.request.contextPath}/${product.image}"
                                                      style="width: 95px;height: 100px"/></a>
                            <p class="jiage"><span class="sp1">￥${product.shopPrice}</span><span
                                    class="sp2">￥${product.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${product.pName}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p class="md-l-l f-l" ap="" name="count" id="${product.pId}">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button class="md-l-btn2" name="addCart">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">爱尚微购自营</p>
                    </li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>

            <!--分页-->
            <div class="paging" style="width: 650px">
                <div class="pag-left f-l">
                    <c:if test="${productForPageBean.pageNow!=1}">
                        <a href="${pageContext.request.contextPath}/product/products?pageNow=${productForPageBean.pageNow-1}&searchName=${productForPageBean.searchName}&cId=${productForPageBean.cId}&csId=${productForPageBean.csId}"
                           class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">
                        <c:forEach items="${productForPageBean.pages}" var="page">
                            <li class="${productForPageBean.pageNow==page?'current':'' }"><a
                                    href="${pageContext.request.contextPath}/product/products?pageNow=${page}&searchName=${productForPageBean.searchName}&cId=${productForPageBean.cId}&csId=${productForPageBean.csId}">${page}</a>
                            </li>
                        </c:forEach>

                        <div style="clear:both;"></div>
                    </ul>
                    <c:if test="${productForPageBean.pageNow<productForPageBean.pageCount}">
                        <a href="${pageContext.request.contextPath}/product/products?pageNow=${productForPageBean.pageNow+1}&searchName=${productForPageBean.searchName}&cId=${productForPageBean.cId}&csId=${productForPageBean.csId}"
                           class="about left-l f-l">></a>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
                <form action="${pageContext.request.contextPath}/product/products?cId=${productForPageBean.cId}&searchName=${productForPageBean.searchName}&csId=${productForPageBean.csId}"
                      method="post">
                    <div class="pag-right f-l">
                        <div class="jump-page f-l">
                            到第<input type="number" name="pageNow" min="1" max="${productForPageBean.pageCount}"/>页
                            共${productForPageBean.pageCount}页
                        </div>
                        <button class="f-l">确定</button>

                        <div style="clear:both;"></div>
                    </div>
                </form>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="common/footer.jsp" %>
</body>
</html>
