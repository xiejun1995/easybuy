package com.easybuy.servlet.user;

import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.service.user.ServiceUserDao;
import com.easybuy.service.user.ServiceUserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 查看账号是否存在
 * @author Allen
 * @date 2019/1/10 20:23
 */
public class RegSeek extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter writer = response.getWriter();
       String name = request.getParameter("userId");
       EasyBuyUser easyBuyUser = new EasyBuyUser();
       easyBuyUser.setUserId(name);
       ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
       serviceUserDao.register(easyBuyUser);
       StringBuffer buffer = new StringBuffer();
       String names = buffer.toString();
       String[] name2 = names.split(",");
       for (int i = 0;i<name2.length;i++) {
           if (name2[i].equals(name)) {
               writer.print(true);
               break;
           }
       }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
