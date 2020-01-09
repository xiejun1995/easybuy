
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
<script src="js/gVerify.js"></script>
<html>
<head>
    <title>main</title>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help"><a href="shopping.jsp" class="shopping">购物车X件</a><a href="login.jsp">登录</a><a href="register.jsp">注册</a><a href="guestbook.jsp">留言</a><a href="manage/index.jsp">后台管理</a></div>
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
            <h1>欢迎回到易买网</h1>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/servlet/login" >
                <table>
                    <tr>
                        <td class="field">用户名：</td>
                        <td>
                            <input class="text" type="text" id="userId" name="userId" />
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td>
                            <input class="text" type="password" id="password" name="password" />
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="field">验证码：</td>
                        <td>
                            <div id="v_container" style="width: 200px;height: 50px;"></div>
                            <input type="text" id="code_input" value="" placeholder="请输入验证码"/>
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input type="submit" id="my_button" value="立即登录" /></label></td>
                        <script>
                            var verifyCode = new GVerify("v_container");

                            $("#my_button").click(function () {
                                var res = verifyCode.validate($("#code_input").val());
                                if (res) {

                                }else {
                                    alert("输入错误");
                                    return false;
                                }
                            })
                        </script>
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