<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.easybuy.util.PageSuppore" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
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
	<div class="help">
		<a href="index.jsp">返回前台页面</a>
	</div>
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
		<h2>留言管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th style="font-size: 14px">编号</th>
					<th style="font-size: 14px">昵称</th>
					<th style="font-size: 14px">留言的内容</th>
					<th style="font-size: 14px">留言时间</th>
					<th style="font-size: 14px">回复内容</th>
					<th style="font-size: 14px">回复时间</th>
					<th style="font-size: 14px">操作</th>
				</tr>
				<%//分页查询
					// 当前页码
					String currentPage = request.getParameter("pageNo");
					if(currentPage == null){
						//用户首次访问
						currentPage="1";
					}
					int pageNo =Integer.parseInt(currentPage);
					ServiceMassageDao service = new ServiceMassageDaoImpl();
					int totalCount = service.totalCount();
					//每页显示的商品数量 ，页容量
					int pageSize = 5;
					//获取总页数
					PageSuppore pageSuppore = new PageSuppore();
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
					List<EasyBuyComment> lists = service.commodityListById(pageNo,pageSize);
					// System.out.println(lists.size());
					for(EasyBuyComment con : lists) {
				%>
				<tr>
					<td style="font-size: 12px"><%=con.getEcId()%></td>
					<td style="font-size: 12px"><%=con.getEcNickName()%></td>
					<td style="font-size: 12px"><%=con.getEcContent()%></td>
					<td style="font-size: 12px"><%=con.getEcCreateTime()%></td>
					<td style="font-size: 12px"><%=con.getEcReply()%></td>
					<td style="font-size: 12px"><%=con.getEcReplyTime()%></td>
					<td style="font-size: 12px">
						<a href="guestbook-selectid.jsp?ecId=<%=con.getEcId()%>">&nbsp;回复&nbsp;</a><a href="guestt-book-del.jsp?ecId=<%=con.getEcId()%>">删除</a>
					</td>
				</tr>
				<%}%>
				<script>
					$(document).ready(function(){
						$("a").bind("click",function(){
							alert("确定执行此项操作？");
						});
					});
				</script>
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
			<li><a href="guestbook.jsp?pageNo = 1">首页</a></li>
			<li><a href="guestbook.jsp?pageNo=<%=pageNo-1%>">上一页</a></li>
			<%} if(pageNo<totalPage){%>
			<li><a href="guestbook.jsp?pageNo=<%=pageNo+1%>">下一页</a></li>
			<li><a href="guestbook.jsp?pageNo=<%=totalPage %>">尾页</a></li>
			<%} %>
		</ul>
	</div>
	<div id="footer">
		Copyright &copy; 2010 北大青鸟 All Rights Reserved. 京ICP证1000001号
	</div>
</div>
</body>
</html>
