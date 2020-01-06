package com.easybuy.dao.news;

import com.easybuy.pojo.EasyBuy_News;
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
    public int addCommodity(EasyBuy_News news) {
        String sql="INSERT INTO `easybuy_news`(`en_id`,`en_title`,`en_content`,`en_create_time`) VALUES(?,?,?,?)";
        Object[] objects={news.getEn_id(),news.getEn_title(),news.getEn_content(),news.getEn_create_time()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //删除新闻
    public int delete(EasyBuy_News news) {
        String sql="DELETE FROM easybuy_news WHERE en_id=?";
        Object[] objects={news.getEn_id()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //修改新闻
    public int update(EasyBuy_News news) {
        String sql="UPDATE easybuy_news SET `en_id`=?,`en_title`=?,`en_content`=?,`en_create_time`=? WHERE en_id=?";
        Object[] objects={news.getEn_id(),news.getEn_title(),news.getEn_content(),news.getEn_create_time()};
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
        String sql="SELECT COUNT(1) FROM `easybuy_news`";
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
    public List<EasyBuy_News> commodityList( int pageNo, int pageSize) {
        List<EasyBuy_News> list=new ArrayList<>();
        String sql="SELECT * FROM easybuy_news  LIMIT ?,?";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("en_id");
                String title=rs.getString("en_title");
                String content=rs.getString("en_content");
                Date time=rs.getTimestamp("en_create_time");
                EasyBuy_News news=new EasyBuy_News(id,title,content,time);
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;

    }

    //查询特定新闻编号
    public EasyBuy_News getProdusById(int id) {
        EasyBuy_News easyBuy_news = new EasyBuy_News();
        String sql = "SELECT en_title,en_content FROM easybuy_news WHERE en_id=?";
        Object[] objects = {id};
        ResultSet resultSet = BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (resultSet.next()) {
                String en_title = resultSet.getString("en_title");
                String en_content = resultSet.getString("en_content");
                System.out.println(en_title+en_content);
                easyBuy_news.setEn_title(en_title);
                easyBuy_news.setEn_content(en_content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return easyBuy_news;
    }



}

