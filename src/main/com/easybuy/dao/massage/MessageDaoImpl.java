package com.easybuy.dao.massage;
import com.easybuy.pojo.EasyBuyComment;
import com.easybuy.util.BaseDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * 留言增删改查功能等具体实现类
 * @author Allen
 * @date 2019/12/23 16:28
 */
public class MessageDaoImpl implements MessageDao {
    //添加全部留言操作处理
    public int addCommodity(EasyBuyComment comment) {
        String sql="INSERT INTO `easybuycomment`(ecId,ecContent,ecCreateTime,ecReply,ecReplyTime,ecNickName) VALUES(?,?,?,?,?,?)";
        Object[] objects={comment.getEcId(),comment.getEcContent(),comment.getEcCreateTime(),comment.getEcReply(),comment.getEcReplyTime(),comment.getEcNickName()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        return result;
    }
    //添加编号，昵称，内容
    public int addCommodity1(EasyBuyComment comment) {
        String sql="INSERT INTO easybuycomment(ecId,ecNickName,ecContent) VALUES(?,?,?)";
        Object[] objects={comment.getEcId(),comment.getEcNickName(),comment.getEcContent()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        return result;
    }
    //添加编号，回复，回复时间
    public int addCommodity2(EasyBuyComment comment) {
        String sql="INSERT INTO easybuycomment(ecId,setEcReply,ecReplyTime) VALUES(?,?,?)";
        Object[] objects={comment.getEcId(),comment.getEcReply(),comment.getEcReplyTime()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        return result;
    }
    //关于留言的删除操作（根据id查询，返回一个对象）
    public int deleteCommodity(EasyBuyComment comment) {
        String sql="DELETE FROM easybuycomment WHERE ecId=?";
        Object[] objects={comment.getEcId()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }
        return result;
    }
    //关于留言的修改（回复）操作
    public EasyBuyComment selectCommodityById(int id) {
        EasyBuyComment comment=null;
        String sql="SELECT * FROM easybuycomment WHERE ecId=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                int id2=rs.getInt("ecId");
                String ecContent=rs.getString("ecContent");
                Date ecCreateTime=rs.getDate("ecCreateTime");
                String ecReply=rs.getString("ecReply");
                Date ecReplyRime=rs.getDate("ecReplyRime");
                String ecNickName=rs.getString("ecNickName");
                comment=new EasyBuyComment(id2,ecContent,ecCreateTime,ecReply,ecReplyRime,ecNickName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }
    //关于留言的添加操作（查询留言总条数）
    public int updateCommodity(EasyBuyComment comment) {
        String sql="UPDATE EasyBuyComment SET ecNickName=?,ecReply=?,ecReplyTime=? WHERE ecId=?";
        Object[] objects={comment.getEcNickName(),comment.getEcReply(),comment.getEcReplyTime(),comment.getEcId()};
        int result=BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("修改成功!");
        }
        return result;
    }
    //分页查询留言
    public int totalCount() {
        int count=0;
        String sql="SELECT COUNT(1) FROM `EasyBuyComment`";
        Object[] objects={};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while(rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    //根据分类分页查询
    public List<EasyBuyComment> commodityList(int pageNo,int pageSize) {
        List<EasyBuyComment> list=new ArrayList<>();
        String sql="SELECT * FROM EasyBuyComment LIMIT ?,? ";
        Object[] objects={(pageNo-1 )*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){

                Integer ecId=rs.getInt("ecId");
                String ecContent=rs.getString("ecContent");
                Date ecCreateTime=rs.getDate("ecCreateTime");
                String ecReply=rs.getString("ecReply");
                Date ecReplyTime=rs.getDate("ecReplyTime");
                String ecNickName=rs.getString("ecNickName");

                EasyBuyComment comment=new EasyBuyComment(ecId,ecContent,ecCreateTime,ecReply,ecReplyTime,ecNickName);
                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //根据id查询分类总记录数
    public List<EasyBuyComment> commodityListById(int pageNo, int pageSize) {
        List<EasyBuyComment> list=new ArrayList<>();
        String sql="SELECT * FROM EasyBuyComment LIMIT ?,?";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){

                Integer ecId=rs.getInt("ecId");
                String ecContent=rs.getString("ecContent");
                Date ecCreateTime=rs.getDate("ecCreateTime");
                String ecReply=rs.getString("ecReply");
                Date ecReplyTime=rs.getDate("ecReplyTime");
                String ecNickName=rs.getString("ecNickName");

                EasyBuyComment comment=new EasyBuyComment(ecId,ecContent,ecCreateTime,ecReply,ecReplyTime,ecNickName);
                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //查询
    public int totalCountById(int ecId) {
        String sql="SELECT COUNT(1) FROM EasyBuyComment WHERE ecId=?";
        Object[] objects={ecId};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        int count=0;
        try {
            while(rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
    public EasyBuyComment MrssageById(int id) {
        EasyBuyComment comment=null;
        String sql="SELECT *  FROM  `easybuycomment` WHERE ecId=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id2=rs.getInt("ecId");
                String ecContent=rs.getString("ecContent");
                Date ecCreateTime=rs.getDate("ecCreateTime");
                String ecReply=rs.getString("ecReply");
                Date ecReplyTime=rs.getDate("ecReplyTime");
                String ecNickName=rs.getString("ecNickName");
                comment=new EasyBuyComment(id2,ecContent,ecCreateTime,ecReply,ecReplyTime,ecNickName);
                //验证是否接受
                //System.out.println(comment.getEcId()+"1111"+comment.getEcNickName());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }
}
