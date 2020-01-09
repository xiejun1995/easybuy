<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/webapp/statics/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webapp/statics/scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webapp/statics/scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="${pageContext.request.contextPath}/webapp/statics/images/logo.gif" /></div>
    <div class="help">
        <c:if test="${sessionScope.userName==null}">
            <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${sessionScope.userName!=null}">
            <span>欢迎您:${userName}</span>
            <a class="button" id="logout" href="${pageContext.request.contextPath}/servlet/invalidate">注销</a>
        </c:if>
        <a href="shopping.jsp" class="shopping">购物车X件</a>
        <a href="${pageContext.request.contextPath}/webapp/statics/guestbook.jsp">留言</a>
    </div>
    <div class="navbar">
        <ul class="clearfix">
            <ul class="clearfix">
                <li><a href="index.jsp?name=首页">首页</a></li>
                <li><a href="product-list.jsp?name=图书">图书</a></li>
                <li><a href="product-list.jsp?name=百货">百货</a></li>
                <li><a href="product-list.jsp?name=品牌">品牌</a></li>
                <li><a href="product-list.jsp?name=促销">促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li class="first">
                <a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=音乐">音乐</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=影视">影视</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=少儿">少儿</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=动漫">动漫</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=小说">小说</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=外语">外语</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=数码相机">数码相机</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=笔记本">笔记本</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=羽绒服">羽绒服</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=秋冬靴">秋冬靴</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=运动鞋">运动鞋</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=美容护肤">美容护肤</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=家纺用品">家纺用品</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=婴幼奶粉">婴幼奶粉</a></li>
            <li><a href="${pageContext.request.contextPath}/webapp/statics/product-list.jsp?name=饰品">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：<a href="${pageContext.request.contextPath}/webapp/index.jsp">易买网</a> &gt; 购物车
</div>
<div class="wrap">
    <div id="shopping">
        <div class="shadow">
            <em class="corner lb"></em>
            <em class="corner rt"></em>
            <div class="box">
                <div class="msg">
                    <p>恭喜您：购买成功！</p>
                    <p>正在返回到首页，请等待...</p>
                    <script type="text/javascript">
                        setTimeout("location.href='index.jsp'", 3000);
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html   >
