<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="com.easybuy.pojo.Classify" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String parentId=request.getParameter("parentId");
    String name=request.getParameter("className");

    Classify clfy=new Classify(name,Integer.parseInt(parentId));
    ClassifyService service=new ClassifyServiceImpl();
    int result=service.addClassify(clfy);
    if (result>0){
        request.setAttribute("info","添加成功!");
        request.getRequestDispatcher("productClass-hint.jsp").forward(request,response);
    }else {
        response.sendRedirect("productClass-add.jsp");
    }
%>
