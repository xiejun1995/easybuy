<%@ page import="com.easybuy.pojo.EasyBuy_Comment" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--留言的添加操作--%>
<%  //获取编号，昵称，回复内容，回复时间
    String id= request.getParameter("Id");
    String guestName= request.getParameter("guestName");
    String guestReply =request.getParameter("guestReply");
    String replyTime =request.getParameter("replyTime");
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    Date ec_create_time=null;
    try {
         ec_create_time = simpleDateFormat.parse(replyTime);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    //调用方法
    EasyBuy_Comment easyBuy_comment=new EasyBuy_Comment(Integer.parseInt(id),guestReply,ec_create_time,guestName);
    ServiceMassageDao service=new ServiceMassageDaoImpl();
    service.updateCommodity(easyBuy_comment);
    //将结果返回到留言界面
    response.sendRedirect("guestbook.jsp");
%>
