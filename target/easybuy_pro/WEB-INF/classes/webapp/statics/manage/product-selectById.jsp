
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    ServiceCommodityDao service=new ServiceCommodityDaoImpl();
    EasyBuyProduct buy=service.selectCommodityById(id);
    request.setAttribute("comm",buy);
    request.getRequestDispatcher("product-modify.jsp").forward(request,response);
%>
