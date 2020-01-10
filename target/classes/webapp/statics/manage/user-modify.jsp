<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.easybuy.service.user.ServiceUserDao" %>
<%@ page import="com.easybuy.service.user.ServiceUserDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyUser" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/My97DatePicker/WdatePicker.js"></script>
<html>
<head>
	<title>后台管理 - 易买网</title>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="${pageContext.request.contextPath}/statics/images/logo.gif" /></div>
	<div class="help"><a href="${pageContext.request.contextPath}/index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li class="current"><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="order.jsp">订单</a></li>
			<li><a href="guestbook.jsp">留言</a></li>
			<li><a href="news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
</div>
<%--获取当前时间--%>
<%
	Date data = new Date();
	SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = time.format(data);
%>
<div id="childNav">
	<div class="welcome wrap">
		管理员您好，当前时间：<%=now %>，欢迎回到管理后台。
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
				<dd><em><a href="user-add.jsp">新增</a></em><a href="user.jsp">用户管理</a></dd>
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
	<%
		EasyBuyUser easyBuyuser = new EasyBuyUser();
		ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
		int id = Integer.parseInt(request.getParameter("id"));
		easyBuyuser = serviceUserDao.getUser(id);

	%>
	<div class="main">
		<h2>修改用户</h2>
		<div class="manage">
			<form method="post" action="${pageContext.request.contextPath}/servlet/updateuser">
				<table class="form">
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input type="text" class="text" name="userName" value="<%=easyBuyuser.getUserId()%>" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">真实姓名(*)：</td>
						<td><input type="text" class="text" name="name" value="<%=easyBuyuser.getUserName()%>" /></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input type="text" class="text" name="passWord" value="<%=easyBuyuser.getPassWords()%>" /></td>
					</tr>
                    <tr>
						<td class="field">确认密码(*)：</td>
						<td><input type="text" class="text" name="passWord" value="<%=easyBuyuser.getPassWords()%>" /></td>
					</tr>
					<tr>
						<td class="field">性别(*)：</td>
						<td><input type="radio" name="sex" value="男" checked="checked" />男 <input type="radio" name="sex" value="女" />女</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td><input id="birthday" class="text" type="text" name="birthday" /><span></span></td>
					</tr>
					<tr>
						<td class="field">手机(*)：</td>
						<td><input type="text" class="text" name="mobile" value="<%=easyBuyuser.getMobile()%>" /></td>
					</tr>
					<tr>
						<td class="field">地址(*)：</td>
						<td><input type="text" class="text" name="address" value="<%=easyBuyuser.getAddress()%>" /></td>
					</tr>					
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
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