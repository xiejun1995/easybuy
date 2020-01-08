package com.easybuy.dao.commodity;

import com.easybuy.pojo.EasyBuyProduct;


import java.util.List;

/**
 * 商品增删改查功能等接口
 * @author Allen
 * @date 2019/12/23 16:28
 */
public interface CommodityDao {
    //添加商品
    int addCommodity(EasyBuyProduct buy);
    //删除商品
    int deleteCommodity(EasyBuyProduct buy);
    //根据id查询，返回一个商品对象
    EasyBuyProduct selectCommodityById(int id);
    //修改商品
    int updateCommodity(EasyBuyProduct buy);
    //查询总条数
    int totalCount();
    //分页查询商品
    List<EasyBuyProduct> commodityList(int pageNo, int pageSize);

    //根据分类分页查询
    List<EasyBuyProduct> commodityListById(int epcId, int pageNo, int pageSize);

    //根据id查询分类总记录数
    int totalCountById(int epcId);

    //查询特定编号商品
    EasyBuyProduct getProdusById(int id);
    //获取商品的总数据量
    int getTotalCount();
    //分页查询所有商品信息
    List<EasyBuyProduct> getProductsList(int pageNo,int pageSize);

}
