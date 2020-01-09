<%@ page import="com.easybuy.service.commodity.ServiceCommodityDao" %>
<%@ page import="com.easybuy.service.commodity.ServiceCommodityDaoImpl" %>

<%@ page import="com.easybuy.pojo.EasyBuyProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ServiceCommodityDao service=new ServiceCommodityDaoImpl();
    EasyBuyProduct buy=new EasyBuyProduct();
    int id=Integer.parseInt(request.getParameter("id"));
    buy.setEpId(id);
    service.deleteCommodity(buy);
    request.setAttribute("info","删除成功！");
    request.getRequestDispatcher("hint.jsp").forward(request,response);
%>
