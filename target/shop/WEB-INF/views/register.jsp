<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>
<script>
    $(function () {

        //用户名验证55
        $("#userName").blur(function () {
            var uname = $(this).val()
            // 发送ajax请求，验证用户名是否重复
            $.ajax({
                url: "${pageContext.request.contextPath}/user/checkUserName",
                data: {
                    userName: uname
                },
                success: function (data) {
                    if (data == "ok") {
                        $("#userNameMsg").text("用户名可以使用")
                        $("#userNameMsg").attr("class", "dui")
                    } else {
                        $("#userNameMsg").text("用户名已存在")
                        $("#userNameMsg").attr("class", "cuo")
                    }
                }
            })
        })

        //密码验证
        $("#password").blur(function () {
            $("#rePassword").val("")
            $("#rePasswordMsg").text("与密码不符")
            $("#rePasswordMsg").attr("class", "cuo")
            var password = $(this).val();
            var partten = /^(?=.*[a-zA-z])(?=.*[\d])(?=.*[\W])[a-zA-Z\d\W]{6,16}$/
            if (partten.test(password)) {
                $("#passwordMsg").text("密码正确")
                $("#passwordMsg").attr("class", "dui")
            } else {
                $("#passwordMsg").text("密码由6-16的字母、数字、符号组成")
                $("#passwordMsg").attr("class", "cuo")
            }
        })


        //确认密码验证
        $("#rePassword").blur(function () {
            var repassword = $(this).val();
            if (repassword == $("#password").val()) {
                $("#rePasswordMsg").text("密码一致")
                $("#rePasswordMsg").attr("class", "dui")
            } else {
                $("#rePasswordMsg").text("与密码不符")
                $("#rePasswordMsg").attr("class", "cuo")
            }

        })


        //手机号验证
        $("#phone").blur(function () {
            var pattern = /^1[3-9][\d]{9}$/
            console.log(pattern.test($(this).val()))
            if (pattern.test($(this).val())) {
                $("#phoneMsg").val("手机号正确")
                $("#phoneMsg").attr("class", "dui")
            } else {
                $("#phoneMsg").val("号码有误")
                $("#phoneMsg").attr("class", "cuo")
            }
        })


        //是否阅读协议
        $("#hobby").click(function () {
            if ($(this).is(":checked")) { //jQuery方式判断
                document.querySelector("#register").type = "submit"
                $("#register").attr("class", "psw-btn")
            } else {
                document.querySelector("#register").type = "button"
                $("#register").attr("class", "psw-btn1")
            }

        })
        //提交表单验证
        $("form").submit(function () {
            var flag = true
            $("[name='msg']").each(function () {
                if ($(this).attr("class") == "cuo") {
                    flag = false
                    return false;
                }
            })
            return flag;

        })
        //图形验证码
        $("#changeImg").click(function(){
            $("#validateCode").attr("src","${pageContext.request.contextPath}/validate/getImg")
        })

        //验证验证码
        $("#validate").blur(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/validate/checkValidate",
                data:{
                    userCode:$(this).val()
                },
                success:function(data){
                    if(data=="ok"){
                        $("#validateMsg").attr("class","dui");
                        $("#validateMsg").html("验证码正确");
                    }else{
                        $("#validateMsg").attr("class","cuo");
                        $("#validateMsg").html("验证码错误");
                    }
                }
            })

        })



    })
</script>
<body>

<!--header-->
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            Hi!您好，欢迎来到宅客微购，请登录 <a href="注册.html">【免费注册】</a>
        </p>
        <p class="hd-p2 f-r">
            <a href="index.jsp">返回首页 (个人中心)</a><span>|</span>
            <a href="购物车.html">我的购物车</a><span>|</span>
            <a href="我的订单.html">我的订单</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>

<!--logo search weweima-->
<div class="logo-search w1200">
    <div class="logo-box f-l">
        <div class="logo f-l">
            <a href="index.jsp" title="中林logo"><img src="${pageContext.request.contextPath}/images/zl2-01.gif"/></a>
        </div>
        <div class="shangjia f-l">
            <a href="JavaScript:;" class="shangjia-a1">[ 切换城市 ]</a>
            <a href="JavaScript:;" class="shangjia-a2">商家入口</a>
            <div class="select-city">
                <div class="sl-city-top">
                    <p class="f-l">切换城市</p>
                    <a class="close-select-city f-r" href="JavaScript:;">
                        <img src="${pageContext.request.contextPath}/images/close-select-city.gif"/>
                    </a>
                </div>
                <div class="sl-city-con">
                    <p>西北</p>
                    <dl>
                        <dt>重庆市</dt>
                        <dd>
                            <a href="JavaScript:;">长寿区</a>
                            <a href="JavaScript:;">巴南区</a>
                            <a href="JavaScript:;">南岸区</a>
                            <a href="JavaScript:;">九龙坡区</a>
                            <a href="JavaScript:;">沙坪坝区</a>
                            <a href="JavaScript:;">北碚</a>
                            <a href="JavaScript:;">江北区</a>
                            <a href="JavaScript:;">渝北区</a>
                            <a href="JavaScript:;">大渡口区</a>
                            <a href="JavaScript:;">渝中区</a>
                            <a href="JavaScript:;">万州</a>
                            <a href="JavaScript:;">武隆</a>
                            <a href="JavaScript:;">晏家</a>
                            <a href="JavaScript:;">长寿湖</a>
                            <a href="JavaScript:;">云集</a>
                            <a href="JavaScript:;">华中</a>
                            <a href="JavaScript:;">林封</a>
                            <a href="JavaScript:;">双龙</a>
                            <a href="JavaScript:;">石回</a>
                            <a href="JavaScript:;">龙凤呈祥</a>
                            <a href="JavaScript:;">朝天门</a>
                            <a href="JavaScript:;">中华</a>
                            <a href="JavaScript:;">玉溪</a>
                            <a href="JavaScript:;">云烟</a>
                            <a href="JavaScript:;">红塔山</a>
                            <a href="JavaScript:;">真龙</a>
                            <a href="JavaScript:;">天子</a>
                            <a href="JavaScript:;">娇子</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>新疆</dt>
                        <dd>
                            <a href="JavaScript:;">齐乌鲁木</a>
                            <a href="JavaScript:;">昌吉</a>
                            <a href="JavaScript:;">巴音</a>
                            <a href="JavaScript:;">郭楞</a>
                            <a href="JavaScript:;">伊犁</a>
                            <a href="JavaScript:;">阿克苏</a>
                            <a href="JavaScript:;">喀什</a>
                            <a href="JavaScript:;">哈密</a>
                            <a href="JavaScript:;">克拉玛依</a>
                            <a href="JavaScript:;">博尔塔拉</a>
                            <a href="JavaScript:;">吐鲁番</a>
                            <a href="JavaScript:;">和田</a>
                            <a href="JavaScript:;">石河子</a>
                            <a href="JavaScript:;">克孜勒苏</a>
                            <a href="JavaScript:;">阿拉尔</a>
                            <a href="JavaScript:;">五家渠</a>
                            <a href="JavaScript:;">图木舒克</a>
                            <a href="JavaScript:;">库尔勒</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>甘肃</dt>
                        <dd>
                            <a href="JavaScript:;">兰州</a>
                            <a href="JavaScript:;">天水</a>
                            <a href="JavaScript:;">巴音</a>
                            <a href="JavaScript:;">白银</a>
                            <a href="JavaScript:;">庆阳</a>
                            <a href="JavaScript:;">平凉</a>
                            <a href="JavaScript:;">酒泉</a>
                            <a href="JavaScript:;">张掖</a>
                            <a href="JavaScript:;">武威</a>
                            <a href="JavaScript:;">定西</a>
                            <a href="JavaScript:;">金昌</a>
                            <a href="JavaScript:;">陇南</a>
                            <a href="JavaScript:;">临夏</a>
                            <a href="JavaScript:;">嘉峪关</a>
                            <a href="JavaScript:;">甘南</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>宁夏</dt>
                        <dd>
                            <a href="JavaScript:;">银川</a>
                            <a href="JavaScript:;">吴忠</a>
                            <a href="JavaScript:;">石嘴山</a>
                            <a href="JavaScript:;">中卫</a>
                            <a href="JavaScript:;">固原</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>青海</dt>
                        <dd>
                            <a href="JavaScript:;">西宁</a>
                            <a href="JavaScript:;">海西</a>
                            <a href="JavaScript:;">海北</a>
                            <a href="JavaScript:;">果洛</a>
                            <a href="JavaScript:;">海东</a>
                            <a href="JavaScript:;">黄南</a>
                            <a href="JavaScript:;">玉树</a>
                            <a href="JavaScript:;">海南</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="erweima f-r">
        <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-04.gif"/></a>
    </div>
    <div class="search f-r">
        <div class="search-info">
            <input type="text" placeholder="请输入商品名称"/>
            <button>搜索</button>
            <div style="clear:both;"></div>
        </div>
        <ul class="search-ul">
            <li><a href="JavaScript:;">绿豆</a></li>
            <li><a href="JavaScript:;">大米</a></li>
            <li><a href="JavaScript:;">驱蚊</a></li>
            <li><a href="JavaScript:;">洗面奶</a></li>
            <li><a href="JavaScript:;">格力空调</a></li>
            <li><a href="JavaScript:;">洗发</a></li>
            <li><a href="JavaScript:;">护发</a></li>
            <li><a href="JavaScript:;">葡萄</a></li>
            <li><a href="JavaScript:;">脉动</a></li>
            <li><a href="JavaScript:;">海鲜</a></li>
            <li><a href="JavaScript:;">水产</a></li>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div style="clear:both;"></div>
</div>

<!--内容开始-->
<form action="doRegister" method="post">
    <div class="password-con registered">
        <div class="psw">
            <p class="psw-p1">用户名</p>
            <input type="text" placeholder="请输入用户名" name="username" id="userName" value="${username}" required/>
            <span id="userNameMsg" class="cuo" name="msg">
                <c:if test="${errorMap['username']!=null}">
                    用户名错误
                </c:if>
                 <c:if test="${errorMap['username']==null}">
                     用户名不能重复
                 </c:if>
            </span>
        </div>
        <div class="psw">
            <p class="psw-p1">输入密码</p>
            <input type="text" placeholder="请输入密码" name="password" id="password" value="${password}" required/>
            <c:if test="${errorMap['password']!=null}">
                <span class="cuo" id="passwordMsg" name="msg">密码错误</span>
            </c:if>
            <c:if test="${errorMap['password']==null}">
                <span class="cuo" id="passwordMsg" name="msg">密码由6-16的字母、数字、符号组成</span>
            </c:if>
        </div>
        <div class="psw">
            <p class="psw-p1">确认密码</p>
            <input type="text" placeholder="请再次确认密码" name="rePassword" id="rePassword" value="${rePassword}" required/>
            <c:if test="${errorMap['rePassword']!=null}">
                <span class="cuo" id="rePasswordMsg" name="msg">确认密码错误</span>
            </c:if>
            <c:if test="${errorMap['rePassword']==null}">
                <span class="cuo" id="rePasswordMsg" name="msg">密码由6-16的字母、数字、符号组成</span>
            </c:if>
        </div>
        <div class="psw psw2">
            <p class="psw-p1">手机号</p>
            <input type="text" placeholder="请输入手机号" name="phone" value="${phone}" id="phone" required/>
            <c:if test="${errorMap['phone']!=null}">
                <span class="cuo" id="phoneMsg" name="msg">手机号错误</span>
            </c:if>
            <c:if test="${errorMap['phone']==null}">
                <span class="cuo" id="phoneMsg" name="msg">手机号为11位数字</span>
            </c:if>
        </div>

        <div class="psw psw3">
            <p class="psw-p1">验证码</p>
            <input type="text" placeholder="请输入验证码" name="validate" id="validate" required/>
            <c:if test="${errorMap['validate']!=null}">
                <span class="cuo" id="phoneMsg" name="msg">验证码错误</span>
            </c:if>
            <c:if test="${errorMap['validate']==null}">
                <span class="" id="validateMsg" name="msg"></span>
            </c:if>

        </div>
        <div class="yanzhentu">
            <div class="yz-tu f-l">
                <img id="validateCode" src="${pageContext.request.contextPath}/validate/getImg"/>
            </div>
            <p class="f-l">看不清？<a href="javaScript:;" id="changeImg">换张图</a></p>
            <div style="clear:both;"></div>
        </div>
        <div class="agreement">
            <input type="checkbox" name="hobby" id="hobby"></input>
            <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
        </div>
        <input type="button" class="psw-btn1" id="register" value="立即注册">
        <p class="sign-in">已有账号？请<a href="#">登录</a></p>
    </div>
</form>
<!--底部一块-->
<div class="footer-box">
    <ul class="footer-info1 w1200">
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-86.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">号码保障</a></h3>
            <P>所有会员，手机短信验证</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-87.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">6*12小时客服</a></h3>
            <P>有任何问题随时免费资讯</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-88.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">专业专攻</a></h3>
            <P>我们只专注于建筑行业的信息服务</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-89.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">注册有礼</a></h3>
            <P>随时随地注册有大礼包</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-90.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">值得信赖</a></h3>
            <P>专业的产品，专业的团队</P>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div class="footer-info2 w1200">
        <div class="ft-if2-left f-l">
            <dl>
                <dt><a href="6-1服务协议.html">新手上路</a></dt>
                <dd>
                    <a href="6-1服务协议.html">购物流程</a>
                    <a href="6-1服务协议.html">在线支付</a>
                    <a href="6-1服务协议.html">投诉与建议</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">配送方式</a></dt>
                <dd>
                    <a href="6-1服务协议.html">货到付款区域</a>
                    <a href="6-1服务协议.html">配送费标准</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">购物指南</a></dt>
                <dd>
                    <a href="6-1服务协议.html">订购流程</a>
                    <a href="6-1服务协议.html">购物常见问题</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">售后服务</a></dt>
                <dd>
                    <a href="6-1服务协议.html">售后服务保障</a>
                    <a href="6-1服务协议.html">退换货政策总则</a>
                    <a href="6-1服务协议.html">自营商品退换细则</a>
                </dd>
            </dl>
            <div style="clear:both;"></div>
        </div>
        <div class="ft-if2-right f-r">
            <h3>400-2298-223</h3>
            <p>周一至周日 9:00-24:00</p>
            <p>（仅收市话费）</p>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="footer-info3 w1200">
        <p>
            <a href="#">免责条款</a><span>|</span>
            <a href="#">隐私保护</a><span>|</span>
            <a href="#">咨询热点</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">公司简介</a>
        </p>
        <p>
            <a href="#">沪ICP备13044278号</a><span>|</span>
            <a href="#">合字B1.B2-20130004</a><span>|</span>
            <a href="#">营业执照</a><span>|</span>
            <a href="#">互联网药品信息服务资格证</a><span>|</span>
            <a href="#">互联网药品交易服务资格证</a>
        </p>
        <div class="ft-if3-tu1">
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-91.gif"/></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-92.gif"/></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-93.gif"/></a>
        </div>
    </div>
</div>

</body>
</html>
