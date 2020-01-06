package com.easybuy.filter.user;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录过滤器 不登录不能进入后台页面
 * @author Allen
 * @date 2019/12/31 11:22
 */
public class Login implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //如果是后台页面必须登录才能访问
        String path = request.getServletPath();
        if (path.startsWith("/manage")) {
            HttpSession httpSession = request.getSession(false);
                //判断是否登录
                if (httpSession !=null) {
                    String easyBuy_user = (String) httpSession.getAttribute("userName");
                        if (easyBuy_user!=null) {
                            chain.doFilter(req,resp);
                        }else {
                            response.sendRedirect("../statics/login.jsp");
                        }
                } else {
                    response.sendRedirect("../statics/login.jsp");
                }
        }else {
            chain.doFilter(req,resp);
        }
    }
    public void init(FilterConfig config) throws ServletException {

    }

}
