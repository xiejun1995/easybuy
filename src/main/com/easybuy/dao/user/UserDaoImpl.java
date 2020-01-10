package com.easybuy.dao.user;

import com.easybuy.pojo.EasyBuyUser;
import com.easybuy.util.BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 用户增删改查功能等具体实现类
 * @author Allen
 * @date 2019/12/23 16:28
 */
public class UserDaoImpl implements UserDao {

    @Override
    //用户注册
    public boolean setUser(EasyBuyUser easyBuyUser) {
        boolean flag = false;
        String sql = "INSERT INTO easyBuyUser (userId,userName,passWords,sex,birthday,identityCode,email,mobile,address,login,statuss) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        Object[] objects = {easyBuyUser.getUserId(),easyBuyUser.getUserName(),easyBuyUser.getPassWords(),
                        easyBuyUser.getSex(),easyBuyUser.getBirthday(),easyBuyUser.getIdentityCode(),
                        easyBuyUser.getEmail(),easyBuyUser.getMobile(),easyBuyUser.getAddress(),
                        easyBuyUser.getLogin(),easyBuyUser.getStatuss()};
        int i = BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (i>0) {
            flag = true;
        }
        return flag;
    }

    @Override
    //通过ID查找用户
    public EasyBuyUser getUser(String id) {
        EasyBuyUser easyBuyUser = new EasyBuyUser();
        String sql = "SELECT * FROM easyBuyUser WHERE userId=?";
        Object[] objects = {id};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                String userId = resultSet.getString("userId");
                String userName = resultSet.getString("userName");
                String passWords = resultSet.getString("passWords");
                String sex = resultSet.getString("sex");
                Date birthday = resultSet.getDate("birthday");
                String identityCode = resultSet.getString("identityCode");
                String email = resultSet.getString("email");
                String mobile = resultSet.getString("mobile");
                String address = resultSet.getString("address");
                double login = resultSet.getDouble("login");
                int statuss = resultSet.getInt("statuss");

                easyBuyUser.setUserId(userId);
                easyBuyUser.setUserName(userName);
                easyBuyUser.setPassWords(passWords);
                easyBuyUser.setSex(sex);
                easyBuyUser.setBirthday(birthday);
                easyBuyUser.setIdentityCode(identityCode);
                easyBuyUser.setEmail(email);
                easyBuyUser.setMobile(mobile);
                easyBuyUser.setAddress(address);
                easyBuyUser.setLogin(login);
                easyBuyUser.setStatuss(statuss);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return easyBuyUser;
    }

    @Override
    //分页查询用户
    public List<EasyBuyUser> getPageUserList(int pageNo, int pageSize) {
        List<EasyBuyUser> list = new ArrayList<EasyBuyUser>();
        String sql = "SELECT userId,userName,sex,email,mobile,statuss FROM easyBuyUser LIMIT ?,?";
        Object[] objects = {(pageNo-1)*pageSize,pageSize};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                String userId = resultSet.getString("userId");
                String userName = resultSet.getString("userName");
                String sex = resultSet.getString("sex");
                String email = resultSet.getString("email");
                String mobile = resultSet.getString("mobile");
                int statuss = resultSet.getInt("statuss");

                EasyBuyUser easyBuyUser = new EasyBuyUser();
                easyBuyUser.setUserId(userId);
                easyBuyUser.setUserName(userName);
                easyBuyUser.setSex(sex);
                easyBuyUser.setEmail(email);
                easyBuyUser.setMobile(mobile);
                easyBuyUser.setStatuss(statuss);
                list.add(easyBuyUser);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.getBaseDao().closeResource();
        }
        return list;
    }

    @Override
    //修改用户信息
    public boolean updateUser(EasyBuyUser easyBuyUser) {
        String sql = "UPDATE easyBuyUser SET userName=?,passWords=?,sex=?,birthday=?,mobile=?,address=? WHERE userId=?";
        Object[] objects = {easyBuyUser.getUserName(),easyBuyUser.getPassWords(),easyBuyUser.getSex(),
                easyBuyUser.getBirthday(),easyBuyUser.getMobile(),
                easyBuyUser.getAddress(),easyBuyUser.getUserId()};
        int i = BaseDao.getBaseDao().executeUpdate(sql,objects);
        boolean flag = false;
        if (i>0) {
            flag = true;
        }
        System.out.println(i);
        return flag;
    }

    @Override
    //删除用户
    public boolean deleteUser(EasyBuyUser easyBuyUser) {
        String sql = "DELETE FROM easyBuyUser WHERE userId=?";
        Object[] objects = {easyBuyUser.getUserId()};
        BaseDao.getBaseDao().executeUpdate(sql,objects);
        return true;
    }

    @Override
    //查询总用户量
    public int getTotalCount() {
        int total = 0;
        String sql = "SELECT COUNT(1) FROM easyBuyUser";
        Object[] objects = {};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                total = resultSet.getInt(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    @Override
    //登录验证用户是否存在
    public EasyBuyUser login(EasyBuyUser easyBuyUser) {
        String sql = "SELECT * FROM easyBuyUser WHERE userId=? AND passWords=?";
        Object[] objects = {easyBuyUser.getUserId(),easyBuyUser.getPassWords()};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                String userId = resultSet.getString("userId");
                String passWords = resultSet.getString("passWords");

                easyBuyUser.setUserId(userId);
                easyBuyUser.setPassWords(passWords);
                return easyBuyUser;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
