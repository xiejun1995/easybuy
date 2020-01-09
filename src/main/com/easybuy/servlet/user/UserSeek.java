package com.easybuy.servlet.user;

import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.service.user.ServiceUserDao;
import com.easybuy.service.user.ServiceUserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Allen
 * @date 2019/12/28 17:25
 */
public class UserSeek extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
        String id = request.getParameter("id");
        EasyBuyUser easyBuyuser = serviceUserDao.getUser(id);


        /**
         * 判断如果已经是商家或者超级管理员就不能重复成为卖家
         */
        if (easyBuyuser.getStatuss()>=2) {
            response.sendRedirect("../statics/user-maijia.jsp");
        }else {
            request.getRequestDispatcher("../statics/manage/user-up.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
