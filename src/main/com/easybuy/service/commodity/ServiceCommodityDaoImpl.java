package com.easybuy.service.commodity;

import com.easybuy.dao.commodity.CommodityDao;
import com.easybuy.dao.commodity.CommodityDaoImpl;
import com.easybuy.pojo.EasyBuyProduct;

import java.util.List;

/**
 * 商品业务层具体实现类
 * @author Allen
 * @date 2019/12/23 16:32
 */
public class ServiceCommodityDaoImpl implements ServiceCommodityDao {
    CommodityDao dao=new CommodityDaoImpl();

    @Override
    public int addCommodity(EasyBuyProduct buy) {
        return dao.addCommodity(buy);
    }

    @Override
    public int deleteCommodity(EasyBuyProduct buy) {
        return dao.deleteCommodity(buy);
    }

    @Override
    public int updateCommodity(EasyBuyProduct buy) {
        return dao.updateCommodity(buy);
    }

    //根据id查询，返回一个商品对象
    @Override
    public EasyBuyProduct selectCommodityById(int id) {
        return dao.selectCommodityById(id);
    }

    @Override
    public int totalCount() {
        return dao.totalCount();
    }

    @Override
    public List<EasyBuyProduct> commodityList(int pageNo, int pageSize) {
        return dao.commodityList(pageNo,pageSize);
    }

    @Override
    public List<EasyBuyProduct> commodityListById(int epc_id, int pageNo, int pageSize) {
        return dao.commodityListById(epc_id,pageNo,pageSize);
    }

    @Override
    public int totalCountById(int epc_id) {
        return dao.totalCountById(epc_id);
    }

    //查询特定编号商品信息
    public EasyBuyProduct getProdusById(int id) {
        return dao.getProdusById(id);
    }
    //获取商品的总数据量
    public int getTotalCount(){
        return  dao.getTotalCount();
    }
    //分页查询所有商品信息
    public List<EasyBuyProduct> getProductsList(int pageNo,int pageSize){
        return dao.getProductsList(pageNo,pageSize);
    }

}
