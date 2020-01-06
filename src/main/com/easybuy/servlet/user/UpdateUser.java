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
 * 更改用户信息
 * @author Allen
 * @date 2019/12/27 14:57
 */
public class UpdateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String userId = request.getParameter("userName");
            String userName = request.getParameter("name");
            String passWords = request.getParameter("passWord");
            String sex = request.getParameter("sex");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String birthday1 = request.getParameter("birthday");
            Date birthday = simpleDateFormat.parse(birthday1);
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");

            EasyBuyUser easyBuyuser = new EasyBuyUser();
            easyBuyuser.setUserId(userId);
            easyBuyuser.setUserName(userName);
            easyBuyuser.setPassWords(passWords);
            easyBuyuser.setSex(sex);
            easyBuyuser.setBirthday(birthday);
            easyBuyuser.setMobile(mobile);
            easyBuyuser.setAddress(address);

            ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
            boolean flag = serviceUserDao.updateUser(easyBuyuser);
            if (flag) {
                response.sendRedirect("../statics/manage/updateload.jsp");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
