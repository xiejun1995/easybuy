<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String param=request.getParameter("id");
    int id=Integer.parseInt(param);
    ClassifyService service=new ClassifyServiceImpl();
    Classify clfy=service.ClassifyById(id);
    request.setAttribute("clfy",clfy);
    request.getRequestDispatcher("productClass-modify.jsp").forward(request,response);
%>
