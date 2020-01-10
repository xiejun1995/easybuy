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

/**
 * 查看账号是否存在
 * @author Allen
 * @date 2019/1/10 20:23
 */
public class RegSeek extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String name = request.getParameter("userId");
       EasyBuyUser easyBuyUser = new EasyBuyUser();
       easyBuyUser.setUserId(name);
       ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
       serviceUserDao.register(easyBuyUser);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
