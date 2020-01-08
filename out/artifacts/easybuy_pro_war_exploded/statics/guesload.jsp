<%@ page import="com.easybuy.pojo.EasyBuy_Comment" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDao" %>
<%@ page import="com.easybuy.service.massage.ServiceMassageDaoImpl" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册中转页面</title>
</head>
<body>
<%  //获取主键编号
    int ec_id = Integer.parseInt(request.getParameter("Id"));
    //获取昵称
    String ec_nick_name = request.getParameter("guestName");
    String ec_content = request.getParameter("guestContent");
    //获取时间
    String time= request.getParameter("guestTime");
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    try {
        Date ec_create_time = simpleDateFormat.parse(time);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    String ec_reply = request.getParameter("guestReply");
    //获取回复时间
    String day = request.getParameter("replyTime");
    SimpleDateFormat simpleDateFormat1=new SimpleDateFormat("yyyy-MM-dd");
    try {
        Date ec_reply_time = simpleDateFormat.parse(day);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    //输出编号，昵称，内容，内容时间，回复编号
    EasyBuy_Comment easyBuy_Comment = new EasyBuy_Comment();
    easyBuy_Comment.setEc_id(ec_id);
    easyBuy_Comment.setEc_nick_name(ec_nick_name);
    easyBuy_Comment.setEc_content(ec_content);
    Date ec_create_time = new Date();
    easyBuy_Comment.setEc_create_time(ec_create_time);
    easyBuy_Comment.setEc_reply(ec_reply);
    Date ec_reply_time = new Date();
    easyBuy_Comment.setEc_reply_time(ec_reply_time);
    //调用添加方法
    ServiceMassageDao serviceMassageDao=new ServiceMassageDaoImpl();
    serviceMassageDao.addCommodity1(easyBuy_Comment);
    //将结果返回到留言界面
    response.sendRedirect("../guestbook.jsp");
%>
</body>
</html>
