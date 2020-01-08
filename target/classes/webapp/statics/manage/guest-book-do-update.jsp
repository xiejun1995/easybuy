<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--留言的添加操作--%>
<%  //获取编号，昵称，回复内容
    String id= request.getParameter("Id");
    String guestName= request.getParameter("guestName");
    String guestReply =request.getParameter("guestReply");
    //获取回复时间
    String replyTime =request.getParameter("ReplyTime");
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    Date ecCreateTime=null;
    try {
        ecCreateTime = simpleDateFormat.parse(replyTime);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    //调用方法
    EasyBuyComment easyBuycomment=new EasyBuyComment(Integer.parseInt(id),guestReply,ecCreateTime,guestName);
    ServiceMassageDao service=new ServiceMassageDaoImpl();
    service.updateCommodity(easyBuycomment);
    //将结果返回到留言界面
    response.sendRedirect("guestbook.jsp");
%>
