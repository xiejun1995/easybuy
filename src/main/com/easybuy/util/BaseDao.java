package com.easybuy.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

/**
 * 数据库操作基类
 * 获取连接 关闭资源 增删改查
 * @author Allen
 * @date 2019/12/23 16:23
 */
public class BaseDao {
    //获取连接
    Connection connection = null;
    PreparedStatement pstm = null;
    ResultSet resultSet = null;

    //饿汉模式
    private  BaseDao() {}
    private static BaseDao baseDao = new BaseDao();
    public static BaseDao getBaseDao() {
        return baseDao;
    }

    //获得数据库连接
    public boolean getConnection2() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            /*172.16.0.114
            * xj18793898395
            * */
            String url = "jdbc:mysql://localhost:3306/ymw?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8";
            String username = "root";
            String password = "caoyi1";
            connection = DriverManager.getConnection(url, username, password);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
            return false;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //使用数据源获取数据库连接
    public Boolean getConnection(){
        try {
            //初始化上下文
            Context cxt = new InitialContext();
            //获取与逻辑名相关联的连接对象
            DataSource ds = (DataSource)cxt.lookup("java:comp/env/jdbc/ymw");
            //通过数据源获取数据连接
            connection = ds.getConnection();
        } catch (NamingException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //增删改
    public int executeUpdate(String sql,Object [] objects){
        int result = 0;
        if(this.getConnection()){
            try {
                pstm = connection.prepareStatement(sql);
                if(objects!=null) {
                    for(int i=0;i<objects.length;i++){
                        pstm.setObject(i+1, objects[i]);
                    }
                }
                result = pstm.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    //查
    public ResultSet executeSQL(String sql,Object[]objects){
        this.getConnection2();
        try {
            pstm = connection.prepareStatement(sql);
            for(int i=0;i<objects.length;i++){
                pstm.setObject(i+1, objects[i]);
            }
            resultSet = pstm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    //释放资源
    public boolean closeResource(){
        if(resultSet !=null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        if(pstm !=null){
            try {
                pstm.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        if(connection !=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }
}
