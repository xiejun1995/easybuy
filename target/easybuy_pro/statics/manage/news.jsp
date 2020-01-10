
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDao" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDaoImpl" %>
<%@ page import="cn.kgc.easybuy.pojo.PageSupport" %>
<%@ page import="com.easybuy.pojo.EasyBuyNews" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../scripts/function.js"></script>
<html>
<head>
	<title>后台管理 - 易买网</title>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../index.jsp">返回前台页面</a>  </div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单</a></li>
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
				<dd><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.jsp">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>新闻管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>编号</th>
					<th>标题</th>
					<th>内容</th>
					<th>时间</th>
				</tr>
				<%//分页查询
					// 当前页码
					String currentPage = request.getParameter("pageNo");
					if(currentPage == null){
						//用户首次访问
						currentPage="1";
					}
					int pageNo =Integer.parseInt(currentPage);
					ServiceNewsDao service = new ServiceNewsDaoImpl();
					int totalCount = service.totalCount();
					//每页显示的商品数量 ，页容量
					int pageSize = 5;
					//获取总页数
					PageSupport pageSuppore = new PageSupport();
					pageSuppore.setCurrentPageNo(pageNo);   //设置当前页
					pageSuppore.setPageSize(pageSize);		//设置页容量
					pageSuppore.setTotalPageCount(totalCount);	//计算总页数
					//获得总页数
					int totalPage = pageSuppore.getTotalPageCount();
					//控制首页和尾页
					if(pageNo<1){
						pageNo = 1;
					}else if(pageNo>totalPage){
						pageNo=totalPage;
					}
					List<EasyBuyNews> lists = service.commodityList(pageNo,pageSize);
					// System.out.println(lists.size());
					for(EasyBuyNews con : lists) {
				%>
				<tr>
					<td><%=con.getEnId()%></td>
					<td><%=con.getEnTitle()%></td>
					<td><%=con.getEnContent()%></td>
					<td><%=con.getEnCreateTime()%></td>
					<td>
						<a href="news-modify.jsp?en_id=<%=con.getEnId()%>">&nbsp;修改&nbsp;</a><a href="news-del.jsp?en_id=<%=con.getEnId()%>">删除</a>
					</td>
				</tr>
				<%}%>
				<div class="clear"></div>
			</table>
		</div>
		<div class="clear"></div>
	</div>
	<div class="pager">
		<ul class="clearfix">
			<%
				if(pageNo>1){
			%>
			<li><a href="news.jsp?pageNo = 1">首页</a></li>
			<li><a href="news.jsp?pageNo=<%=pageNo-1%>">上一页</a></li>
			<%} if(pageNo<totalPage){%>
			<li><a href="news.jsp?pageNo=<%=pageNo+1%>">下一页</a></li>
			<li><a href="news.jsp?pageNo=<%=totalPage %>">尾页</a></li>
			<%} %>
		</ul>
	</div>
	<div id="footer">
		Copyright &copy; 2010 北大青鸟 All Rights Reserved. 京ICP证1000001号
	</div>
</div>
</body>
</html>