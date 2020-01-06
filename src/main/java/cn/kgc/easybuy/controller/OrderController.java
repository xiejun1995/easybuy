package cn.kgc.easybuy.controller;

import cn.kgc.easybuy.service.OrderService;
import cn.kgc.easybuy.util.Constants;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/30 8:33
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {
    private Logger logger=Logger.getLogger(OrderController.class);
    @Resource
    private OrderService orderService;
    @GetMapping("/orderListOfPagination")
    @ResponseBody
    public String orderListOfPagination(@RequestParam("currentPage") String currentPage){
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(currentPage)){
            logger.debug("################################getOrderListOfPagination");
        }else{
            resultMap.put("messeage",Constants.INVALID_PAGE_NO);
        }
        return JSONObject.toJSONString(resultMap);
    }
    @GetMapping("/getOrderByOrdererAndOrderNumber")
    @ResponseBody
    public String getOrderByOrdererAndOrderNumber(@RequestParam("entityId") String entityId,
                                                  @RequestParam("userName")String userName,
                                                  @RequestParam("currentPage") String currentPage){
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(entityId)|| StringUtils.isNoneEmpty(userName)){
            Integer id=Integer.valueOf(entityId);
            if(StringUtils.isNoneEmpty(currentPage)){
                Integer curPage=Integer.valueOf(currentPage);
                logger.debug("################################getOrderByOrdererAndOrderNumber");
            }else{
                resultMap.put("messeage",Constants.INVALID_PAGE_NO);
            }
        }else{
                resultMap.put("messeage",Constants.INVALID_ID);
        }
        return JSONObject.toJSONString(resultMap);
    }
}
