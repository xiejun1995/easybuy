package cn.kgc.easybuy.service;

import cn.kgc.easybuy.pojo.EasyBuyOrder;

import java.util.List;

/**
 * 订单管理服务层类
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/30 8:36
 */
public interface OrderService {
    /**
     * 根据当前页码及页码大小查询当前页所对应的订单Id集合
     *  currentPage 当前页码
     *  pageSize 页码大小
     * @return   当前页码所对应的订单列表
     */
    public List<Integer> getOrderListOfPagination(Integer currentPage,Integer pageSize);

    /**
     * 根据当前订单Id进行联表查询查询该订单中的所有商品信息及订单详情信息
     *  orderIds 订单集合
     * @return
     */
    public List<EasyBuyOrder> getOrderDetailListbyOrderId(List<Integer> orderIds);
    /**
     * 查询订单表中的总记录条数
     * @return
     */
    public Integer getNumberOfRecords();
    /**
     * 根据订单ID或者订单人姓名进行模糊查询并且联表查询该订单中的所有商品信息及订单详情信息
     *  orderIds 订单号集合
     * @return 模糊查询到的相关订单列表
     */
    public List<EasyBuyOrder> getOrderByOrdererAndOrderNumber(List<Integer> orderIds);


    /**
     * 根据模糊查询条件查询该条件下的总记录条数
     *  entityId
     *  userName
     * @return
     */
    public Integer getNumberOfRecordsByFuzzyQuery(Integer entityId,String userName);

    /**
     * 根据当前页码及页码大小查询当前页所对应的订单Id集合
     * @return 订单Id集合
     */
    public List<Integer> getOrderListOfPaginationByFuzzyQuery(Integer entityId,String userName);
}
