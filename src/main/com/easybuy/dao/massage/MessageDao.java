package com.easybuy.dao.massage;

import com.easybuy.pojo.EasyBuy_Comment;
import com.easybuy.pojo.EasyBuy_Product;

import java.util.List;

/**
 * 商品增删改查功能等接口
 * @author Allen
 * @date 2019/12/23 16:28
 */
public interface MessageDao {
    //添加留言
    int addCommodity(EasyBuy_Comment comment);
    int addCommodity1(EasyBuy_Comment comment);
    int addCommodity2(EasyBuy_Comment comment);
    //删除
    int deleteCommodity(EasyBuy_Comment comment);
    //根据id查询，返回一个对象
    EasyBuy_Comment selectCommodityById(int id);
    //修改留言
    int updateCommodity(EasyBuy_Comment comment);
    //查询留言总条数
    int totalCount();
    //分页查询留言
    List<EasyBuy_Comment> commodityList(int pageNo, int pageSize);
    //根据分类分页查询
    List<EasyBuy_Comment> commodityListById(int pageNo, int pageSize);
    //根据id查询分类总记录数
    int totalCountById(int ec_id);

    EasyBuy_Comment MrssageById(int id);



}
