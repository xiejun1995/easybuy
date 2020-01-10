<%@ page import="com.easybuy.util.PageSupport" %>
<%@ page import="java.util.List" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page import="com.easybuy.pojo.EasyBuyNews" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDao" %>
<%@ page import="com.easybuy.service.news.ServiceNewsDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/scripts/function.js"></script>
<html>
<head>
    <title>main</title>
    <script type="text/javascript">
        $(function () {
            $("ul li dl dt img").mousemove(function () {
                $(this).css("border","1px red solid");
            });
            $("ul li dl dt img").mouseout(function () {
                $(this).css("border","1px #ccc solid");
            });
        });
    </script>
</head>
<body>

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
        <div class="spacer"></div>
        <div class="last-view">
            <h2>最近浏览</h2>
            <dl class="clearfix">
                <dt><img src="images/product/10_small.jpg" /></dt>
                <dd><a href="#"  target="_self">利仁2018M福满堂电饼铛 好用实惠</a><a href="product-view.jsp"></a></dd>
                <dt>&nbsp;</dt>
                <dd>&nbsp;</dd>
            </dl>
        </div>
    </div>
    <div class="main">
        <div class="price-off">
            <div class="slideBox">
                <ul id="slideBox">
                    <li><img src="images/upload/1.jpg"/></li>
                    <li><img src="images/upload/2.jpg"/></li>
                    <li><img src="images/upload/3.jpg"/></li>
                    <li><img src="images/upload/4.jpg"/></li>
                </ul>
            </div>
            <h2>商品列表</h2>
            <ul class="product clearfix">
                <%
                    ServiceCommodityDao service2=new ServiceCommodityDaoImpl();
                    String index=request.getParameter("pageIndex");
                    String cid=request.getParameter("epcid");
                    if (index==null){
                        index="1";
                    }
                    if (cid==null){
                        cid="3";
                    }
                    int epcid=Integer.parseInt(cid);
                    //当前页码
                    int pageIndex=Integer.parseInt(index);
                    //页面容量
                    int pageSize=12;
                    //总条数
                    int totalCount=service2.totalCountById(epcid);

                    PageSupport pageSupport=new PageSupport();
                    pageSupport.setPageNo(pageIndex);
                    pageSupport.setPageSize(pageSize);
                    pageSupport.setTotalCount(totalCount);
                    //获取总页数
                    int totalPage=pageSupport.getTotalPageCount();

                    List<EasyBuyProduct> list2= service2.commodityListById(epcid,pageIndex,pageSize);;

                    for (EasyBuyProduct buy :list2) {
                %>
                <li>
                    <dl>
                        <dt><a href="manage/product-careful.jsp?id=<%=buy.getEpId()%>" target="_self"><img src="images/upload/<%=buy.getEpFileName()%>" /></a></dt>
                        <dd class="title"><a href="manage/product-careful.jsp?id=<%=buy.getEpId()%>" target="_self"><%=buy.getEpName()%></a></dd>
                        <dd class="price">￥<%=buy.getEpPrice()%></dd>
                    </dl>
                </li>
                <%}%>
            </ul>
        </div>
        <div class="side">
            <div class="spacer"></div>
            <div class="news-list">
                <h4>新闻动态</h4>
                <ul>
                    <%
                        ServiceNewsDao serviceNewsDao = new ServiceNewsDaoImpl();
                        List<EasyBuyNews> list = serviceNewsDao.commodityList(pageIndex,pageSize);
                        for (EasyBuyNews easyBuy_news : list) {
                    %>
                    <li><a href="news-view.jsp?id=<%=easyBuy_news.getEnId()%>"  target="_self"><%=easyBuy_news.getEnTitle()%></a></li>
                    <%}%>
                </ul>
            </div>
        </div>
        <div class="spacer clear"></div>
    </div>
</body>
</html>
