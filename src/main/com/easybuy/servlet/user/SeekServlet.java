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
 *点击修改后传来用户ID查询后显示在修改页面
 * @author Allen
 * @date 2019/12/28 17:25
 */
public class SeekServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
        String id = request.getParameter("id");
        serviceUserDao.getUser(id);

        EasyBuyUser easyBuyuser = new EasyBuyUser();
        easyBuyuser.setUserId(id.toString());
        request.getRequestDispatcher("/statics/manage/user-modify.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
