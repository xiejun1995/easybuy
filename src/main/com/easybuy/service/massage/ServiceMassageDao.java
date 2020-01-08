package com.easybuy.service.massage;

import com.easybuy.pojo.EasyBuyComment;
import com.easybuy.pojo.EasyBuyProduct;

import java.util.List;

/**
 * 留言业务层实现接口
 * @author Allen
 * @date 2019/12/23 16:24
 */
public interface ServiceMassageDao {
    //添加留言
    int addCommodity(EasyBuyComment comment);
    int addCommodity1(EasyBuyComment comment);
    int addCommodity2(EasyBuyComment comment);
    //删除留言
    int deleteCommodity(EasyBuyComment comment);
    //修改留言
    int updateCommodity(EasyBuyComment comment);
    //根据id查询，返回一个留言对象
    EasyBuyComment selectCommodityById(int id);
    //查询总条数
    int totalCount();
    //查询留言
    List<EasyBuyComment> commodityList(int pageNo, int pageSize);
    //根据分类分页查询
    List<EasyBuyComment> commodityListById(int pageNo, int pageSize);
    //根据id查询分类总记录数
    int totalCountById(int ecId);

    EasyBuyComment MrssageById(int id);



}
