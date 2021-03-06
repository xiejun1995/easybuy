<%@ page import="cn.kgc.easybuy.util.PageUtil" %>
<%@ page import="cn.kgc.easybuy.service.impl.OrderServiceImpl" %>
<%@ page import="cn.kgc.easybuy.util.Constants" %>
<%@ page import="cn.kgc.easybuy.service.OrderService" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>后台管理 - 易买网</title>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="${pageContext.request.contextPath}/statics/images/logo.gif" /></div>
	<div class="help"><a href="${pageContext.request.contextPath}/webapp/index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user.jsp">用户</a></li>
			<li><a href="product.jsp">商品</a></li>
			<li class="current"><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单</a></li>
			<li><a href="guestbook.jsp">留言</a></li>
			<li><a href="news.jsp">新闻</a></li>
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
				<dd><a href="${pageContext.request.contextPath}/statics/manage/orderList">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="guestbook.jsp">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">				
			</div>
			<div class="spacer"></div>
            <form id="orderForm">
                 订单号：<input type="text" class="text" name="entityId" id="entityId" placeholder="请输入订单号" type="number"/>
                 状态：<%--<input type="text" class="text" name="status" id="eoStatus" placeholder="请输入订单状态" />--%>
						<select type="text" class="text" name="status" id="eoStatus" placeholder="请输入订单状态">
							<option>待审核</option>
							<option>审核通过</option>
							<option>配货</option>
							<option>发货</option>
							<option>状态未知</option>
						</select>
                 电话：<input type="text" class="text" name="phone" id="phone" placeholder="请输入电话" pattern="[0-9]{11}"/>
				<label class="ui-blue"><input type="button" id="btn" name="btn" value="查询" /></label>
            </form>
			<table class="list" id="orderList" style="font-size: 14px">
				<%--遍历订单列表集合--%>
				<%--将遍历的订单嵌入到表格当中--%>
				<c:forEach items="${orderList}" var="order" varStatus="index" >
					<c:if test="${order.eoStatus!=5}">
						<tr>
							<th colspan="4" style="font-size: 14px; ">
								单号：${order.eoId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								订货人姓名：${order.eoUserName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								创建时间：<fmt:formatDate value="${order.eoCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
							</th>
							<th colspan="1" id="status" style="font-size: 14px; ">状态:
								<c:choose >
									<c:when test="${order.eoStatus==1}">
										<span><strong>待审核</strong></span>
									</c:when>
									<c:when test="${order.eoStatus==2}">
										<span><strong>审核通过</strong></span>
									</c:when>
									<c:when test="${order.eoStatus==3}">
										<span><strong>配货</strong></span>
									</c:when>
									<c:when test="${order.eoStatus==4}">
										<span><strong>发货</strong></span>
									</c:when>
									<c:otherwise>
										<span><strong>状态未知</strong></span>
									</c:otherwise>
								</c:choose>
							</th>
						</tr>
						<c:forEach items="${order.orderDetailList}" var="orderDetail" varStatus="index">
							<tr>
							<td class="first w4 c" style="font-size: 12px; ">
								<a href="${pageContext.request.contextPath}/statics/manage/product-careful.jsp?epId=${orderDetail.product.epId}">
									<img src="${pageContext.request.contextPath}/statics/images/product/${orderDetail.product.epFileName}" />
								</a>
								<a href="${pageContext.request.contextPath}/statics/manage/product-careful.jsp?epId=${orderDetail.product.epId}" >${orderDetail.product.epName}</a>
							</td>
							<td style="font-size: 12px; ">
									${orderDetail.product.epPrice}
							</td>
							<td style="font-size: 12px; ">
									${orderDetail.eodQuantity}
							</td >
							<td style="font-size: 12px; ">
								合计：${orderDetail.eodCost}
							</td>
							<c:if test="${index.first}">
								<td class="w1 c" rowspan="${order.orderDetailList.size()}" style="font-size: 12px; ">
									总计：${order.eoCost}
								</td>
							</c:if>
						</c:forEach>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div class="pager">
				<ul class="clearfix" id="list">
					<c:if test="${totalPage>0}">
						<li><a href="${pageContext.request.contextPath}/statics/manage/orderList?currentPage=1">首页</a></li>
					</c:if>
					<c:if test="${currentPage>1&&totalPage>1}">
						<li><a href="${pageContext.request.contextPath}/statics/manage/orderList?currentPage=${currentPage-1}">上一页</a></li>
					</c:if>
					<c:if test="${currentPage<totalPage&&totalPage>1}">
						<li><a href="${pageContext.request.contextPath}/statics/manage/orderList?currentPage=${currentPage+1}">下一页</a></li>
					</c:if>
					<c:if test="${totalPage>1}">
						<li><a href="${pageContext.request.contextPath}/statics/manage/orderList?currentPage=${totalPage}">尾页</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/orderList.js"></script>
</body>
</html>
