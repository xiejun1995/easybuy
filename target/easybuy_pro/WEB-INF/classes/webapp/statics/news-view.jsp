<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDao" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyNews" %><%--
  Created by IntelliJ IDEA.
  User: 29246
  Date: 2019/12/27
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%
    String id1 = request.getParameter("id");
    int id = Integer.parseInt(id1);
    ServiceNewsDao serviceNewsDao = new ServiceNewsDaoImpl();
    EasyBuyNews easyBuynews = serviceNewsDao.getProdusById(id);
%>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help">
        <c:if test="${sessionScope.userName==null}">
            <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${sessionScope.userName!=null}">
            <span>欢迎您:${userName}</span>
            <a class="button" id="logout" href="${pageContext.request.contextPath}/servlet/invalidate">注销</a>
        </c:if>
        <a href="shopping.jsp" class="shopping">购物车X件</a>
        <a href="guestbook.jsp">留言</a>
    </div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="#">首页</a></li>
            <li><a href="#">图书</a></li>
            <li><a href="#">百货</a></li>
            <li><a href="#">品牌</a></li>
            <li><a href="#">促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li class="first"><a href="#">音乐</a></li>
            <li><a href="#">影视</a></li>
            <li><a href="#">少儿</a></li>
            <li><a href="#">动漫</a></li>
            <li><a href="#">小说</a></li>
            <li><a href="#">外语</a></li>
            <li><a href="#">数码相机</a></li>
            <li><a href="#">笔记本</a></li>
            <li><a href="#">羽绒服</a></li>
            <li><a href="#">秋冬靴</a></li>
            <li><a href="#">运动鞋</a></li>
            <li><a href="#">美容护肤</a></li>
            <li><a href="#">家纺用品</a></li>
            <li><a href="#">婴幼奶粉</a></li>
            <li><a href="#">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：<a href="../index.jsp">易买网</a> &gt; 阅读新闻
</div>
<div id="main" class="wrap">
    <div class="lefter">
        <div class="box">
            <h2>商品分类</h2>
            <dl>
                <dt>图书音像</dt>
                <dd><a href="product-list.jsp">图书</a></dd>
                <dd><a href="product-list.jsp">音乐</a></dd>
                <dt>百货</dt>
                <dd><a href="product-list.jsp">运动健康</a></dd>
                <dd><a href="product-list.jsp">服装</a></dd>
                <dd><a href="product-list.jsp">家居</a></dd>
                <dd><a href="product-list.jsp">美妆</a></dd>
                <dd><a href="product-list.jsp">母婴</a></dd>
                <dd><a href="product-list.jsp">食品</a></dd>
                <dd><a href="product-list.jsp">手机数码</a></dd>
                <dd><a href="product-list.jsp">家具首饰</a></dd>
                <dd><a href="product-list.jsp">手表饰品</a></dd>
                <dd><a href="product-list.jsp">鞋包</a></dd>
                <dd><a href="product-list.jsp">家电</a></dd>
                <dd><a href="product-list.jsp">电脑办公</a></dd>
                <dd><a href="product-list.jsp">玩具文具</a></dd>
                <dd><a href="product-list.jsp">汽车用品</a></dd>
            </dl>
        </div>
    </div>
</div>
<div id="news" class="right-main">
    <h1><%=easyBuynews.getEnTitle()%></h1>
    <div class="content">
        <%= easyBuynews.getEnContent()%>
    </div>
</div>
<div class=easyBuynews"clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
