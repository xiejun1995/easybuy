<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
    <script type="text/javascript" src="js/address.js"></script>
</head>
<%
    //通过传递的参数获取商品编号和对应的价格
    Integer epId=null;
    if(request.getParameter("epId")!=null){
        epId=Integer.valueOf(request.getParameter("epId"));
    }
    Integer price=0;
    if(request.getParameter("price")!=null){
        price=Integer.valueOf(request.getParameter("price"));
    }
    request.setAttribute("amount",price);
%>
<%
    String id = request.getParameter("epId");
    int id1=0;
    if(id != null && !id.equals("")){
        id1 = Integer.parseInt(id);
    }
    ServiceCommodityDao service = new ServiceCommodityDaoImpl();
    EasyBuyProduct product = service.getProdusById(id1);
    request.setAttribute("product",product);
%>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help">
        <c:if test="${sessionScope.userName==null}">
            <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${sessionScope.userName!=null}">
            <span>欢迎您:${userName}</span>
            <a class="button" id="logout" href="${pageContext.request.contextPath}/servlet/invalidate">注销</a>
        </c:if>
        <a href="shopping.jsp" class="shopping">购物车X件</a>
        <a href="guestbook.jsp">留言</a>
    </div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current">
                <a href="#">首页</a></li>
            <li><a href="#">图书</a></li>
            <li><a href="#">百货</a></li>
            <li><a href="#">品牌</a></li>
            <li><a href="#">促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li class="first">
                <a href="product-list.jsp?name=音乐">音乐</a></li>
            <li><a href="product-list.jsp?name=影视">影视</a></li>
            <li><a href="product-list.jsp?name=少儿">少儿</a></li>
            <li><a href="product-list.jsp?name=动漫">动漫</a></li>
            <li><a href="product-list.jsp?name=小说">小说</a></li>
            <li><a href="product-list.jsp?name=外语">外语</a></li>
            <li><a href="product-list.jsp?name=数码相机">数码相机</a></li>
            <li><a href="product-list.jsp?name=笔记本">笔记本</a></li>
            <li><a href="product-list.jsp?name=羽绒服">羽绒服</a></li>
            <li><a href="product-list.jsp?name=秋冬靴">秋冬靴</a></li>
            <li><a href="product-list.jsp?name=运动鞋">运动鞋</a></li>
            <li><a href="product-list.jsp?name=美容护肤">美容护肤</a></li>
            <li><a href="product-list.jsp?name=家纺用品">家纺用品</a></li>
            <li><a href="product-list.jsp?name=婴幼奶粉">婴幼奶粉</a></li>
            <li><a href="product-list.jsp?name=饰品">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="position0" class="wrap">
    您现在的位置：<a href="../index.jsp   ">易买网</a> &gt; 结账
</div>
<div id="main" class="wrap">
    <div class="lefter">
        <div class="box">
            <h2>商品分类</h2>
            <dl>
                <dt>图书音像</dt>
                <dd><a href="product-list.jsp?name=图书">图书</a></dd>
                <dd><a href="product-list.jsp?name=音乐">音乐</a></dd>
                <dt>百货</dt>
                <dd><a href="product-list.jsp?name=运动健康">运动健康</a></dd>
                <dd><a href="product-list.jsp?name=服装">服装</a></dd>
                <dd><a href="product-list.jsp?name=家居">家居</a></dd>
                <dd><a href="product-list.jsp?name=美妆">美妆</a></dd>
                <dd><a href="product-list.jsp?name=母婴">母婴</a></dd>
                <dd><a href="product-list.jsp?name=食品">食品</a></dd>
                <dd><a href="product-list.jsp?name=手机数码">手机数码</a></dd>
                <dd><a href="product-list.jsp?name=家具首饰">家具首饰</a></dd>
                <dd><a href="product-list.jsp?name=手表饰品">手表饰品</a></dd>
                <dd><a href="product-list.jsp?name=鞋包">鞋包</a></dd>
                <dd><a href="product-list.jsp?name=家电">家电</a></dd>
                <dd><a href="product-list.jsp?name=电脑办公">电脑办公</a></dd>
                <dd><a href="product-list.jsp?name=玩具文具">玩具文具</a></dd>
                <dd><a href="product-list.jsp?name=汽车用品">汽车用品</a></dd>
            </dl>
        </div>
    </div>
</div>
<div class="father-div" style="margin-left: 500px">
    <p style="font-size: 14px;"><strong>选择收货地址：</strong></p>
    <div class="address-div1" style="padding-bottom: 30px">
        <ul class="ulTag">
            <li style="font-size: 12px ">
                <label>
                    <input class="radio" type="radio" name="address" value="address" checked="checked" > 北京市海淀区中关村大厦202</input>
                </label>
                <br>
                <label>
                    <input class="radio" type="radio" name="address" value="address1" > 河北省邯郸市建设大街54号</input>
                </label>
            </li>
            <li class="liTag"> </li>
        </ul>
        <input class="address-btn" type="button" value="使用新地址"/>

        <div class="do-address" style="display: none;">
            <form id="regForm" method="post" action="address.jsp" >
                <table>
                    <span style="font-size: 12px">省：</span>
                    <select id="province" onchange="changeSelect(this);">
                        <option class="province" value="">-请选择省-</option>
                    </select>
                    <span style="font-size: 12px">市：</span>
                    <select id="city" onchange="changeSelect(this);">
                        <option class="city" value=""  >-请选择市-</option>
                    </select>
                    <span style="font-size: 12px">区：</span>
                    <select id="district">
                        <option class="district" value="">-请选区-</option>
                    </select>
                    <tr style="width: 75px;height: 50px">
                        <td style="font-size: 12px">详细地址(*)：</td>
                        <td>
                            <input id="careful-address" type="text" placeholder="请输入详细地址信息，如门牌号等" maxlength="200" style="width: 300px;height: 25px" />
                        </td>
                    </tr>
                    <tr style="height: 50px">
                        <td style="font-size: 12px">邮编：</td>
                        <td><input id="postcode" type="text" placeholder="请填写邮编" maxlength="6" style="width: 300px;height: 25px"/></td>
                    </tr>
                    <tr style="height: 50px">
                        <td style="font-size: 12px">电话号码(*)：</td>
                        <td><input id="telephone" type="text" placeholder="请填写正确的电话号码" maxlength="11" style="width: 300px;height: 25px"/></td>
                    </tr>
                    <tr>
                        <td style="font-size: 12px">收货人姓名：</td>
                        <td><input id="name" type="text" placeholder="请填写您的姓名" style="width: 300px;height: 25px"/></td>
                    </tr>
                    <tr style="height: 50px">
                        <td>
                            <input id="btn" type="button" value="保存" style="text-align: center"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="product-div1" >
        <p style="font-size: 14px;"><strong>订单信息</strong></p>
        <hr style="width: 700px;height: 2px;background-color: #FC7E31">
        <table style="margin:30px 0px 30px 0px; ">
            <tr style="font-size: 14px;color: #9d9d9d">
                <th style="padding: 0px 20px 0px;">店铺宝贝</th>
                <th style="padding: 0px 70px 0px;">商品名</th>
                <th style="padding: 0px 70px 0px;">商品描述</th>
                <th style="padding: 0px 70px 0px;">单价</th>
            </tr>
            <tr style="font-size: 12px">
                <th style="padding: 5px 20px 0px;"><img src="images/upload/${product.epFileName}" width="80" height="100" alt=""/></th>
                <th style="padding: 0px 70px 0px;">${product.epName}</th>
                <th style="padding: 0px 70px 0px;">${product.epDescription}</th>
                <th style="padding: 0px 70px 0px;color: red">${product.epPrice}</th>
            </tr>
        </table>
        <hr style="width: 700px;height: 2px;background-color: #FC7E31">
    </div>
    <div>
       <p class="submit" style="border:0;width: 100px;height: 35px ; font-size:20px; color:#FFFFFF; background:#FC7E31;margin-top: 5px ;padding:10px 0px 0px 10px;float: right ;margin-right: 200px">提交订单</p>
    </div>
</div>
<div style="border: 0px;height: 50px "></div>
<div class="clear"></div>
<div id="position1" class="wrap"></div>
<div class="wrap">
    <div id="shopping"></div>
</div>
</body>
</html>
<script>
    $(".submit").click(function () {
        window.location.href="${pageContext.request.contextPath}/statics/manage/alipay.jsp?totalAmounts=${product.epPrice}";
    });
</script>
