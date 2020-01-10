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
 * 用户登录
 * @author Allen
 * @date 2019/12/27 17:23
 */
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //获取请求参数
        String userName = request.getParameter("userId");
        String userPass = request.getParameter("password");


        //封装对象
        EasyBuyUser loginuser = new EasyBuyUser();
        loginuser.setUserId(userName);
        loginuser.setPassWords(userPass);

        //调用方法查询该用户
        ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
        EasyBuyUser easyBuyuser = serviceUserDao.login(loginuser);

        //判断
        if (easyBuyuser!=null) {
            session.setAttribute("userName",userName);
            request.setAttribute("easyBuyuser",easyBuyuser);
            switch (easyBuyuser.getStatuss()) {
                case 1 :
                    request.getRequestDispatcher("../statics/loginload.jsp").forward(request,response);
                    break;
                case 2:
                    request.getRequestDispatcher("../statics/manage/index.jsp").forward(request,response);
                    break;
                case 3:
                    request.getRequestDispatcher("../statics/manage/index.jsp").forward(request,response);
                    break;
                default:
                    break;

            }
//            if (easyBuyuser.getStatuss()>1) {
//                request.getRequestDispatcher("../statics/manage/index.jsp").forward(request,response);
//            }else {
//                request.getRequestDispatcher("loginload.jsp").forward(request,response);
//            }
        }else {
            response.sendRedirect("../statics/loginfa.jsp");
            //request.getRequestDispatcher("/statics/loginfa.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
