<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--执行删除操作--%>
<%
    //调用方法
    ServiceMassageDao service=new ServiceMassageDaoImpl();
    EasyBuyComment easyBuyComment=new EasyBuyComment();
    //获取主键
    int id= Integer.parseInt(request.getParameter("ecId"));
    easyBuyComment.setEcId(id);
    service.deleteCommodity(easyBuyComment);

    //返回结果到留言界面
    response.sendRedirect("guestbook.jsp");
%>
