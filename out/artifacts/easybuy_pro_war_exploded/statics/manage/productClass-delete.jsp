<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    ClassifyService service=new ClassifyServiceImpl();
    Classify clfy=new Classify(id);
    int result=service.deleteClassify(clfy);
    if (result>0){
        request.setAttribute("info","删除成功!");
        request.getRequestDispatcher("productClass-hint.jsp").forward(request,response);
    }
%>
