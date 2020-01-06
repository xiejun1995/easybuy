package com.easybuy.service.commodity;

import com.easybuy.pojo.Classify;
import com.easybuy.pojo.EasyBuyProduct;


import java.util.List;

public interface ClassifyService {
    //添加商品分类
    int addClassify(Classify clfy);
    //删除商品分类
    int deleteClassify(Classify clfy);
    //修改商品分类
    int updateClassify(Classify clfy);
    //查询总条数
    int totalCount();
    //查询商品分类
    List<Classify> Classifylist(int pageNo, int pageSize);

    //查询全部商品分类
    List<Classify> ClassifyAll();


    //查询商品所有父分类
    List<Classify> ClassifyFid();

    //根据id查询分类信息并返回分类对象
    Classify ClassifyById(int id);

    List<EasyBuyProduct> commodityList(int pageIndex, int pageSize);
}
