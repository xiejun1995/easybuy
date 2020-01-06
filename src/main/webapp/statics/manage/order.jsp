<%@ page import="cn.kgc.easybuy.util.PageUtil" %>
<%@ page import="cn.kgc.easybuy.service.impl.OrderServiceImpl" %>
<%@ page import="cn.kgc.easybuy.util.Constants" %>
<%@ page import="cn.kgc.easybuy.service.OrderService" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	float cost=0;
	request.setAttribute("cost",cost);
%>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/orderList.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>后台管理 - 易买网</title>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="${pageContext.request.contextPath}/statics/index.jsp">返回前台页面</a></div>
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
                 订单号：<input type="text" class="text" name="entityId" id="entityId" />
                 订货人：<input type="text" class="text" name="userName" id="userId"/>
				<label class="ui-blue"><input type="button" id="btn" name="btn" value="查询" /></label>
            </form>
			<table class="list" id="orderList">
				<%--遍历订单列表集合--%>
				<%--将遍历的订单嵌入到表格当中--%>
				<c:forEach items="${orderList}" var="order" varStatus="index">
					<tr>
						<th colspan="2">
							单号：${order.eo_id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							时间：<fmt:formatDate value="${order.eo_create_time}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</th>
						<th colspan="2">状态:
							<select name="status">
								<option value="1"  >待审核</option>
								<option value="2"  >审核通过</option>
								<option value="3"  >配货</option>
								<option value="4" >发货</option>
								<option value="5"  >收货确认</option>
							</select>
						</th>
					</tr>
						<c:forEach items="${order.orderDetailList}" var="orderDetail" varStatus="index">
							<tr>
								<td class="first w4 c">
									<img src="../images/product/${orderDetail.product.ep_file_name}" /><a href="${pageContext.request.contextPath}/statics/product-view.jsp?ep_id=${orderDetail.product.ep_id}" >${orderDetail.product.ep_name}</a>
								</td>
								<td >
										${orderDetail.product.ep_price}
								</td>
								<td>
										${orderDetail.eod_quantity}
								</td>
								<c:if test="${index.first}">
									<td class="w1 c" rowspan="${order.orderDetailList.size()}">
										总计：${order.eo_cost}
									</td>
								</c:if>
							</c:forEach>
						</tr>
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
<script type="text/javascript">
	//遍历select元素
	$("select").each(function (index,element) {
		var eo_status="${orderList[index]}";
		$(this).find("option[value = '"+eo_status+"']").attr("selected","selected");
	});
</script>
</body>
</html>
