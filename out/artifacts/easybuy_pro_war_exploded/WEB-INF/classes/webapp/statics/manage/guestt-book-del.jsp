<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuy_Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--执行删除操作--%>
<%
    //获取主键
    int id= Integer.parseInt(request.getParameter("ec_id"));
    //调用方法
    ServiceMassageDao service=new ServiceMassageDaoImpl();
    EasyBuy_Comment comm=new EasyBuy_Comment(id);
    service.deleteCommodity(comm);
    //返回结果到留言界面
    response.sendRedirect("guestbook.jsp");
%>