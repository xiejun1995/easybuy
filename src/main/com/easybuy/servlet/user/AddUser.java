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
 * 添加用户Servlet
 * @author Allen
 * @date 2019/12/25 19:41
 */
public class AddUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String userId = request.getParameter("userId");
            String userName = request.getParameter("userName");
            String passWords = request.getParameter("password");
            String sex = request.getParameter("sex");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String birthday1 = request.getParameter("birthday");
            Date birthday = simpleDateFormat.parse(birthday1);
            String identityCode = request.getParameter("identityCode");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            double login = 1;
            int statuss = 1;

            EasyBuyUser easyBuyUser = new EasyBuyUser();
            if (!userId.equals(userId)) {
                easyBuyUser.setUserId(userId);
            }else {
                response.sendRedirect("../statics/reg-fail.jsp");
            }
            easyBuyUser.setUserName(userName);
            easyBuyUser.setPassWords(passWords);
            easyBuyUser.setSex(sex);
            easyBuyUser.setBirthday(birthday);
            easyBuyUser.setIdentityCode(identityCode);
            if (email.length()<20) {
                easyBuyUser.setEmail(email);
            }else {
                response.sendRedirect("../statics/reg-fail.jsp");
            }
            easyBuyUser.setMobile(mobile);
            easyBuyUser.setAddress(address);
            easyBuyUser.setLogin(login);
            easyBuyUser.setStatuss(statuss);

            ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
            boolean flag = serviceUserDao.setUser(easyBuyUser);
            if (flag) {
                response.sendRedirect("../statics/reg-result.jsp");
            }


        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
