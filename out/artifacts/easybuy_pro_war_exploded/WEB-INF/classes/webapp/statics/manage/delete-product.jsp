<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuy_Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ServiceCommodityDao service=new ServiceCommodityDaoImpl();
    EasyBuy_Product buy=new EasyBuy_Product();
    int id=Integer.parseInt(request.getParameter("id"));
    buy.setEp_id(id);
    service.deleteCommodity(buy);
    request.setAttribute("info","删除成功！");
    request.getRequestDispatcher("hint.jsp").forward(request,response);
%>
