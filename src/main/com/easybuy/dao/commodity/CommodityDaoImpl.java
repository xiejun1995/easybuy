package com.easybuy.dao.commodity;

import com.easybuy.pojo.EasyBuyProduct;
import com.easybuy.util.BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 商品增删改查功能等具体实现类
 * @author Allen
 * @date 2019/12/23 16:28
 */

public class CommodityDaoImpl implements CommodityDao {

    @Override
    public int addCommodity(EasyBuyProduct buy) {
        String sql="INSERT INTO `EasybuyProduct`(`epName`,`epDescription`,`epPrice`,`epStock`,`epcId`,`epFileName`) VALUES(?,?,?,?,?,?)";
        Object[] objects={buy.getEpName(),buy.getEpDescription(),buy.getEpPrice(),buy.getEpStock(),buy.getEpcId(),buy.getEpFileName()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("添加成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    @Override
    public int deleteCommodity(EasyBuyProduct buy) {
        String sql="DELETE FROM EasybuyProduct WHERE epId=?";
        Object[] objects={buy.getEpId()};
        int result= BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("删除成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //根据id查询，返回一个商品对象
    @Override
    public EasyBuyProduct selectCommodityById(int id) {
        EasyBuyProduct buy=null;
        String sql="SELECT * FROM EasybuyProduct WHERE epId=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id2=rs.getInt("epId");
                String name=rs.getString("epName");
                String description=rs.getString("epDescription");
                Float price=rs.getFloat("epPrice");
                Integer stock=rs.getInt("epStock");
                Integer epcId=rs.getInt("epcId");
                Integer epcChildId=rs.getInt("epcChildId");
                String fileName=rs.getString("epFileName");
                buy=new EasyBuyProduct(id2,name,description,price,stock,epcId,epcChildId,fileName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return buy;
    }

    @Override
    public int updateCommodity(EasyBuyProduct buy) {
        String sql="UPDATE EasybuyProduct SET epName=?,epDescription=?,epPrice=?,epStock=?,epcId=?,epFileName=? WHERE epId=?";
        Object[] objects={buy.getEpName(),buy.getEpDescription(),buy.getEpPrice(),buy.getEpStock(),buy.getEpcId(),buy.getEpFileName(),buy.getEpId()};
        int result=BaseDao.getBaseDao().executeUpdate(sql,objects);
        if (result>0){
            System.out.println("修改成功!");
        }
        BaseDao.getBaseDao().closeResource();
        return result;
    }

    //查询总条数
    @Override
    public int totalCount() {
        int count=0;
        String sql="SELECT COUNT(1) FROM `EasybuyProduct`";
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
    public List<EasyBuyProduct> commodityList(int pageNo,int pageSize) {
        List<EasyBuyProduct> list=new ArrayList<>();
        String sql="SELECT * FROM EasybuyProduct LIMIT ?,? ";
        Object[] objects={(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("epId");
                String name=rs.getString("epName");
                String description=rs.getString("epDescription");
                Float price=rs.getFloat("epPrice");
                Integer stock=rs.getInt("epStock");
                Integer epcId=rs.getInt("epcId");
                Integer epcChildId=rs.getInt("epcChildId");
                String fileName=rs.getString("epFileName");

                EasyBuyProduct buy=new EasyBuyProduct(id,name,description,price,stock,epcId,epcChildId,fileName);
                list.add(buy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }

    //根据分类分页查询
    @Override
    public List<EasyBuyProduct> commodityListById(int epcId,int pageNo, int pageSize) {
        List<EasyBuyProduct> list=new ArrayList<>();
        String sql="SELECT * FROM EasybuyProduct WHERE epcId=? LIMIT ?,?";
        Object[] objects={epcId,(pageNo-1)*pageSize,pageSize};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                Integer id=rs.getInt("epId");
                String name=rs.getString("epName");
                String description=rs.getString("epDescription");
                Float price=rs.getFloat("epPrice");
                Integer stock=rs.getInt("epStock");
                Integer epcId2=rs.getInt("epcId");
                Integer epcChildId=rs.getInt("epcChildId");
                String fileName=rs.getString("epFileName");
                EasyBuyProduct buy=new EasyBuyProduct(id,name,description,price,stock,epcId2,epcChildId,fileName);
                list.add(buy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }

    public int totalCountById(int epcId) {
        String sql="SELECT COUNT(1) FROM EasybuyProduct WHERE epcId=?";
        Object[] objects={epcId};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        int count=0;
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

    //查询特定编号商品
    public EasyBuyProduct getProdusById(int id) {
        EasyBuyProduct product = new EasyBuyProduct();
        String sql="SELECT epName,epDescription,epPrice,epStock,epFileName FROM EasybuyProduct WHERE epId=?";
        Object[] objects={id};
        ResultSet rs=BaseDao.getBaseDao().executeSQL(sql,objects);
        try {
            while (rs.next()){
                String name=rs.getString("epName");
                String description=rs.getString("epDescription");
                Float price=rs.getFloat("epPrice");
                Integer stock=rs.getInt("epStock");
                String fileName = rs.getString("epFileName");

                product.setEpName(name);
                product.setEpDescription(description);
                product.setEpPrice(price);
                product.setEpStock(stock);
                product.setEpFileName(fileName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return product;
    }
    //获取商品的总数据量
    public int getTotalCount(){
        int total = 0;
        String sql = "SELECT COUNT(1) FROM EasybuyProduct";
        Object [] objects = {};
        ResultSet rs = BaseDao.getBaseDao().executeSQL(sql, objects);
        try {
            while(rs.next()){
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return total;
    }

    //分页查询所有商品信息
    public List<EasyBuyProduct> getProductsList(int pageNo,int pageSize) {
        List list = new ArrayList();
        String sql = "SELECT * FROM EasybuyProduct LIMIT ?,?";
        Object [] objects = {(pageNo-1)*pageSize,pageSize};
        ResultSet rs = BaseDao.getBaseDao().executeSQL(sql, objects);
        try {
            while(rs.next()){
                int id = rs.getInt("epId");
                String name=rs.getString("epName");
                String description=rs.getString("epDescription");
                Float price=rs.getFloat("epPrice");
                Integer stock=rs.getInt("epStock");
                String fileName = rs.getString("epFileName");

                EasyBuyProduct product = new EasyBuyProduct();
                product.setEpId(id);
                product.setEpName(name);
                product.setEpDescription(description);
                product.setEpPrice(price);
                product.setEpStock(stock);
                product.setEpFileName(fileName);

                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        BaseDao.getBaseDao().closeResource();
        return list;
    }
}
