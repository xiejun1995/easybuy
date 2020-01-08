package com.easybuy.dao.commodity;


import com.easybuy.pojo.Classify;
import com.easybuy.util.BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 曹译
 * 日期：2019-12-29
 * desc：
 */
public class ClassifyDaoImpl implements ClassifyDao {

    @Override
    public int addClassify(Classify clfy) {
        String sql="INSERT INTO `EasybuyProductCategory`(`epcName`,`epcParentId`) VALUES(?,?)";
        Object[] objects={clfy.getEpcName(),clfy.getEpcParentId()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    @Override
    public int deleteClassify(Classify clfy) {
        String sql="DELETE FROM EasybuyProductCategory WHERE epcId=?";
        Object[] objects={clfy.getEpcId()};
        int result=BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    @Override
    public int updateClassify(Classify clfy) {
        String sql="UPDATE EasybuyProductCategory  SET epcName=?,epcParentId=? WHERE epcId=?";
        Object[] objects={clfy.getEpcName(),clfy.getEpcParentId(),clfy.getEpcId()};
        int result=BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("修改成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    @Override
    public int totalCount() {
        int count=0;
        String sql="select count(1) from EasybuyProductCategory";
        Object[] objects={};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return count;
    }

    @Override
    public List<Classify> Classifylist(int pageNo,int pageSize) {
        List<Classify> list=new ArrayList<>();
        String sql="SELECT * FROM EasybuyProductCategory LIMIT ?,?";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while(rs.next()){
                Integer id=rs.getInt("epcId");
                String name=rs.getString("epcName");
                Integer parentIid=rs.getInt("epcParentId");
                Classify clfy=new Classify(id,name,parentIid);
                list.add(clfy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }

    //查询所有父分类
    @Override
    public List<Classify> ClassifyFid() {
        List<Classify> list=new ArrayList<>();
        String sql="SELECT * FROM EasybuyProductCategory WHERE epcParentId=0";
        Object[] objects={};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("epcId");
                String name=rs.getString("epcName");
                Integer parentId=rs.getInt("epcParentId");
                Classify clfy=new Classify(id,name,parentId);
                list.add(clfy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }

    @Override
    public List<Classify> ClassifyAll() {
        List<Classify> list=new ArrayList<>();
        String sql="SELECT * FROM EasybuyProductCategory";
        Object[] objects={};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while(rs.next()){
                Integer id2=rs.getInt("epcId");
                String name=rs.getString("epcName");
                Integer parentId=rs.getInt("epcParentId");
                Classify clfy=new Classify(id2,name,parentId);
                list.add(clfy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }

    @Override
    public Classify ClassifyById(int id) {
        Classify clfy=null;
        String sql="SELECT * FROM EasybuyProductCategory WHERE epcId=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id2=rs.getInt("epcId");
                String name=rs.getString("epcName");
                Integer parentId=rs.getInt("epcParentId");
                 clfy=new Classify(id2,name,parentId);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return clfy;
    }
}

