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
 * 删除用户Servlet
 * @author Allen
 * @date 2019/12/27 14:30
 */
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EasyBuyUser easyBuyuser = new EasyBuyUser();
        String id = request.getParameter("id");
        easyBuyuser.setUserId(id);
        ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
        serviceUserDao.deleteUser(easyBuyuser);
        response.sendRedirect("../statics/delete.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
