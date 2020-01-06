package com.easybuy.servlet.user;

import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.service.user.ServiceUserDao;
import com.easybuy.service.user.ServiceUserDaoImpl;
import com.easybuy.util.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 分页查询用户
 * @author Allen
 * @date 2019/12/27 16:39
 */
public class GetUserList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceUserDao serviceUserDao = new ServiceUserDaoImpl();

        //当前页码
        String currentPage = request.getParameter("pageIndex");
        if (currentPage==null) {
            currentPage = "1";
        }
        int pageIndex = Integer.parseInt(currentPage);

        //获取用户总数量
        int totalCount = serviceUserDao.getTotalCount();

        //页面显示数量
        int pageSize = 5;

        //获取总页数
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageNo(pageIndex);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);

        //总页数
        int totalPage = pageSupport.getTotalPageCount();

        //控制首页和尾页
        if (pageIndex < 1) {
            pageIndex = 1;
        } else if (pageIndex > totalPage) {
            pageIndex = totalPage;
        }
        List<EasyBuyUser> list = serviceUserDao.getPageUserList(pageIndex,pageSize);

        request.setAttribute("list",list);
        request.setAttribute("pageIndex",pageIndex);
        request.setAttribute("totalCount",totalCount);
        request.setAttribute("totalPage",totalPage);

        request.getRequestDispatcher("/statics/manage/user.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
