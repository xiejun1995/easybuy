
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>

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
            <li><a href="index.jsp?name=首页">首页</a></li>
            <li><a href="product-list.jsp?name=图书">图书</a></li>
            <li><a href="product-list.jsp?name=百货">百货</a></li>
            <li><a href="product-list.jsp?name=品牌">品牌</a></li>
            <li><a href="product-list.jsp?name=促销">促销</a></li>
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
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em>
        <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎注册易买网</h1>
            <ul class="steps clearfix">
                <li class="current"><em></em>填写注册信息</li>
                <li class="last"><em></em>注册成功</li>
            </ul>
            <form id="regForm" method="post" action="${pageContext.request.contextPath}/servlet/adduser" >
                <table>
                    <tr>
                        <td class="field">用户名(*)：</td>
                        <td>
                            <input class="text" type="text" name="userId" placeholder="用户名由6-20位,数字或字母组合" id="userId" maxlength="10"  />
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="field">真实姓名(*)：</td>
                        <td><input class="text" type="text" placeholder="您的中文姓名" name="userName" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码(*)：</td>
                        <td><input class="text" type="password" placeholder="密码由6-20位,数字或字母组合" id="password" name="password" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">确认密码(*)：</td>
                        <td><input class="text" type="password" placeholder="密码由6-20位,数字或字母组合" name="confirmPassword" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">性别(*)：</td>
                        <td>
                            <label>
                            <input class="radio" type="radio" name="sex" value="男" checked="checked">男</input>
                            </label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                            <input class="radio" type="radio" name="sex" value="女">女</input>
                            </label>
                            <span></span></td>
                    </tr>
                    <tr>
                        <td class="field">出生日期：</td>
                        <td><input id="birthday" placeholder="生日格式xxxx-xx-xx" class="text" type="text" name="birthday" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">身份证：</td>
                        <td><input class="text" type="text" placeholder="请填写本人有效身份证号码" name="identityCode" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">电子邮件：</td>
                        <td><input class="text" type="text" placeholder="请填写常用邮箱" name="email" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">手机(*)：</td>
                        <td><input class="text" type="text" placeholder="请填写常用电话" name="mobile" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">收货地址(*)：</td>
                        <td><input class="text" type="text" placeholder="方便取件的地址" name="address" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">用途选择(*)：</td>
                        <td>
                            <label>
                                <input class="radio" type="radio" name="statuss" value="1" checked="checked">我是买家</input>
                            </label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input class="radio" type="radio" name="statuss" value="2">我是商家</input>
                            </label>
                            <span></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input type="submit" name="submit" value="提交注册" /></label></td>
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
