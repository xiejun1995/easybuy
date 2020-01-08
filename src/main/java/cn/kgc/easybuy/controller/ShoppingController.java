package cn.kgc.easybuy.controller;

import cn.kgc.easybuy.pojo.EasyBuyProduct;
import cn.kgc.easybuy.service.ShoppingService;
import cn.kgc.easybuy.util.Constants;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/31 16:51
 */
@Controller
@RequestMapping("/statics")
public class ShoppingController {
    private Logger logger=Logger.getLogger(ShoppingController.class);
    @Resource
    private ShoppingService shoppingService;

    /**
     * 根据指定页码查询当前页码的订单详情列表
     * @param ep_id
     * @param request
     * @return
     */
    @GetMapping("/shopping")
    public String orderList(@RequestParam(value="ep_id",required = false)String ep_id,
                            HttpServletRequest request){
        //默认设置订单列表当前页码为首页
        Integer proId=0;
        //如果访问的不是首页则改变当前页码的值
        if(!(ep_id==null || "".equals(ep_id))){
            proId=Integer.valueOf(ep_id);
        }
        //如果不是第一次请求则将存储的产品Id清空
        request.removeAttribute("proId");
        //存在request中便于使用EL表达式
        request.setAttribute("proId",proId);
        EasyBuyProduct product=shoppingService.getProduct(proId);
        //如果不是第一次请求则将存储的产品清空
        request.removeAttribute("product");
        request.setAttribute("product",product);
        logger.debug("################查询成功!");
        return "/statics/shopping.jsp";
    }

    /**
     * 用于处理异步请求获取订单总金额
     * @param epId
     * @param request
     */
    @GetMapping("/manage/getProduct")
    @ResponseBody
    public String getProduct(@RequestParam("epId") String epId,
                                HttpServletRequest request){
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //将替换后的金额转换为整型并存储在request中
            EasyBuyProduct product=shoppingService.getProduct(Integer.valueOf(epId));
            request.setAttribute("price",product.getEpPrice());
            resultMap.put("product",product);
            return JSON.toJSONString(resultMap);
        }else{
            resultMap.put("messeage", Constants.NO_EP_ID);
            return JSON.toJSONString(resultMap);
        }

    }
    /**
     * 用于处理将指定商品加入购物车的异步请求
     * @param epId
     * @param request
     */
    @GetMapping("/manage/addShoppingCart")
    @ResponseBody
    public String addShoppingCart(@RequestParam("epId") String epId,
                                 HttpServletRequest request){
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //将替换后的金额转换为整型并存储在request中
            EasyBuyProduct product=shoppingService.getProduct(Integer.valueOf(epId));
            request.setAttribute("price",product.getEpPrice());
            resultMap.put("product",product);
            return JSON.toJSONString(resultMap);
        }else{
            resultMap.put("messeage", Constants.NO_EP_ID);
            return JSON.toJSONString(resultMap);
        }

    }
}
