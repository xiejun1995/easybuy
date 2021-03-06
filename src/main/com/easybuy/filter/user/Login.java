package com.easybuy.filter.user;


import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.service.user.ServiceUserDao;
import com.easybuy.service.user.ServiceUserDaoImpl;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录过滤器 不是商家或者管理员不允许进入后台
 * @author Allen
 * @date 2019/12/31 11:22
 */
public class Login implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        /**
         * 查询用户权限 普通用户无法进入后台 管理员和商家可以进入
         */
//        EasyBuyUser easyBuyUser = new EasyBuyUser();
//        int statuss = easyBuyUser.getStatuss();
//        if (statuss>2) {
//            chain.doFilter(req,resp);
//        }else {
//            response.sendRedirect("../login.jsp");
//        }


        //如果是后台页面必须登录才能访问
        String path = request.getServletPath();
        if (path.startsWith("/statics/manage")) {
            HttpSession session = request.getSession();
                //判断是否登录
                if (session !=null) {
                    String user = (String) session.getAttribute("userName");
                    ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();
                    EasyBuyUser easyBuyUser = serviceUserDao.getUser(user);
                    if (easyBuyUser.getStatuss()>1) {
                        chain.doFilter(req,resp);
                    }else {
                        response.sendRedirect("../login.jsp");
                    }
                } else {
                    response.sendRedirect("../login.jsp");
                }
        }

    }
    public void init(FilterConfig config) throws ServletException {

    }

}
