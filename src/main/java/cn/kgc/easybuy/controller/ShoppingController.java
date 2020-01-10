package cn.kgc.easybuy.controller;

import cn.kgc.easybuy.pojo.EasyBuyProduct;
import cn.kgc.easybuy.quartz.ShoppingCartTiming;
import cn.kgc.easybuy.service.ShoppingService;
import cn.kgc.easybuy.util.Constants;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    private static Map<Integer,EasyBuyProduct> proMap=new HashMap<>(); //用于存放商品的集合，key为商品Id
    private static Map<Integer,Integer> countMap=new HashMap<>();//用于存放对应商品的数量的集合，key为商品Id
    private Logger logger=Logger.getLogger(ShoppingController.class);
    @Resource
    private ShoppingService shoppingService;  //购物业务类
    @Resource
    private ShoppingCartTiming shoppingCartTiming; //购物车定时器类


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
    @GetMapping("/getProduct")
    @ResponseBody
    public String getProduct(@RequestParam("epId") String epId,
                                HttpServletRequest request){
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //将替换后的金额转换为整型并存储在request中
            EasyBuyProduct product=shoppingService.getProduct(Integer.valueOf(epId));
            if(product!=null){
                request.setAttribute("price",product.getEpPrice());
                resultMap.put("product",product);
                return JSON.toJSONString(resultMap);
            }else{
                resultMap.put("messeage",Constants.NO_PRODUCT);
                return JSON.toJSONString(resultMap);
            }

        }else{
            resultMap.put("messeage", Constants.NO_EP_ID);
            return JSON.toJSONString(resultMap);
        }

    }
    /**
     * 用于后台页面订单管理中进入商品详情处理异步请求获取订单总金额
     * @param epId
     * @param request
     */
    @GetMapping("/manage/getProduct")
    @ResponseBody
    public String getManageProduct(@RequestParam("epId") String epId,
                             HttpServletRequest request){
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //根据商品Id查询对应的商品
            EasyBuyProduct product=shoppingService.getProduct(Integer.valueOf(epId));
            if(product!=null){
                request.setAttribute("price",product.getEpPrice());
                resultMap.put("product",product);
                return JSON.toJSONString(resultMap);
            }else{
                resultMap.put("messeage",Constants.NO_PRODUCT);
                return JSON.toJSONString(resultMap);
            }

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
    @GetMapping("/addShoppingCart")
    @ResponseBody
    public String addShoppingCart(@RequestParam("epId") String epId,
                                 HttpServletRequest request) throws SchedulerException {
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //根据商品Id查询对应的商品
            Integer id=Integer.valueOf(epId);
            //将对应的商品临时库存减1
            int result=shoppingService.reduceTempStock(id);
            EasyBuyProduct product=shoppingService.getProduct(id);
            //判断该商品在购物车集合中是否已存在
            //如果存在则将对应商品的数量加1否则存放到map集合中
            if(proMap.get(id)!=null){
                countMap.put(id,countMap.get(id)+1);
            }else{
                proMap.put(id,product);
                countMap.put(id,1);
            }
            //提示用户加入成功
            resultMap.put("success",Constants.SHOPPING_SUCCESS);
            //当加入成功后将购物车定时时间重新定义为20分钟
            ShoppingCartTiming.minuteMap.put(id,19);
            ShoppingCartTiming.secondMap.put(id,59);
            //执行20分钟的倒计时
            shoppingCartTiming.shoppingCartTimingStart();
            return JSON.toJSONString(resultMap);
        }else{
            resultMap.put("messeage", Constants.NO_EP_ID);
            return JSON.toJSONString(resultMap);
        }
    }
    /**
     * 用于处理后台页面订单管理中将指定商品加入购物车的异步请求
     * @param epId
     * @param request
     */
    @GetMapping("/manage/addShoppingCart")
    @ResponseBody
    public String addManageShoppingCart(@RequestParam("epId") String epId,
                                  HttpServletRequest request) throws SchedulerException {
        //定义一个map集合用于存储多种类型的集合
        Map<String,Object> resultMap=new HashMap<>();
        if(StringUtils.isNoneEmpty(epId)){
            //根据商品Id查询对应的商品
            Integer id=Integer.valueOf(epId);
            //将对应的商品临时库存减1
            int result=shoppingService.reduceTempStock(id);
            EasyBuyProduct product=shoppingService.getProduct(id);
            //判断该商品在购物车集合中是否已存在
            //如果存在则将对应商品的数量加1否则存放到map集合中
            if(proMap.get(id)!=null){
                countMap.put(id,countMap.get(id)+1);
            }else{
                proMap.put(id,product);
                countMap.put(id,1);
            }
            //提示用户加入成功
            resultMap.put("success",Constants.SHOPPING_SUCCESS);
            //当加入成功后将购物车定时时间重新定义为20分钟
            ShoppingCartTiming.minuteMap.put(id,19);
            ShoppingCartTiming.secondMap.put(id,59);
            //执行20分钟的倒计时
            shoppingCartTiming.shoppingCartTimingStart();
            return JSON.toJSONString(resultMap);
        }else{
            resultMap.put("messeage", Constants.NO_EP_ID);
            return JSON.toJSONString(resultMap);
        }

    }
    @GetMapping("/shoppingCart")
    public String shoppingCart(HttpSession session){
        //将购物车集合数据存储在session中
        session.setAttribute("proMap",proMap);
        session.setAttribute("countMap",countMap);
        session.setAttribute("minuteMap", ShoppingCartTiming.minuteMap);
        session.setAttribute("secondMap", ShoppingCartTiming.secondMap);
        return "../shopping";
    }
    @GetMapping("/manage/shoppingCart")
    public String manageShoppingCart(HttpSession session){
        //将购物车集合数据存储在session中
        session.setAttribute("proMap",proMap);
        session.setAttribute("countMap",countMap);
        session.setAttribute("minuteMap", ShoppingCartTiming.minuteMap);
        session.setAttribute("secondMap", ShoppingCartTiming.secondMap);
        return "../shopping";
    }
    /**
     * 用于处理将指定商品加入临时库存中的异步请求
     * @param epId
     */
    @GetMapping("/addShoppingStock")
    public void addShoppingStock(@RequestParam("epId") String epId) {
        if (StringUtils.isNoneEmpty(epId)) {
            Integer id = Integer.valueOf(epId);
            //将对应的商品临时库存加1
            int result = shoppingService.addTempStock(id);
        }
    }

}
