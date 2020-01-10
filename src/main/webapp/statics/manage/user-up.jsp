<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2020/1/9
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="../statics/css/style.css" />
<script type="text/javascript" src="../statics/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../statics/scripts/function.js"></script>
<script type="text/javascript" src="../statics/scripts/My97DatePicker/WdatePicker.js"></script>

<html>
<head>
    <title>main</title>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="../statics/images/logo.gif" /></div>
    <div class="help">
        <c:if test="${sessionScope.userName==null}">
            <a href="../login.jsp">登录</a><a href="../register.jsp">注册</a>
        </c:if>
        <c:if test="${sessionScope.userName!=null}">
            <span>欢迎您:${userName}</span>
            <a class="button" id="logout" href="${pageContext.request.contextPath}/servlet/invalidate">注销</a>
        </c:if>
        <a href="../shopping.jsp" class="shopping">购物车X件</a>
        <a href="../guestbook.jsp">留言</a>
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
            <li class="first"><a href="#">音乐</a></li>
            <li><a href="#">影视</a></li>
            <li><a href="#">少儿</a></li>
            <li><a href="#">动漫</a></li>
            <li><a href="#">小说</a></li>
            <li><a href="#">外语</a></li>
            <li><a href="#">数码相机</a></li>
            <li><a href="#">笔记本</a></li>
            <li><a href="#">羽绒服</a></li>
            <li><a href="#">秋冬靴</a></li>
            <li><a href="#">运动鞋</a></li>
            <li><a href="#">美容护肤</a></li>
            <li><a href="#">家纺用品</a></li>
            <li><a href="#">婴幼奶粉</a></li>
            <li><a href="#">饰品</a></li>
            <li class="last"><a href="#">Investor Relations</a></li>
        </ul>
    </div>
</div>
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em>
        <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎成为易买网卖家</h1>
            <ul class="steps clearfix">
                <li class="current"><em></em>填写卖家信息</li>
                <li class="last"><em></em>升级成功</li>
            </ul>
            <form id="regForm" method="post" action="${pageContext.request.contextPath}/servlet/adduser" >
                <table>
                    <tr>
                        <td class="field">店铺名称(*)：</td>
                        <td>
                            <input class="text" type="text" name="dianpuming" placeholder="易买网店铺名称" id="dianpuming" maxlength="10"  />
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="field">营业执照统一社会信用代码：</td>
                        <td><input class="text" type="text" placeholder="营业执照内的统一社会信用代码" name="xinyongma" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">营业执照原件证件照片上传：</td>
                        <td><input class="text" type="text" placeholder="营业执照原件照片" id="zhizhao" name="zhizhao" /><span></span></td>
                    </tr>
                        <td></td>
                        <td><label class="ui-green"><input type="submit" name="submit" value="提交信息" /></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2010 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>