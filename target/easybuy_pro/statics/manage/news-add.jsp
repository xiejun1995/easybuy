<%@ page import="com.easybuy.pojo.EasyBuyNews" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDao" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../scripts/function.js"></script>

<head>
	<title>后台管理 - 易买网</title>
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="order.jsp">订单</a></li>
			<li><a href="guestbook.jsp">留言</a></li>
			<li class="current"><a href="news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员pillys您好，今天是2012-12-21，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><a href="user.jsp">用户管理</a></dd>
				<dt>商品信息</dt>
				<dd><em><a href="productClass-add.jsp">新增</a></em><a href="productClass.jsp">分类管理</a></dd>
				<dd><em><a href="product-add.jsp">新增</a></em><a href="product.jsp">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="order.jsp">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.jsp">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>添加新闻</h2>
			<form id="newsAdd" action="manage-result.jsp">
				<table class="form">
					<%
						EasyBuyNews easyBuyNews = new EasyBuyNews();
						ServiceNewsDao serviceNewsDao = new ServiceNewsDaoImpl();
						int id = Integer.parseInt(request.getParameter("id"));
						easyBuyNews = serviceNewsDao.getProdusById(id);

					%>
					<tr>
					<td class="field">编号：</td>
					<td><input class="text" type="text" name="id"  value="<%=easyBuyNews.getEnId()%>"/></td>
				</tr>
					<tr>
						<td class="field">标题：</td>
						<td><input type="text" class="text" name="title" value="<%=easyBuyNews.getEnTitle()%>" /></td>
					</tr>

					<tr>
						<td class="field">内容：</td>
						<td><input class="text" type="text" name="content"  value="<%=easyBuyNews.getEnContent()%>"/></td>
					</tr>
					<tr>
						<td class="field">时间：</td>
						<td><input class="text" type="date" name="time"  value="<%=easyBuyNews.getEnCreateTime()%>"/></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加新闻" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
