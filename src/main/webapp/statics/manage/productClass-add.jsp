<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
		<h2>添加分类</h2>
		<div class="manage">
			<form action="productClass-do-add.jsp">
				<table class="form">
					<tr>
						<td class="field">父分类：</td>
						<td>
							<select name="parentId">
								<option value="0" selected="selected">请选择根栏目</option>
								<%
									ClassifyService service=new ClassifyServiceImpl();
									List<Classify> list=service.ClassifyFid();
									int i=0;
									for (Classify clfy:list) {
										i++;
								%>
								<option value="<%=i%>"><%=clfy.getEpcName() %></option>
								<%--<option value="<%=i+%>">衣服</option>--%>
								<%}%>
							</select>

							<select style="width: 100px;" id="pre" onchange="chg(this);">
								<option value="-1">请选择</option>
							</select>
							<select style="width: 100px;" id="city" onchange="chg2(this)" ;></select>
							<select style="width: 100px;" id="area"></select>
						</td>
					</tr>
					<tr>
						<td class="field">分类名称：</td>
						<td><input type="text" class="text" name="className" /></td>
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
<script type="text/javascript">
	//声明省
	var pres = ["图书音像", "百货"]; //直接声明Array
	//声明市
	var cities = [
		["图书", "音乐"],
		["运动健康", "服装","家居","美妆","母婴","食品","手机数码","家具首饰","手表饰品","鞋包","家电","电脑办公","玩具文具","汽车用品","风衣"]
	];
	var areas = [
		[
			["玄幻", "言情", "都市"],
			["麻雀", "勇气", "理想三旬"]
		],
		[
			["生命在于运动的八大理由", "运动的十大作用", "运动助你更健康"],
			["", "", ""]
		]
	]
	//设置一个省的公共下标
	var pIndex = -1;
	var preEle = document.getElementById("pre");
	var cityEle = document.getElementById("city");
	var areaEle = document.getElementById("area");
	//先设置省的值
	for (var i = 0; i < pres.length; i++) {
		//声明option.<option value="pres[i]">Pres[i]</option>
		var op = new Option(pres[i], i);
		//添加
		preEle.options.add(op);
	}
	function chg(obj) {
		if (obj.value == -1) {
			cityEle.options.length = 0;
			areaEle.options.length = 0;
		}
		//获取值
		var val = obj.value;
		pIndex = obj.value;
		//获取ctiry
		var cs = cities[val];
		//获取默认区
		var as = areas[val][0];
		//先清空市
		cityEle.options.length = 0;
		areaEle.options.length = 0;
		for (var i = 0; i < cs.length; i++) {
			var op = new Option(cs[i], i);
			cityEle.options.add(op);
		}
		for (var i = 0; i < as.length; i++) {
			var op = new Option(as[i], i);
			areaEle.options.add(op);
		}
	}
	function chg2(obj) {
		var val = obj.selectedIndex;
		var as = areas[pIndex][val];
		areaEle.options.length = 0;
		for (var i = 0; i < as.length; i++) {
			var op = new Option(as[i], i);
			areaEle.options.add(op);
		}
	}
</script>
</body>
</html>
