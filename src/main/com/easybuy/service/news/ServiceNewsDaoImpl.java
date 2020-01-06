package com.easybuy.service.news;

import com.easybuy.dao.news.NewsDao;
import com.easybuy.dao.news.NewsDaoImpl;
import com.easybuy.pojo.EasyBuy_News;

import java.util.List;

/**
 * @author Allen
 * @date 2020/1/2 21:11
 */
public class ServiceNewsDaoImpl implements ServiceNewsDao{
    NewsDao newsDao = new NewsDaoImpl();

    public int addCommodity(EasyBuy_News news) {
        return newsDao.addCommodity(news);
    }

    public int delete(EasyBuy_News news) {
        return newsDao.delete(news);
    }

    public int update(EasyBuy_News news) {
        return newsDao.update(news);
    }

    public int totalCount() {
        return newsDao.totalCount();
    }

    public List<EasyBuy_News> commodityList(int pageNo, int pageSize) {
        return newsDao.commodityList(pageNo,pageSize);
    }

    @Override
    public EasyBuy_News getProdusById(int id) {
        return newsDao.getProdusById(id);
    }


}
