package com.easybuy.service.massage;

import com.easybuy.dao.massage.MessageDao;
import com.easybuy.dao.massage.MessageDaoImpl;
import com.easybuy.pojo.EasyBuyComment;


import java.util.List;

/**
 * 留言业务层具体实现类
 * @author Allen
 * @date 2019/12/23 16:32
 */
public class ServiceMassageDaoImpl implements ServiceMassageDao {
    MessageDao dao=new MessageDaoImpl();
    //添加全部留言
    public int addCommodity(EasyBuyComment comment) { return dao.addCommodity(comment); }
    //添加特定留言
    public int addCommodity1(EasyBuyComment comment) {
        return dao.addCommodity1(comment);
    }
    //添加特定留言（回复内容和回复时间）
    public int addCommodity2(EasyBuyComment comment) {
        return dao.addCommodity2(comment);
    }
    //删除留言
    public int deleteCommodity(EasyBuyComment comment) {
        return dao.deleteCommodity(comment);
    }
    //修改留言
    public int updateCommodity(EasyBuyComment comment) {
        return dao.updateCommodity(comment);
    }
    //根据id查询，返回一个商品对象
    public EasyBuyComment selectCommodityById(int id) {
        return dao.selectCommodityById(id);
    }
    //查询留言总条数
    public int totalCount() {
        return dao.totalCount();
    }
    //查询留言
    public List<EasyBuyComment> commodityList(int pageNo, int pageSize) {
        return dao.commodityList(pageNo,pageSize);
    }
    //根据分类分页查询
    public List<EasyBuyComment> commodityListById( int pageNo, int pageSize) { return dao.commodityListById(pageNo,pageSize); }

    public int totalCountById(int ec_id) {
        return dao.totalCountById(ec_id);
    }

    public EasyBuyComment MrssageById(int id) {
        return dao.MrssageById(id);
    }

}
