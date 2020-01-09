
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="${pageContext.request.contextPath}/statics/images/logo.gif" /></div>
    <div class="help">
        <a href="${pageContext.request.contextPath}/statics/shopping.jsp" class="shopping">购物车X件</a>
        <a href="login.jsp">登录</a>
        <a href="${pageContext.request.contextPath}/statics/register.jsp">注册</a>
        <a href="${pageContext.request.contextPath}/statics/guestbook.jsp">留言</a>
        <a href="manage/index.jsp">后台管理</a></div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="#">首页</a></li>
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
                <a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=音乐">音乐</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=影视">影视</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=少儿">少儿</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=动漫">动漫</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=小说">小说</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=外语">外语</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=数码相机">数码相机</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=笔记本">笔记本</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=羽绒服">羽绒服</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=秋冬靴">秋冬靴</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=运动鞋">运动鞋</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=美容护肤">美容护肤</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=家纺用品">家纺用品</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=婴幼奶粉">婴幼奶粉</a></li>
            <li><a href="${pageContext.request.contextPath}/statics/product-list.jsp?name=饰品">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：<a href="${pageContext.request.contextPath}/index.jsp   ">易买网</a> &gt; 购物车
</div>
<div class="wrap">
    <div id="shopping">
        <form action="${pageContext.request.contextPath}/statics/address.jsp?amount=${amount}">
            <table id="tab">
                <tr>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>购买数量</th>
                    <th>操作</th>
                </tr>
            </table>
            <div id="total"><span>总计：￥0</span></div>
            <div class="button"><input id="totalAmount" type="submit" value="" /></div>
        </form>
    </div>
    <script type="text/javascript">
        document.write("Cookie中记录的购物车商品ID："+ getCookie("product") + "，可以在动态页面中进行读取");
    </script>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
<script type="text/javascript">
    //获取表格元素
    var $table=$("#tab");
    //判断是否是购物车X件访问
    if(!${product!=null}){
        //判断购物车中是否已存在当前要加入购物车的商品
        if($("#tab").find("#proId_${proId}").val()==${proId}){
            //如果存在则让他的数量加1
            $("#tab").find("#number_id_${proId}").val()+1;
        }else{
            //否则在后面追加一个商品
            $table.append(
                "<tr id=\"product_id_${proId}\">" +
                "<td class=\"thumb\"><img src=\"${pageContext.request.contextPath}/statics/images/product/${product.ep_file_name}\" /><a href=\"${pageContext.request.contextPath}/statics/product-view.jsp?ep_id=${proId}\">${product.ep_name}</a></td>" +
                "<td class=\"price\" id=\"price_id_${proId}\">" +
                "<span>${product.ep_price}</span>" +
                "<input type=\"hidden\" class=\"price\" value=\"${product.ep_price}\" />" +
                "<input type=\"hidden\" id=\"proId_${proId}\" value=\"${proId}\"/>" +
                "</td>" +
                "<td class=\"number\">" +
                "<span name=\"del\">-</span>" +
                "<input id=\"number_id_${proId}\" type=\"text\" name=\"number\" value=\"1\" />" +
                "<span name=\"add\">+</span>" +
                "</td>" +
                "<td class=\"delete\"><a href=\"javascript:void(0)\">删除</a></td>" +
                "</tr>"
            )
        }
    }
</script>
</html   >
