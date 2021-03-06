<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.easybuy.service.user.ServiceUserDao" %>
<%@ page import="com.easybuy.service.user.ServiceUserDaoImpl" %>
<%@ page import="com.easybuy.util.PageSupport" %>
<%@ page import="com.easybuy.pojo.EasyBuyUser" %>

<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<div class="help"><a href="${pageContext.request.contextPath}/statics/index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li class="current"><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单</a></li>
			<li><a href="guestbook.jsp">留言</a></li>
			<li><a href="news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
<%
	Date data = new Date();
	SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = time.format(data);
%>

<div id="childNav">
	<div class="welcome wrap">
		管理员您好，今天是<%=now%>，欢迎回到管理后台。
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
				<dd><a href="../manage/user.jsp">用户管理</a></dd>
			  <dt>商品信息</dt>
				<dd><em><a href="productClass-add.jsp">新增</a></em><a href="productClass.jsp">分类管理</a></dd>
				<dd><em><a href="product-add.jsp">新增</a></em><a href="product.jsp">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.jsp">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<%
					ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();

					//当前页码
					String currentPage = request.getParameter("pageIndex");
					if (currentPage==null) {
						currentPage = "1";
					}
					int pageIndex = Integer.parseInt(currentPage);

					//获取用户总数量
					int totalCount = serviceUserDao.getTotalCount();

					//页面显示数量
					int pageSize = 10;

					//获取总页数
					PageSupport pageSupport = new PageSupport();
					pageSupport.setPageNo(pageIndex);
					pageSupport.setPageSize(pageSize);
					pageSupport.setTotalCount(totalCount);

					//总页数
					int totalPage = pageSupport.getTotalPageCount();

					//控制首页和尾页
					if (pageIndex < 1) {
						pageIndex = 1;
					} else if (pageIndex > totalPage) {
						pageIndex = totalPage;
					}
					List<EasyBuyUser> list = serviceUserDao.getPageUserList(pageIndex,pageSize);
					request.setAttribute("list",list);
					request.setAttribute("pageIndex",pageIndex);
					request.setAttribute("totalCount",totalCount);
					request.setAttribute("totalPage",totalPage);
				%>
				<tr>
					<th style="font-size: 14px">用户名</th>
					<th style="font-size: 14px">真实姓名</th>
					<th style="font-size: 14px">性别</th>
					<th style="font-size: 14px">Email</th>
					<th style="font-size: 14px">手机</th>
					<th style="font-size: 14px">操作</th>
				</tr>
				<c:forEach var="user" items="${list}">
					<tr>
						<td class="first w4 c" style="font-size: 12px">${user.userId}</td>
						<td class="w1 c" style="font-size: 12px">${user.userName}</td>
						<td class="w2 c" style="font-size: 12px">${user.sex}</td>
						<td style="text-align: center;font-size: 12px" >${user.email}</td>
						<td class="w4 c" style="font-size: 12px">${user.mobile}</td>
						<td class="w1 c">
							<a href="${pageContext.request.contextPath}/servlet/seekservlet?id=${user.userId}" style="font-size: 12px">修改</a>
							<a class="manageDel" href="${pageContext.request.contextPath}/servlet/deleteuser?id=${user.userId}" style="font-size: 12px">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
     <div class="pager">
				<ul class="clearfix">
					<li><a href="../manage/user.jsp?pageIndex=1" >首页</a></li>
					<c:if test="${pageIndex > 1}">
					<li><a href="../manage/user.jsp?pageIndex=${pageIndex-1}">上一页</a> </li>
					</c:if>
					<c:if test="${pageIndex < totalPage}">
                    <li><a href="../manage/user.jsp?pageIndex=${pageIndex+1}" >下一页</a> </li>
					</c:if>
					<li><a href="../manage/user.jsp?pageIndex=${totalPage}">尾页</a></li>
					<li>当前${pageIndex}页,共${totalPage}页,共${totalCount}条记录</li>
				</ul>
			</div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
