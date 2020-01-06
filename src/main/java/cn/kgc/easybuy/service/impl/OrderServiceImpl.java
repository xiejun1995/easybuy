package cn.kgc.easybuy.service.impl;

import cn.kgc.easybuy.mapper.OrderMapper;
import cn.kgc.easybuy.pojo.EasyBuyOrder;
import cn.kgc.easybuy.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/30 8:36
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Override
    public List<Integer> getOrderListOfPagination(Integer currentPage, Integer pageSize) {
        return orderMapper.getOrderListOfPagination(currentPage,pageSize);
    }

    @Override
    public List<EasyBuyOrder> getOrderDetailListbyOrderId(List<Integer> orderIds) {
        return orderMapper.getOrderDetailListbyOrderId(orderIds);
    }

    @Override
    public Integer getNumberOfRecords() {
        return orderMapper.getNumberOfRecords();
    }

    @Override
    public List<EasyBuyOrder> getOrderByOrdererAndOrderNumber(List<Integer> orderIds) {
        return getOrderByOrdererAndOrderNumber(orderIds);
    }

    @Override
    public Integer getNumberOfRecordsByFuzzyQuery(Integer entityId, String userName) {
        return orderMapper.getNumberOfRecordsByFuzzyQuery(entityId,userName);
    }

    @Override
    public List<Integer> getOrderListOfPaginationByFuzzyQuery(Integer entityId, String userName) {
        return orderMapper.getOrderListOfPaginationByFuzzyQuery(entityId,userName);
    }
}
