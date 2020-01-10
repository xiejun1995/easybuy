package com.easybuy.servlet.user;

import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.service.user.ServiceUserDao;
import com.easybuy.service.user.ServiceUserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 更改用户权限为卖家
 * @author Allen
 * @date 2019/12/27 14:57
 */
public class UserUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id");
            int statuss = 2;
            EasyBuyUser easyBuyuser = new EasyBuyUser();
            easyBuyuser.setUserId(id);
            easyBuyuser.setStatuss(statuss);

            ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
            boolean flag = serviceUserDao.userUp(easyBuyuser);
            if (flag) {
                response.sendRedirect("../statics/manage/user-upmaijia.jsp");
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
