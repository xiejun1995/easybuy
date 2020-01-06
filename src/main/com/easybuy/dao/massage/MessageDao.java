package com.easybuy.dao.massage;

import com.easybuy.pojo.EasyBuyComment;
import com.easybuy.pojo.EasyBuyProduct;

import java.util.List;

/**
 * 商品增删改查功能等接口
 * @author Allen
 * @date 2019/12/23 16:28
 */
public interface MessageDao {
    //添加留言
    int addCommodity(EasyBuyComment comment);
    int addCommodity1(EasyBuyComment comment);
    int addCommodity2(EasyBuyComment comment);
    //删除
    int deleteCommodity(EasyBuyComment comment);
    //根据id查询，返回一个对象
    EasyBuyComment selectCommodityById(int id);
    //修改留言
    int updateCommodity(EasyBuyComment comment);
    //查询留言总条数
    int totalCount();
    //分页查询留言
    List<EasyBuyComment> commodityList(int pageNo, int pageSize);
    //根据分类分页查询
    List<EasyBuyComment> commodityListById(int pageNo, int pageSize);
    //根据id查询分类总记录数
    int totalCountById(int ec_id);

    EasyBuyComment MrssageById(int id);



}
