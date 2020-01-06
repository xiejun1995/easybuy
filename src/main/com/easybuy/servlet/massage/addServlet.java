package com.easybuy.servlet.massage;

import com.easybuy.pojo.EasyBuy_Comment;
import com.easybuy.service.massage.ServiceMassageDao;
import com.easybuy.service.massage.ServiceMassageDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class addServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int ec_id = Integer.parseInt(request.getParameter("Id"));
        String ec_nick_name = request.getParameter("guestName");
        String ec_content = request.getParameter("guestContent");
       //获取
        String time= request.getParameter("guestTime");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date ec_create_time = simpleDateFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String ec_reply = request.getParameter("guestReply");
        //获取
        String day = request.getParameter("replyTime");
        SimpleDateFormat simpleDateFormat1=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date ec_reply_time = simpleDateFormat.parse(day);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //System.out.println(ec_content+ec_nick_name);
        EasyBuy_Comment easyBuy_Comment = new EasyBuy_Comment();
        easyBuy_Comment.setEc_id(ec_id);
        easyBuy_Comment.setEc_nick_name(ec_nick_name);
        easyBuy_Comment.setEc_content(ec_content);
        Date ec_create_time = new Date();
        easyBuy_Comment.setEc_create_time(ec_create_time);
        easyBuy_Comment.setEc_reply(ec_reply);
        Date ec_reply_time = new Date();
        easyBuy_Comment.setEc_reply_time(ec_reply_time);

        ServiceMassageDao serviceMassageDao=new ServiceMassageDaoImpl();
        serviceMassageDao.addCommodity1(easyBuy_Comment);

        response.sendRedirect("../guestbook.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
