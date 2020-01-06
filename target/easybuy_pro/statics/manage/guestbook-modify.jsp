<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>后台管理 - 易买网</title>
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../../index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="order.jsp">订单</a></li>
			<li class="current"><a href="guestbook.jsp">留言</a></li>
			<li><a href="news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
<%--获取当前时间--%>
<%
	Date data = new Date();
	SimpleDateFormat times = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = times.format(data);
%>
<div id="childNav">
	<div class="welcome wrap">
		管理员master您好，当前时间：<%=now %>，欢迎回到管理后台。
	</div>
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
		<h2>回复留言</h2>
		<div class="manage">
			<form action="guest-book-do-update.jsp">
				<table>
					<tr>
						<td class="field">Id：</td>
						<td><input class="text" type="text" name="Id"  value="${requestScope.comm.ec_id}"/></td>
					</tr>
					<tr>
						<td class="field">昵称：</td>
						<td><input class="text" type="text" name="guestName"  value="${requestScope.comm.ec_nick_name}"/></td>
					</tr>

					<tr>
						<td class="field">回复内容：</td>
						<td><input class="text" type="text" name="guestReply"  value="${requestScope.comm.ec_reply}"/></td>
					</tr>
					<tr>
						<td class="field">回复时间：</td>
						<td><input class="text" type="date" name="replyTime"  value="${requestScope.comm.ec_reply_time}"/></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="提交留言" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
