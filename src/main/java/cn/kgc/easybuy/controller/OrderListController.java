package cn.kgc.easybuy.controller;

import cn.kgc.easybuy.pojo.EasyBuyOrder;
import cn.kgc.easybuy.pojo.EasyBuyOrderDetail;
import cn.kgc.easybuy.service.OrderService;
import cn.kgc.easybuy.util.Constants;
import cn.kgc.easybuy.util.PageUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.xdevapi.JsonArray;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用于后台订单管理的请求处理
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/31 16:51
 */
@Controller
@RequestMapping("/statics/manage")
public class OrderListController {
    private Logger logger=Logger.getLogger(OrderListController.class);
    @Resource
    private OrderService orderService;

    /**
     * 根据指定页码查询当前页码的订单详情列表
     * @param currentPage 当前页码
     * @param request  请求对象
     * @return  返回处理完请求后需跳转的指定页面
     */
    @GetMapping("/orderList")
    public String orderList(@RequestParam(value="currentPage",required = false)String currentPage,
                            HttpServletRequest request){
        //默认设置订单列表当前页码为首页
        Integer curPage=1;
        //如果访问的不是首页则改变当前页码的值
        if(!(currentPage==null || "".equals(currentPage))){
            curPage=Integer.valueOf(currentPage);
        }
        //存在request中便于使用EL表达式
        request.setAttribute("currentPage",curPage);
        //计算总页码数
        Integer totalPage= PageUtil.getPageTotal(orderService.getNumberOfRecords(),Constants.PAGE_SIZE);
        logger.debug("################################进行分页查询");
        //获取订单当前页的订单id集合
        List<Integer> orderIds=orderService.getOrderListOfPagination((curPage-1)*Constants.PAGE_SIZE, Constants.PAGE_SIZE);
        //根据订单集合查询当前页的订单详情列表
        List<EasyBuyOrder> orderList=orderService.getOrderDetailListbyOrderId(orderIds);
        //计算订单总金额
        for (int i = 0; i <orderList.size();i++) {
            //定义一个订单总金额变量
            float orderTotalAmounts=0;
            List<EasyBuyOrderDetail> orderDetailList=orderList.get(i).getOrderDetailList();
            for (int j = 0; j <orderDetailList.size();j++) {
                //给单个商品的合计金额赋值
                orderDetailList.get(j).setEodCost(orderDetailList.get(j).getEodQuantity()*orderDetailList.get(j).getProduct().getEpPrice());
                //叠加订单的总金额
                orderTotalAmounts+=orderDetailList.get(j).getEodQuantity()*orderDetailList.get(j).getProduct().getEpPrice();
            }
            //将订单总金额赋值给订单对象的订单金额属性
            orderList.get(i).setEoCost(orderTotalAmounts);
        }

        request.setAttribute("orderList",orderList);
        //存在request中便于使用EL表达式
        request.setAttribute("totalPage",totalPage);
        return "order";
    }

    /**
     * 模糊查询的Ajax异步请求
     * @param entityId
     * @param eoStatus
     * @param phone
     * @param request
     * @return
     */
    @GetMapping("/fuzzyOrderList")
    @ResponseBody
    public String getOrderByOrdererAndOrderNumber(@RequestParam("entityId") String entityId,
                                                  @RequestParam("eoStatus")String eoStatus,
                                                  @RequestParam("phone")String phone,
                                                  HttpServletRequest request,
                                                  HttpSession session
                                                  ){
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
            if(StringUtils.isNoneEmpty(entityId)||StringUtils.isNoneEmpty(eoStatus)||StringUtils.isNoneEmpty(phone)){
                Integer id=null;
                if(StringUtils.isNoneEmpty(entityId)){
                    id=Integer.valueOf(entityId);
                }
                Integer status=null;
                //根据用户输入的订单状态进行判断
                if(StringUtils.isNoneEmpty(eoStatus)){
                    switch (eoStatus){
                        case "待审核":
                            status=1;
                            break;
                        case "审核通过":
                            status=2;
                            break;
                        case "配货":
                            status=3;
                            break;
                        case "发货":
                            status=4;
                            break;
                        default:
                            status=null;
                            break;
                    }
                }
                //查询总页码
                logger.debug("#########################查询订单列表");
                //如果没有记录则直接返回
                Integer count=orderService.getNumberOfRecordsByFuzzyQuery(id,status,phone);
                if(count<1){
                    resultMap.put("messeage",Constants.NO_RECORD);
                    return JSONArray.toJSONString(resultMap);
                }
                //如果有记录则查询记录集合
                logger.info("################################进行查询");
                //获取订单当前页的订单id集合
                List<Integer> orderIds=orderService.getOrderListOfPaginationByFuzzyQuery(id,status,phone);
                //根据订单集合查询当前页的订单详情列表
                List<EasyBuyOrder> fuzzyOrderList=orderService.getOrderByOrdererAndOrderNumber(orderIds);
                for (int i = 0; i < fuzzyOrderList.size(); i++) {
                    fuzzyOrderList.get(i).setDateString(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(fuzzyOrderList.get(i).getEoCreateTime()));
                }
                //计算订单总金额
                for (int i = 0; i <fuzzyOrderList.size();i++) {
                    //定义一个订单总金额变量
                    float orderTotalAmounts=0;
                    List<EasyBuyOrderDetail> orderDetailList=fuzzyOrderList.get(i).getOrderDetailList();
                    for (int j = 0; j <orderDetailList.size();j++) {
                        //给单个商品的合计金额赋值
                        orderDetailList.get(j).setEodCost(orderDetailList.get(j).getEodQuantity()*orderDetailList.get(j).getProduct().getEpPrice());
                        //叠加订单的总金额
                        orderTotalAmounts+=orderDetailList.get(j).getEodQuantity()*orderDetailList.get(j).getProduct().getEpPrice();
                    }
                    //将订单总金额赋值给订单对象的订单金额属性
                    fuzzyOrderList.get(i).setEoCost(orderTotalAmounts);
                }
                resultMap.put("fuzzyOrderList",fuzzyOrderList);
                System.out.println("###########################"+JSONArray.toJSONString(resultMap));
                return JSONArray.toJSONString(resultMap);
            }else{
                resultMap.put("messeage",Constants.INVALID_ID);
                //如果没有输入订单ID或者订单人姓名则直接返回
                return JSONArray.toJSONString(resultMap);
            }
    }
}
