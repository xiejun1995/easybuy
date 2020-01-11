<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../scripts/function.js"></script>
<html>
<head>
	<title>后台管理 - 易买网</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/statics/ckeditor/ckeditor.js"></script>
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
		<h2>修改商品</h2>
		<div class="manage">
			<%
				EasyBuyProduct buy=(EasyBuyProduct)request.getAttribute("comm");
				if (buy==null){
					buy=new EasyBuyProduct();
				}
			%>
			<form action="register-update.jsp" method="post" enctype="multipart/form-data">
				<table class="form">
					<tr>
						<td><input type="hidden" class="text" name="ep_id" value="<%=buy.getEpId()%>" /></td>
					</tr>
					<tr>
						<td class="field">商品名称(*)：</td>
						<td><input type="text" class="text" name="productName" value="<%=buy.getEpName()%>" /></td>
					</tr>
                    <tr>
						<td class="field">描述：</td>
						<td><textarea  class="ckeditor" name="productDetail"  cols="50" rows="10"><%=buy.getEpDescription()%></textarea></td>
					<%--
						<td><input type="text" class="text" name="productDetail" value="<%=buy.getEpDescription()%>" /></td>
--%>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							<select name="parentId">
								<option value="1">图书音像</option>
								<option value="3">├ 图书</option>
								<option value="4">└ 音乐</option>
								<option value="2">百货</option>
								<option value="5">├ 运动健康</option>
								<option value="6">├ 服装</option>
								<option value="7">├ 家居</option>
								<option value="8">├ 美妆</option>
								<option value="9">├ 母婴</option>
								<option value="10">├ 食品</option>
								<option value="11">├ 手机数码</option>
								<option value="12">├ 家具首饰</option>
								<option value="13">├ 手表饰品</option>
								<option value="14">├ 鞋包</option>
								<option value="15">├ 家电</option>
								<option value="16">├ 电脑办公</option>
								<option value="17">├ 玩具文具</option>
								<option value="18">└汽车用品</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品价格(*)：</td>
						<td><input type="text" class="text tiny" name="productPrice" value="<%=buy.getEpPrice()%>"/> 元</td>
					</tr>

					<tr>
						<td class="field">库存(*)：</td>
						<td><input type="text" class="text tiny" name="productNumber" value="<%=buy.getEpStock()%>"/></td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><img src="<%=request.getContextPath()%>/statics/images/upload/<%=buy.getEpFileName()%>"></td>
					</tr>
					<tr>
						<td class="field">修改商品图片：</td>
						<td><input type="file" class="text" name="photo"/></td>
					</tr>


					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="确定" /></label></td>
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
