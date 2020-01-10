<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/25
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>商品详情页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%
    String id = request.getParameter("epId");
    int id1=0;
    if(id != null && !id.equals("")){
         id1 = Integer.parseInt(id);
    }
    ServiceCommodityDao service = new ServiceCommodityDaoImpl();
    EasyBuyProduct product = service.getProdusById(id1);
    request.setAttribute("product",product);
    request.setAttribute("price",product.getEpPrice());
    request.setAttribute("epId",id1);
%>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help"><a href="shoppingCart" class="shopping">购物车X件</a><a href="login.jsp">登录</a><a href="register.jsp">注册</a><a href="guestbook.jsp">留言</a><a href="index.jsp">后台管理</a></div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="index.jsp?name=" +首页 >首页</a></li>
            <li><a href="product-list.jsp?name=" +图书>图书</a></li>
            <li><a href="product-list.jsp?name=" +百货>百货</a></li>
            <li><a href="product-list.jsp?name=" +品牌>品牌</a></li>
            <li><a href="product-list.jsp?name=" +促销>促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li class="first"><a href="product-list.jsp?name=" +音乐>音乐</a></li>
            <li><a href="product-list.jsp?name=" +影视>影视</a></li>
            <li><a href="product-list.jsp?name=" +少儿>少儿</a></li>
            <li><a href="product-list.jsp?name=" +动漫>动漫</a></li>
            <li><a href="product-list.jsp?name=" +小说>小说</a></li>
            <li><a href="product-list.jsp?name=" +外语>外语</a></li>
            <li><a href="product-list.jsp?name=" +数码相机>数码相机</a></li>
            <li><a href="product-list.jsp?name=" +笔记本>笔记本</a></li>
            <li><a href="product-list.jsp?name=" +羽绒服>羽绒服</a></li>
            <li><a href="product-list.jsp?name=" +秋冬靴>秋冬靴</a></li>
            <li><a href="product-list.jsp?name=" +运动鞋>运动鞋</a></li>
            <li><a href="product-list.jsp?name=" +美容护肤>美容护肤</a></li>
            <li><a href="product-list.jsp?name=" +家纺用品>家纺用品</a></li>
            <li><a href="product-list.jsp?name=" +婴幼奶粉>婴幼奶粉</a></li>
            <li><a href="product-list.jsp?name=" +饰品>饰品</a></li>
            <li class="last"><a href="product-list.jsp?name=" +Investor Relations>Investor Relations</a></li>
        </ul>
    </div>
</div>
<%
    String name = request.getParameter("name");
    if (name==null){
        name="图书";
    }
%>
%>

<div id="position" class="wrap">
    您现在的位置：<a href="index.jsp">易买网</a> &gt; <a href="product-list.jsp">商品</a> &gt;<%=name%>
</div>
<div id="main" class="wrap">
    <div class="lefter">
        <div class="box">
            <h2>商品分类</h2>
            <dl>
                <dt>图书音像</dt>
                <dd><a href="product-list.jsp?name=" +图书>图书</a></dd>
                <dd><a href="product-list.jsp?name=" +音乐>音乐</a></dd>
                <dt>百货</dt>
                <dd><a href="product-list.jsp?name=" +运动健康>运动健康</a></dd>
                <dd><a href="product-list.jsp?name=" +服装>服装</a></dd>
                <dd><a href="product-list.jsp?name=" +家居>家居</a></dd>
                <dd><a href="product-list.jsp?name=" +美妆>美妆</a></dd>
                <dd><a href="product-list.jsp?name=" +母婴>母婴</a></dd>
                <dd><a href="product-list.jsp?name=" +食品>食品</a></dd>
                <dd><a href="product-list.jsp?name=" +手机数码>手机数码</a></dd>
                <dd><a href="product-list.jsp?name=" +家具首饰>家具首饰</a></dd>
                <dd><a href="product-list.jsp?name=" +手表饰品>手表饰品</a></dd>
                <dd><a href="product-list.jsp?name=" +鞋包>鞋包</a></dd>
                <dd><a href="product-list.jsp?name=" +家电>家电</a></dd>
                <dd><a href="product-list.jsp?name=" +电脑办公>电脑办公</a></dd>
                <dd><a href="product-list.jsp?name=" +玩具文具>玩具文具</a></dd>
                <dd><a href="product-list.jsp?name=" +汽车用品>汽车用品</a></dd>
            </dl>
        </div>
    </div>
    <div id="product" class="main">
        <h1>${product.epName}</h1>
        <div class="infos">
            <div class="thumb"><img src="images/upload/${product.epFileName}" width="220" height="212" alt=""/></div>
            <div class="buy">
                商城价：<span class="price">￥${product.epPrice}</span><br />
                库　存：${product.epStock}
                <div class="button">
                    <input type="hidden" id="price" value="${price}" />

                   <%-- <input type="button" name="button" value="" onclick="proPrice();" />
                    <a href="${pageContext.request.contextPath}/statics/shopping?ep_id=<%=id%>">放入购物车 </a>--%>
                    <input type="button" name="button" value="购买" onclick="proPrice(${epId});" />
                    <input type="button" name="button" value="加入购物车" onclick="shoppingCart(${epId})" />
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="introduce">
            <h2><strong>商品详情</strong></h2>
            <div class="text">
                ${product.epDescription}<br />
                ......<br />
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
<script>
    function proPrice(epId){
        $.ajax({
            url:"getProduct",
            type:"GET",
            data:{"epId":epId},
            dataType:"Json",
            success:function (data) {
                if(data.product!=null && data.product!=undefined){
                    window.location.href="address.jsp?epId="+data.product.epId+"&price="+data.product.epPrice;
                }else{
                    alert(data.messeage);
                }
            },
            error:function () {
                alert("购买失败，请重试!");
            }
        });
    };
    function shoppingCart(epId){
        $.ajax({
            url:"addShoppingCart",
            type:"GET",
            data:{"epId":epId},
            dataType:"Json",
            success:function (data) {
                if(data.success!=null && data.success!=undefined){
                    alert(data.success);
                    window.location.href="${pageContext.request.contextPath}/statics/product-careful.jsp?epId="+epId;
                }else{
                    alert(data.messeage);
                }
            },
            error:function () {
                alert("购买失败，请重试!");
            }
        });
    };
</script>
</html>

