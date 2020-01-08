package cn.kgc.easybuy.mapper;

import cn.kgc.easybuy.pojo.EasyBuyOrder;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 订单管理相关的映射类
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/28 10:51
 */
public interface OrderMapper {
    /**
     * 根据当前页码及页码大小查询当前页所对应的订单Id集合
     * @param currentPage 当前页码
     * @param pageSize 页码大小
     * @return   当前页码所对应的订单列表
     */
    public List<Integer> getOrderListOfPagination(@Param("currentPage") Integer currentPage,
                                                        @Param("pageSize") Integer pageSize);

    /**
     * 根据当前订单Id进行联表查询查询该订单中的所有商品信息及订单详情信息
     * @param orderIds 订单Id集合
     * @return  订单Id集合所对应的订单列表
     */
    public List<EasyBuyOrder> getOrderDetailListbyOrderId(@Param("orderIds") List<Integer> orderIds);
    /**
     * 查询订单表中的总记录条数
     * @return  总记录条数
     */
    public Integer getNumberOfRecords();
    /**
     * 根据订单ID或者订单人姓名进行模糊查询并且联表查询该订单中的所有商品信息及订单详情信息
     * @param orderIds 订单号集合
     * @return 模糊查询到的相关订单列表
     */
    public List<EasyBuyOrder> getOrderByOrdererAndOrderNumber(@Param("orderIds") List<Integer> orderIds);


    /**
     * 根据模糊查询条件查询该条件下的总记录条数
     * @param entityId  订单Id
     * @param status  订单人状态
     * @param phone  订单人电话
     * @return  该条件下的总记录条数
     */
    public Integer getNumberOfRecordsByFuzzyQuery(@Param("entityId")Integer entityId,
                                                  @Param("status")Integer status,
                                                  @Param("phone")String phone);

    /**
     * 根据当前页码及页码大小查询当前页所对应的订单Id集合
     * @param entityId  订单Id
     *@param status  订单人状态
     * @param phone  订单人电话
     * @return 订单Id集合
     */
    public List<Integer> getOrderListOfPaginationByFuzzyQuery(@Param("entityId")Integer entityId,
                                                              @Param("status")Integer status,
                                                              @Param("phone")String phone);
}
