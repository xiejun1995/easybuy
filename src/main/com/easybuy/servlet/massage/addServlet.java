package com.easybuy.servlet.massage;

import com.easybuy.pojo.EasyBuyComment;
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

        int ecId = Integer.parseInt(request.getParameter("Id"));
        String ecNickName = request.getParameter("guestName");
        String ecContent = request.getParameter("guestContent");
       //获取
        String guestTime= request.getParameter("guestTime");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date ecCreateTime = simpleDateFormat.parse(guestTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String ecReply = request.getParameter("guestReply");
        //获取
        String day = request.getParameter("replyTime");
        SimpleDateFormat simpleDateFormat1=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date ecCreateTime = simpleDateFormat.parse(day);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //System.out.println(ec_content+ec_nick_name);
        EasyBuyComment easyBuyComment = new EasyBuyComment();
        easyBuyComment.setEcId(ecId);
        easyBuyComment.setEcNickName(ecNickName);
        easyBuyComment.setEcContent(ecContent);
        Date ecCreateTime = new Date();
        easyBuyComment.setEcCreateTime(ecCreateTime);
        easyBuyComment.setEcReply(ecReply);
        Date ecReplyTime = new Date();
        easyBuyComment.setEcReplyTime(ecReplyTime);

        ServiceMassageDao serviceMassageDao=new ServiceMassageDaoImpl();
        serviceMassageDao.addCommodity1(easyBuyComment);

        response.sendRedirect("../guestbook.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
