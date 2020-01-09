<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--回复修改操作--%>
<%  //获取编号
    String eid = request.getParameter("ec_id");
    int id=Integer.parseInt(eid);//将String类型转换成int类型
    //调用方法
    ServiceMassageDao service=new ServiceMassageDaoImpl();
    EasyBuyComment comment= service.MrssageById(id);
    request.setAttribute("comm",comment);
    //将结果返回到回复修改界面
    request.getRequestDispatcher("guestbook-modify.jsp").forward(request,response);
%>