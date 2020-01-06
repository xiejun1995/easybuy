package com.easybuy.service.user;

import com.easybuy.dao.user.UserDao;
import com.easybuy.dao.user.UserDaoImpl;
import com.easybuy.pojo.EasyBuyUser;

import java.util.List;

/**
 * 用户业务层具体实现类
 * @author Allen
 * @date 2019/12/23 16:32
 */
public class ServiceUserDaoImpl implements ServiceUserDao {

    UserDao userDao = new UserDaoImpl();
    @Override
    public boolean setUser(EasyBuyUser easyBuyUser) {
        return userDao.setUser(easyBuyUser);
    }

    @Override
    public EasyBuyUser getUser(int id) {
        return userDao.getUser(id);
    }

    @Override
    public List<EasyBuyUser> getPageUserList(int pageNo, int pageSize) {
        return userDao.getPageUserList(pageNo,pageSize);
    }

    @Override
    public boolean updateUser(EasyBuyUser easyBuyUser) {
        return  userDao.updateUser(easyBuyUser);

    }

    @Override
    public boolean deleteUser(EasyBuyUser easyBuyUser) {
        return userDao.deleteUser(easyBuyUser);
    }

    @Override
    public int getTotalCount() {
        return userDao.getTotalCount();
    }

    @Override
    public EasyBuyUser login(EasyBuyUser easyBuyUser) {
        return userDao.login(easyBuyUser);
    }
}
