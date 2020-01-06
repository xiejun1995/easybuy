package cn.kgc.easybuy.controller;

import cn.kgc.easybuy.pojo.EasyBuyProduct;
import cn.kgc.easybuy.service.ShoppingService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
        return "shopping";
    }

    /**
     * 用于处理异步请求获取订单总金额
     * @param amount
     * @param request
     */
    @GetMapping("/getOrderAmount")
    public String getOrderAmount(@RequestParam("amount") String amount,
                                HttpServletRequest request){
        if(StringUtils.isNoneEmpty(amount)){
            //将替换后的金额转换为整型并存储在request中
            request.setAttribute("amount",Double.valueOf(amount));
        }
        return "../address";
    }
}
