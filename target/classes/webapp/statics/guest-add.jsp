<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="java.text.ParseException" %><%--
  Created by IntelliJ IDEA.
  User: 29246
  Date: 2020/1/2
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  //
    int id= Integer.parseInt(request.getParameter("Id"));
    //
    String guestName= request.getParameter("guestName");
    //
    String guestReply =request.getParameter("guestReply");
    //
    String ec_content = request.getParameter("guestContent");
    //
    String replyTime =request.getParameter("replyTime");

    String time = request.getParameter("guestTime");

    System.out.println(time+replyTime+id+guestName+guestReply+ec_content);
    //

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    try {
       Date  ec_create_time = simpleDateFormat.parse(time);
       Date  replyTim1 = simpleDateFormat.parse(replyTime);

        //调用方法
        EasyBuyComment easyBuycomment=new EasyBuyComment(id,ec_content,ec_create_time,guestReply,replyTim1,guestName);
        ServiceMassageDao service=new ServiceMassageDaoImpl();
        int redult=service.addCommodity(easyBuycomment);
        System.out.println(redult+"``````````````````111111111111111111111111111``````````````````");
        //将结果返回到留言界面
        response.sendRedirect("guestbook.jsp");
    } catch (ParseException e) {
        e.printStackTrace();
    }



%>