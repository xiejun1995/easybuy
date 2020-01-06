package com.easybuy.service.commodity;


import com.easybuy.dao.commodity.ClassifyDao;
import com.easybuy.dao.commodity.ClassifyDaoImpl;
import com.easybuy.pojo.Classify;
import com.easybuy.pojo.EasyBuyProduct;


import java.util.List;

/**
 * @author 曹译
 * 日期：2019-12-29
 * desc：
 */
public class ClassifyServiceImpl implements ClassifyService {
    ClassifyDao dao=new ClassifyDaoImpl();
    @Override
    public int addClassify(Classify clfy) {
        return dao.addClassify(clfy);
    }

    @Override
    public int deleteClassify(Classify clfy) {
        return dao.deleteClassify(clfy);
    }

    @Override
    public int updateClassify(Classify clfy) {
        return dao.updateClassify(clfy);
    }

    @Override
    public int totalCount() {
        return dao.totalCount();
    }


    @Override
    public List<Classify> Classifylist(int pageNo, int pageSize) {
        return dao.Classifylist(pageNo,pageSize);
    }

    @Override
    public List<Classify> ClassifyAll() {
        return dao.ClassifyAll();
    }

    //查询所有父分类
    @Override
    public List<Classify> ClassifyFid() {
        return dao.ClassifyFid();
    }

    @Override
    public Classify ClassifyById(int id) {
        return dao.ClassifyById(id);
    }

    @Override
    public List<EasyBuyProduct> commodityList(int pageIndex, int pageSize) {
        return null;
    }
}
