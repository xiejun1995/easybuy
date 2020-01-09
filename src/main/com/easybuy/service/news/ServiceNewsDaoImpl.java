package com.easybuy.service.news;

import com.easybuy.dao.news.NewsDao;
import com.easybuy.dao.news.NewsDaoImpl;
import com.easybuy.pojo.EasyBuyNews;

import java.util.List;

/**
 * @author Allen
 * @date 2020/1/2 21:11
 */
public class ServiceNewsDaoImpl implements ServiceNewsDao{
    NewsDao newsDao = new NewsDaoImpl();

    public int addCommodity(EasyBuyNews news) {
        return newsDao.addCommodity(news);
    }

    public int delete(EasyBuyNews news) {
        return newsDao.delete(news);
    }

    public int update(EasyBuyNews news) {
        return newsDao.update(news);
    }

    public int totalCount() {
        return newsDao.totalCount();
    }

    public List<EasyBuyNews> commodityList(int pageNo, int pageSize) {
        return newsDao.commodityList(pageNo,pageSize);
    }

    @Override
    public EasyBuyNews getProdusById(int Id) {
        return newsDao.getProdusById(Id);
    }


}
