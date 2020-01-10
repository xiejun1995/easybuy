<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/shopping.js"></script>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="${pageContext.request.contextPath}/statics/images/logo.gif" /></div>
    <div class="help">
        <c:if test="${sessionScope.userName==null}">
            <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${sessionScope.userName!=null}">
            <span>欢迎您:${userName}</span>
            <a class="button" id="logout" href="${pageContext.request.contextPath}/servlet/invalidate">注销</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/statics/shopping.jsp" class="shopping">购物车X件</a>
        <a href="${pageContext.request.contextPath}/statics/guestbook.jsp">留言</a>
    </div>
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
    您现在的位置：<a href="${pageContext.request.contextPath}/statics/index.jsp   ">易买网</a> &gt; 购物车
</div>
<div class="wrap">
    <div id="shopping">
        <form action="${pageContext.request.contextPath}/statics/address.jsp?amount=${amount}">
            <table id="tab">
            </table>
            <div id="total">总计：￥<span>0</span></div>
            <div id="button">
                <button style="color: red;width: 120px;height: 30px;" onclick="delPro()" type="button">删除选中商品</button >
                <button id="totalAmount" type="submit">结算</button>
            </div>
        </form>
    </div>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
<script type="text/javascript">
    //获取表格元素
    var $table=$("#tab");
    //判断进入购物车时用户是否在购物车中添加过商品
    var tables="";
    //判断购物车中的东西是否过期
    if(${sessionScope.proMap!=null}){
        //如果有商品则在表格中追加
        tables+="<tr><th><input id='checkbox' type='checkbox' onclick='AllIsChecked()' style='width: 15px;height: 15px'><label for='checkbox' style='color: red'>全选</label></th>"+
                "<th>商品名称</th><th>商品价格</th><th>购买数量</th><th>操作</th><th>商品保留时间</th></tr>"+
                "<c:forEach items='${sessionScope.proMap}' var='product'>"+
                "<tr id='product_id_${product.key}' >"+
                "<td><input class ='checkbox' type='checkbox' onclick='IsChecked()' style='width: 15px;height: 15px'></td>"+
                "<td class='thumb'><img src='${pageContext.request.contextPath}/statics/images/upload/${product.value.epFileName}' /><a href='${pageContext.request.contextPath}/statics/product-careful.jsp?epId =${product.key}'>${product.value.epName}</a></td>"+
                "<td class='price' id='price_id_${product.key}' ><span>${product.value.epPrice}</span>"+
                "<input type='hidden' class='price' value='${product.value.epPrice}' />"+
                "<input type='hidden' id='proId_${product.key}' value='${product.key}'/></td>"+
                "<td class='number'>"+
                "<span name='del'onclick='delCount()' >-</span>"+
                "<input id='number_id_${product.key}' type='text' name='number' value='${sessionScope.countMap.get(product.key)}' />"+
                "<span name='add'onclick='addCount()' >+</span></td>"+
                "<td class='delete'><a href='javascript:void(0)'>删除</a></td><td class='MinAndSec'><span class='min' id='min${product.key}' >"+
                ${sessionScope.minuteMap.get(product.key)}+"</span>&nbsp;:&nbsp;"+
                "<span class='sec' id='sec${product.key}' >${sessionScope.secondMap.get(product.key)}</span></td></tr></c:forEach>";
        $table.html(tables);
    }else {
        $table.html("");
        $("#button").hide();
        if(confirm("您的购物车为空，是否前去浏览商品？")){
            window.location.href="index.jsp";
        }
    };
    //选取分钟和秒元素
    var $mins=$(".min");
    var $secs=$(".sec");
    //设置一个定时函数
    var timing=setInterval(shoppingCartTiming(),1000);
    function shoppingCartTiming() {
       //遍历该元素
        $mins.each(function (i,ele){
            //如果有商品保留时间到了则放回临时库存中同时将对应的商品从购物车中删除
            if(ele.html()==0&&$secs[i].html()==0){
                var epId=ele.parent().parent().attr("id").split("_")[2];
                $.ajax({
                    url:"addShoppingStock",
                    type:"GET",
                    data:{"epId":epId},
                    error:function () {
                        alert("加入库存失败，请重试!");
                    }
                });
            }else if($secs[i].html()>0){
                $secs[i].html($secs[i].html-1);
            }else if($secs[i].html()==0&&ele.html>0){
                ele.html(ele.html()-1);
            }
        });
    };
    //全选点击事件
    function AllIsChecked(){
        var $chechboxs=$(".checkbox");
        $chechboxs.each(function () {
            ele.checked=true;
        });
        totalPrice();
    }
    //计算总价格
    function totalPrice() {
        var totalPrices=0;
        var $chechboxs=$(".checkbox");
        //遍历所有复选框
        $chechboxs.each(function (i) {
            var prices=$("input [class=price][type=hidden]");
            var count=$("input [name=number]")[i].val();
            if(!isNaN(count)&& !isNaN(prices)){
                totalPrices=totalPrices+count*prices;
            }
        });
        //将总价格赋值给总计
        $("#total span").html(totalPrices);

    };
    //checkbox选中和不选中改变总价格
    function IsChecked() {
        totalPrice();
    };
    //当数量增加时重新计算总金额
    function addCount() {
        totalPrice();
    };
    //当数量减少时重新计算总金额
    function delCount() {
        totalPrice();
    };
</script>
</body>
</html>