<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.util.PageSuppore" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
<html>
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help">
        <a href="shopping.jsp"class="shopping">购物车X件</a>
        <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        <a href="guestbook.jsp">留言</a>
        <a href="manage/index.jsp">后台管理</a></div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current">
                <a href="../index.jsp?name=首页">首页</a></li>
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
<div id="position" class="wrap">
    您现在的位置：<a href="../index.jsp">易买网</a> &gt; 在线留言
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
    <div class="main">
        <div class="guestbook" >
            <h2>全部留言</h2>
            <ul>
                <%//分页查询
                    // 当前页码
                    String currentPage = request.getParameter("pageNo");
                    if(currentPage == null){
                        //用户首次访问
                        currentPage="1";
                    }
                    int pageNo =Integer.parseInt(currentPage);
                    ServiceMassageDao service = new ServiceMassageDaoImpl();
                    int totalCount = service.totalCount();
                    //每页显示的商品数量 ，页容量
                    int pageSize = 5;
                    //获取总页数
                    PageSuppore pageSuppore = new PageSuppore();
                    pageSuppore.setCurrentPageNo(pageNo);   //设置当前页
                    pageSuppore.setPageSize(pageSize);		//设置页容量
                    pageSuppore.setTotalPageCount(totalCount);	//计算总页数
                    //获得总页数
                    int totalPage = pageSuppore.getTotalPageCount();
                    //控制首页和尾页
                    if(pageNo<1){
                        pageNo = 1;
                    }else if(pageNo>totalPage){
                        pageNo=totalPage;
                    }
                    List<EasyBuyComment> lists = service.commodityListById(pageNo,pageSize);
                    // System.out.println(lists.size());
                    for(EasyBuyComment con : lists) {
                %>
                <li>
                    <dl>
                        <dt><%=con.getEcContent()%></dt>
                        <dd class="author">网友：<%=con.getEcNickName()%> <span class="timer"><%=con.getEcCreateTime()%></span></dd>
                        <dd><%=con.getEcContent()%></dd>
                    </dl>
                </li>
                <%}%>
            </ul>
            <div class="pager">
                <ul class="clearfix">
                    <%
                        if(pageNo>1){
                    %>
                    <li><a href="guestbook.jsp?pageNo = 1">首页</a></li>
                    <li><a href="guestbook.jsp?pageNo=<%=pageNo-1%>">上一页</a></li>
                    <%} if(pageNo<totalPage){%>
                    <li><a href="guestbook.jsp?pageNo=<%=pageNo+1%>">下一页</a></li>
                    <li><a href="guestbook.jsp?pageNo=<%=totalPage %>">尾页</a></li>
                    <%} %>
                </ul>
            </div>

            <div id="reply-box">
                <form id="guestBook" action="guest-add.jsp" method="post">
                    <table>
                        <tr>
                            <td class="field">Id：</td>
                            <td><input class="text" type="text" name="Id"  value="用户名"/></td>
                        </tr>
                        <tr>
                            <td class="field">昵称：</td>
                            <td><input class="text" type="text" name="guestName"  value="当前用户名"/></td>
                        </tr>
                        <tr>
                            <td class="field">留言内容：</td>
                            <td><textarea name="guestContent"></textarea><span></span></td>
                        </tr>
                        <tr>
                            <td class="field">留言时间：</td>

                            <td><input class="text" type="date" name="guestTime"  value="留言时间"/></td>
                        </tr>
                        <tr>
                            <td class="field">回复内容：</td>
                            <td><input class="text" type="text" name="guestReply"  value="回复内容"/></td>
                        </tr>
                        <tr>
                            <td class="field">回复时间：</td>
                            <td><input class="text" type="date" name="replyTime"  value="回复时间"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><label class="ui-blue"><input type="submit" name="submit" value="提交留言" /></label></td>
                        </tr>
                    </table>

                </form>

            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2013 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
