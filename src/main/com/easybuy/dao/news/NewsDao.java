package com.easybuy.dao.news;


import com.easybuy.pojo.EasyBuyNews;

import java.util.List;

/**
 * 新闻增删改查功能等接口
 * @author Allen
 * @date 2019/12/23 16:28
 */
public interface NewsDao {
    //添加新闻
    int addCommodity(EasyBuyNews news);
    //删除新闻
    int delete(EasyBuyNews news);
    //修改新闻
    int update(EasyBuyNews news);
    //查询总数据
    int totalCount();
    //分页查询新闻
    List<EasyBuyNews> commodityList(int pageNo, int pageSize);
    //查询特定新闻编号
    EasyBuyNews getProdusById(int id);


}
