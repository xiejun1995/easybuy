package com.easybuy.dao.massage;
import com.easybuy.pojo.EasyBuy_Comment;
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
    public int addCommodity(EasyBuy_Comment comment) {
        String sql="INSERT INTO `easybuy_comment`(`ec_id`,`ec_content`,`ec_create_time`,`ec_reply`,`ec_reply_time`,`ec_nick_name`) VALUES(?,?,?,?,?,?)";
        Object[] objects={comment.getEc_id(),comment.getEc_content(),comment.getEc_create_time(),comment.getEc_reply(),comment.getEc_reply_time(),comment.getEc_nick_name()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }

        return result;
    }
    //添加编号，昵称，内容
    public int addCommodity1(EasyBuy_Comment comment) {
        String sql="INSERT INTO easybuy_comment(ec_id,ec_nick_name,ec_content) VALUES(?,?,?)";
        Object[] objects={comment.getEc_id(),comment.getEc_nick_name(),comment.getEc_content()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }

        return result;
    }

    //添加编号，回复，回复时间
    public int addCommodity2(EasyBuy_Comment comment) {
        String sql="INSERT INTO easybuy_comment(ec_id,setEc_reply,ec_reply_time) VALUES(?,?,?)";
        Object[] objects={comment.getEc_id(),comment.getEc_reply(),comment.getEc_reply_time()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }

        return result;
    }
    //关于留言的删除操作（根据id查询，返回一个对象）
    public int deleteCommodity(EasyBuy_Comment comment) {
        String sql="DELETE FROM easybuy_comment WHERE ec_id=?";
        Object[] objects={comment.getEc_id()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }

        return result;
    }

    //关于留言的修改（回复）操作
    public EasyBuy_Comment selectCommodityById(int id) {
        EasyBuy_Comment comment=null;
        String sql="SELECT * FROM easybuy_comment WHERE ec_id=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                int id2=rs.getInt("ec_id");
                String ec_content=rs.getString("ec_content");
                Date ec_create_time=rs.getDate("ec_create_time");
                String price=rs.getString("ec_reply");
                Date ec_reply_time=rs.getDate("ec_reply_time");
                String ec_nick_name=rs.getString("ec_nick_name");
                comment=new EasyBuy_Comment(id2,ec_content,ec_create_time,price,ec_reply_time,ec_nick_name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return comment;
    }
    //关于留言的添加操作（查询留言总条数）
    public int updateCommodity(EasyBuy_Comment comment) {
        String sql="UPDATE EasyBuy_Comment SET ec_nick_name=?,ec_reply=?,ec_reply_time=? WHERE ec_id=?";
        Object[] objects={comment.getEc_nick_name(),comment.getEc_reply(),comment.getEc_reply_time(),comment.getEc_id()};
        int result=BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("修改成功!");
        }
        return result;
    }
    //分页查询留言
    public int totalCount() {
        int count=0;
        String sql="SELECT COUNT(1) FROM `EasyBuy_Comment`";
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
    public List<EasyBuy_Comment> commodityList(int pageNo,int pageSize) {
        List<EasyBuy_Comment> list=new ArrayList<>();
        String sql="SELECT * FROM EasyBuy_Comment LIMIT ?,? ";
        Object[] objects={(pageNo-1 )*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){

                Integer ec_id=rs.getInt("ec_id");
                String ec_content=rs.getString("ec_content");
                Date ec_create_time=rs.getDate("ec_create_time");
                String price=rs.getString("ec_reply");
                Date ec_reply_time=rs.getDate("ec_reply_time");
                String ec_nick_name=rs.getString("ec_nick_name");

                EasyBuy_Comment comment=new EasyBuy_Comment(ec_id,ec_content,ec_create_time,price,ec_reply_time,ec_nick_name);
                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    //根据id查询分类总记录数
    public List<EasyBuy_Comment> commodityListById(int pageNo, int pageSize) {
        List<EasyBuy_Comment> list=new ArrayList<>();
        String sql="SELECT * FROM EasyBuy_Comment LIMIT ?,?";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("ec_id");
                String ec_content=rs.getString("ec_content");
                Date ec_create_time=rs.getDate("ec_create_time");
                String price=rs.getString("ec_reply");
                Date ec_reply_time=rs.getDate("ec_reply_time");
                String ec_nick_name=rs.getString("ec_nick_name");

                EasyBuy_Comment comment=new EasyBuy_Comment(id,ec_content,ec_create_time,price,ec_reply_time,ec_nick_name);
                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int totalCountById(int ec_id) {
        String sql="SELECT COUNT(1) FROM EasyBuy_Comment WHERE epc_id=?";
        Object[] objects={ec_id};
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

    @Override
    public EasyBuy_Comment MrssageById(int id) {
        EasyBuy_Comment comment=null;
        String sql="SELECT *  FROM  `easybuy_comment` WHERE ec_id=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id2=rs.getInt("ec_id");
                String ec_content=rs.getString("ec_content");
                Date ec_create_time=rs.getDate("ec_create_time");
                String price=rs.getString("ec_reply");
                Date ec_reply_time=rs.getDate("ec_reply_time");
                String ec_nick_name=rs.getString("ec_nick_name");

                comment=new EasyBuy_Comment(id2,ec_content,ec_create_time,price,ec_reply_time,ec_nick_name);
                System.out.println(comment.getEc_id()+"1111"+comment.getEc_nick_name());

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return comment;
    }
}
