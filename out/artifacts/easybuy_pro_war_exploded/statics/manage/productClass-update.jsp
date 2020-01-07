<%@ page import="com.easybuy.service.commodity.ClassifyService" %>
<%@ page import="com.easybuy.service.commodity.ClassifyServiceImpl" %>
<%@ page import="com.easybuy.pojo.Classify" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/30
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    int parentId=Integer.parseInt(request.getParameter("parentId"));
    String name=request.getParameter("className");

    System.out.println(id+"\t"+parentId+"\t"+name+"````````````````````");

    Classify clfy=new Classify(id,name,parentId);

    ClassifyService service=new ClassifyServiceImpl();
    service.updateClassify(clfy);
    request.setAttribute("info","修改成功!");
    request.getRequestDispatcher("productClass-hint.jsp").forward(request,response);
%>
