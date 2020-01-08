package cn.kgc.easybuy.service;

import cn.kgc.easybuy.pojo.EasyBuyProduct;
import org.apache.ibatis.annotations.Param;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/2 12:01
 */
public interface ShoppingService {
    /**
     * 根据商品的Id查询对应的商品
     * @param proId 商品Id
     * @return  对应的商品
     */
    public EasyBuyProduct getProduct(Integer proId);
    /**
     * 根据商品Id增加对应商品的临时库存
     * @param epId 商品Id
     * @return 执行结果
     */
    public int addTempStock(Integer epId);

    /**
     * 根据商品Id减少对应商品的临时库存
     * @param epId 商品Id
     * @return 执行结果
     */
    public int reduceTempStock(Integer epId);
    /**
     * 根据商品Id减少对应商品的实际库存
     * @param epId 商品Id
     *@return 执行结果
     */
    public int reduceRealStock(Integer epId);
}
