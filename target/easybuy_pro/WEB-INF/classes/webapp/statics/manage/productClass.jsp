<%@ page import="com.easybuy.util.PageSupport" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
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
	<div class="help"><a href="../../index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user.jsp">用户</a></li>
			<li class="current"><a href="product.jsp">商品</a></li>
			<li><a href="order.jsp">订单</a></li>
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
		<h2>分类管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>编号</th>
					<th>分类名称</th>
					<th>操作</th>
				</tr>
				<%
					ClassifyService service=new ClassifyServiceImpl();
					String index=request.getParameter("pageIndex");
					if (index==null){
						index="1";
					}
					//当前页码
					int pageIndex=Integer.parseInt(index);
					//页面容量
					int pageSize=6;
					//总条数
					int totalCount=service.totalCount();
					PageSupport pageSupport=new PageSupport();
					pageSupport.setPageNo(pageIndex);
					pageSupport.setPageSize(pageSize);
					pageSupport.setTotalCount(totalCount);
					//获取总页数
					int totalPage=pageSupport.getTotalPageCount();
					List<Classify> list=service.Classifylist(pageIndex,pageSize);
					/*out.print(list.size());*/

					for (Classify clfy:list) {
						if (clfy.getEpcParentId()==0) {
				%>
				<tr>
					<td class="first w4 c"><%=clfy.getEpcId()%></td>
					<td><%=clfy.getEpcName()%></td>
					<td class="w1 c"><a href="productClass-selectid.jsp?id=<%=clfy.getEpcId()%>">修改</a> <a class="manageDel" href="javascript:del(<%=clfy.getEpcId()%>)">删除</a></td>
				</tr>
				<%
					}else{
				%>
				<tr>
					<td class="first w4 c"><%=clfy.getEpcId()%></td>
					<td class="childClass"><%=clfy.getEpcName()%></td>
					<td class="w1 c"><a href="productClass-selectid.jsp?id=<%=clfy.getEpcId()%>">修改</a> <a href="javascript:del(<%=clfy.getEpcId()%>)">删除</a></td>
				</tr>
				<%--<tr>
					<td class="first w4 c">1</td>
					<td class="childClass">小类</td>
					<td class="w1 c"><a href="productClass-modify.jsp">修改</a> <a class="manageDel" href="javascript:void(0)">删除</a></td>
				</tr>
				<tr>
					<td class="first w4 c">1</td>
					<td>大类</td>
					<td class="w1 c"><a href="productClass-modify.jsp">修改</a> <a class="manageDel" href="javascript:void(0)">删除</a></td>
				</tr>
				<tr>
					<td class="first w4 c">1</td>
					<td class="childClass">小类</td>
					<td class="w1 c"><a href="productClass-modify.jsp">修改</a> <a class="manageDel" href="javascript:void(0)">删除</a></td>
				</tr>
				<tr>
					<td class="first w4 c">1</td>
					<td class="childClass">小类</td>
					<td class="w1 c"><a href="productClass-modify.jsp">修改</a> <a class="manageDel" href="javascript:void(0)">删除</a></td>
				</tr>--%>
				<%
						}
					}
				%>
			</table>
		</div>
	</div>
	<div class="clear"></div>
	<div class="pager">
		<ul class="clearfix">
			<li>共有<%=totalCount%>条记录，当前<%=pageIndex%>/<%=totalPage%>页</li>
			<li><a href="productClass.jsp?pageIndex=1">首页</a></li>
			<% for (int i=0;i<totalPage;i++){
			%>
			<li class="current"><a href="productClass.jsp?pageIndex=<%=i+1%>"><%=i+1%></a></li>
			<%}%>
			<li>...</li>
			<li><a href="productClass.jsp?pageIndex=<%=totalPage%>">尾页</a></li>
		</ul>
	</div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
<script>
	function del(id) {
		if (confirm("确定删除吗?")){
			window.location="productClass-delete.jsp?id="+id;
		}
	}
</script>
</body>
</html>
