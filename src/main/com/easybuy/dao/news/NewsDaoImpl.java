package com.easybuy.dao.news;

import com.easybuy.pojo.EasyBuyNews;
import com.easybuy.util.BaseDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 新闻增删改查功能等具体实现类
 * @author Allen
 * @date 2019/12/23 16:28
 */
public class NewsDaoImpl implements NewsDao {
    //添加新闻
    public int addCommodity(EasyBuyNews news) {
        String sql="INSERT INTO `easybuynews`(`enId`,`enTitle`,`enContent`,`encreateTime`) VALUES(?,?,?,?)";
        Object[] objects={news.getEnId(),news.getEnTitle(),news.getEnContent(),news.getEnCreateTime()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //删除新闻
    public int delete(EasyBuyNews news) {
        String sql="DELETE FROM easybuynews WHERE enId=?";
        Object[] objects={news.getEnId()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //修改新闻
    public int update(EasyBuyNews news) {
        String sql="UPDATE easybuynews SET `enId`=?,`enTitle`=?,`enContent`=?,`encreateTime`=? WHERE enId=?";
        Object[] objects={news.getEnId(),news.getEnTitle(),news.getEnContent(),news.getEnCreateTime()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("修改成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }
    //查询总数据
    @Override
    public int totalCount() {
        int count=0;
        String sql="SELECT COUNT(1) FROM `easybuynews`";
        Object[] objects={};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while(rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return count;
    }

    @Override
    public List<EasyBuyNews> commodityList( int pageNo, int pageSize) {
        List<EasyBuyNews> list=new ArrayList<>();
        String sql="SELECT * FROM easybuynews  LIMIT ?,?";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("enId");
                String title=rs.getString("enTitle");
                String content=rs.getString("enContent");
                Date time=rs.getTimestamp("encreateTime");
                EasyBuyNews news=new EasyBuyNews(id,title,content,time);
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;

    }

    //查询特定新闻编号
    public EasyBuyNews getProdusById(int id) {
        EasyBuyNews easyBuynews = new EasyBuyNews();
        String sql = "SELECT enTitle,enContent FROM easybuynews WHERE enId=?";
        Object[] objects = {id};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                String enTitle = resultSet.getString("enTitle");
                String enContent = resultSet.getString("enContent");
                System.out.println(enTitle+enContent);
                easyBuynews.setEnTitle(enTitle);
                easyBuynews.setEnContent(enContent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return easyBuynews;
    }

}

