package com.easybuy.dao.user;

import com.easybuy.pojo.EasyBuyUser;

import java.util.List;

/**
 * 用户增删改查功能等接口
 * @author Allen
 * @date 2019/12/23 16:28
 */
public interface UserDao {

    //注册功能
    boolean setUser(EasyBuyUser easyBuyUser);

    //通过ID查找用户信息
    EasyBuyUser getUser(int id);

    //分页查询用户
    List<EasyBuyUser> getPageUserList(int pageNo,int pageSize);

    //修改用户信息(管理员操作)
    boolean updateUser(EasyBuyUser easyBuyUser);

    //删除用户(管理员操作)
    boolean deleteUser(EasyBuyUser easyBuyUser);

    //查询总用户量
    int getTotalCount();

    //登录验证用户是否存在
    EasyBuyUser login(EasyBuyUser easyBuyUser);
}
