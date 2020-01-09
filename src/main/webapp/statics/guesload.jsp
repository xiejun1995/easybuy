<%@ page import="com.easybuy.pojo.EasyBuyComment" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言中转页面</title>
</head>
<body>
<%  //获取主键编号
    int ecId = Integer.parseInt(request.getParameter("Id"));
    //获取昵称
    String ecNickName = request.getParameter("guestName");
    String ecContent = request.getParameter("guestContent");
    //获取时间
    String time= request.getParameter("guestTime");
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    try {
        Date ecCreateTime = simpleDateFormat.parse(time);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    String ecReply = request.getParameter("guestReply");
    //获取回复时间
    String day = request.getParameter("replyTime");
    SimpleDateFormat simpleDateFormat1=new SimpleDateFormat("yyyy-MM-dd");
    try {
        Date ecReplyTime = simpleDateFormat.parse(day);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    //输出编号，昵称，内容，内容时间，回复编号
    EasyBuyComment easyBuyComment = new EasyBuyComment();
    easyBuyComment.setEcId(ecId);
    easyBuyComment.setEcNickName(ecNickName);
    easyBuyComment.setEcContent(ecContent);
    Date ecCreateTime = new Date();
    easyBuyComment.setEcCreateTime(ecCreateTime);
    easyBuyComment.setEcReply(ecReply);
    Date ecReplyTime = new Date();
    easyBuyComment.setEcReplyTime(ecReplyTime);
    //调用添加方法
    ServiceMassageDao serviceMassageDao=new ServiceMassageDaoImpl();
    serviceMassageDao.addCommodity1(easyBuyComment);
    //将结果返回到留言界面
    response.sendRedirect("guestbook.jsp");
%>
</body>
</html>
