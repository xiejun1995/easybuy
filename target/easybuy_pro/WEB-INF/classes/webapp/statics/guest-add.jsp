<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="java.text.ParseException" %>
<%--
  Created by IntelliJ IDEA.
  User: 29246
  Date: 2020/1/2
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%--留言的新增--%>
<%

    //输出编号
    int id= Integer.parseInt(request.getParameter("Id"));
    //昵称
    String guestName= request.getParameter("guestName");
    //回复时间
    //String guestReply =request.getParameter("guestReply");
    //内容
    String ecContent = request.getParameter("guestContent");
    //String replyTime =request.getParameter("replyTime");
    //内容时间
    String time = request.getParameter("guestTime");
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    try {
       Date  ecCreateTime = simpleDateFormat.parse(time);
       //Date  replyTim1 = simpleDateFormat.parse(replyTime);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    //调用方法
    EasyBuyComment easyBuycomment=new EasyBuyComment();
    easyBuycomment.setEcId(id);
    easyBuycomment.setEcContent(ecContent);

    Date ecCreateTime =new Date();
    easyBuycomment.setEcCreateTime(ecCreateTime);

    easyBuycomment.setEcNickName(guestName);

    ServiceMassageDao service=new ServiceMassageDaoImpl();
    int redult=service.addCommodity(easyBuycomment);
    //验证是否有值
     System.out.println(redult+"``````````````````111111111111111111111111111``````````````````");
    //将结果返回到留言界面
    response.sendRedirect("/guestbook.jsp");
%>