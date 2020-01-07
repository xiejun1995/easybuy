<%@ page import="java.util.ArrayList" %>
<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page import="java.util.List" %>
<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="com.easybuy.util.PageSupport" %>

<%@ page import="com.easybuy.pojo.EasyBuy_Product" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 29246
  Date: 2019/12/27
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="images/logo.gif" /></div>
    <div class="help">
        <a href="shopping.jsp" class="shopping">购物车X件</a>
        <a href="login.jsp">登录</a><a href="register.jsp">注册</a>
        <a href="manage/guestbook.jsp">留言</a>
        <a href="manage/index.jsp">后台管理</a></div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current">
            <a href="manage/index.jsp?name=首页">首页</a></li>
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
    <%
        String name=request.getParameter("name");
        if (name==null){
            name="图书";
        }
    %>
    您现在的位置：<a href="manage/index.jsp   ">易买网</a> &gt; <a href="product-list.jsp   ">商品</a> &gt; <%=name%>
</div>
<div id="main" class="wrap">
    <div class="lefter">
        <div class="box">
            <h2>商品分类</h2>
            <dl>
                <%
                    ClassifyService service=new ClassifyServiceImpl();
                    List<Classify> list=list=service.ClassifyAll();
                    //父分类集合
                    List<Classify> fids=new ArrayList<>();
                    //子分类集合
                    List<Classify> ids=new ArrayList<>();
                    for (Classify clfy:list) {
                        if (clfy.getEpc_parent_id()==0){
                            fids.add(clfy);
                        }else if (clfy.getEpc_parent_id()!=0){
                            ids.add(clfy);
                        }
                    }
                        for (Classify clfy:fids) {
                %>
                <dt><%=clfy.getEpc_name()%></dt>
                <%
                    for (Classify clfy2:ids) {
                        if (clfy.getEpc_id()==clfy2.getEpc_parent_id()){
                %>
                <dd><a href="product-list.jsp?name=<%=clfy2.getEpc_name()%>&epc_id=<%=clfy2.getEpc_id()%>"><%=clfy2.getEpc_name()%></a></dd>
                <%
                            }
                        }
                    }
                %>
               <%-- <dt>图书音像</dt>
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
                <dd><a href="product-list.jsp?name=汽车用品">汽车用品</a></dd>--%>

            </dl>
        </div>
        <div class="spacer"></div>
        <div class="last-view">

            <h2>最近浏览</h2>
            <dl class="clearfix">
                <dt><img src="images/product/10_small.jpg" /></dt>
                <dd><a href="product-view.jsp"  target="_self">利仁2018M福满堂电饼铛 好用实惠</a><a href="product-view.jsp"></a></dd>
                <dt>&nbsp;</dt>
                <dd>&nbsp;</dd>
            </dl>
            <script type="text/javascript">
                document.write("Cookie中记录的购物车商品ID："+ getCookie("product") + "，可以在动态页面中进行读取");
            </script>
        </div>
    </div>
    <div class="main">
        <div class="product-list">

            <h2>全部商品</h2>
            <div class="clear"></div>
            <ul class="product clearfix">
                <%
                    ServiceCommodityDao service2=new ServiceCommodityDaoImpl();
                    String index=request.getParameter("pageIndex");
                    String cid=request.getParameter("epc_id");
                    if (index==null){
                        index="1";
                    }
                    if (cid==null){
                        cid="3";
                    }
                    int epc_id=Integer.parseInt(cid);
                    //当前页码
                    int pageIndex=Integer.parseInt(index);
                    //页面容量
                    int pageSize=12;
                    //总条数
                    int totalCount=service2.totalCountById(epc_id);

                    PageSupport pageSupport=new PageSupport();
                    pageSupport.setPageNo(pageIndex);
                    pageSupport.setPageSize(pageSize);
                    pageSupport.setTotalCount(totalCount);
                    //获取总页数
                    int totalPage=pageSupport.getTotalPageCount();

                    List<EasyBuy_Product> list2= service2.commodityListById(epc_id,pageIndex,pageSize);;

                    for (EasyBuy_Product buy :list2) {
                %>
                <li>
                    <dl>
                        <dt><a href="manage/product-careful.jsp?id=<%=buy.getEp_id()%>" target="_self"><img src="<%=request.getContextPath()%>/images/upload/<%=buy.getEp_file_name()%>" /></a></dt>
                        <dd class="title"><a href="manage/product-careful.jsp" target="_self"><%=buy.getEp_description()%></a></dd>
                        <dd class="price">￥<%=buy.getEp_price()%></dd>
                    </dl>
                </li>
                <%}%>
                <%--<li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/2.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">乐扣普通型保鲜盒圣诞7件套</a></dd>
                        <dd class="price">￥69.90</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/3.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">欧珀莱均衡保湿四件套</a></dd>
                        <dd class="price">￥279.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/4.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">联想笔记本电脑 高速独立显存</a></dd>
                        <dd class="price">￥4199</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/5.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">法姿韩版显瘦彩边时尚牛仔铅笔裤</a></dd>
                        <dd class="price">￥49.00</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/6.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">Genius925纯银施华洛世奇水晶吊坠</a></dd>
                        <dd class="price">￥69.90</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/7.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">利仁2018M福满堂电饼铛 好用实惠</a></dd>
                        <dd class="price">￥268.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/8.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">达派高档拉杆箱20寸 经典款式</a></dd>
                        <dd class="price">￥198.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/9.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">爱国者MP4 全屏触摸多格式播放 4G</a></dd>
                        <dd class="price">￥289.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/10.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">多美滋金装金盾3阶段幼儿配方奶粉</a></dd>
                        <dd class="price">￥186.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view/product-careful.jsp" target="_self"><img src="images/product/1.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">法国德菲丝松露精品巧克力500g/盒</a></dd>
                        <dd class="price">￥108.0</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="product-view.jsp   " target="_self"><img src="images/product/2.jpg" /></a></dt>
                        <dd class="title"><a href="product-view.jsp" target="_self">乐扣普通型保鲜盒圣诞7件套</a></dd>
                        <dd class="price">￥69.90</dd>
                    </dl>
                </li>--%>
            </ul>
            <div class="clear"></div>
            <div class="pager">
                <ul class="clearfix">
                    <li>共有<%=totalCount%>条记录，当前<%=pageIndex%>/<%=totalPage%>页</li>
                    <li><a href="product-list.jsp?pageIndex=1">首页</a></li>
                    <% for (int i=0;i<totalPage;i++){
                    %>
                    <li class="current"><a href="product-list.jsp?pageIndex=<%=i+1%>"><%=i+1%></a></li>
                    <%}%>
                    <li>...</li>
                    <li><a href="product-list.jsp?pageIndex=<%=totalPage%>">尾页</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2010 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>
</div>
</body>
</html>
