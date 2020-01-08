package cn.kgc.easybuy.mapper;

import cn.kgc.easybuy.pojo.EasyBuyProduct;
import org.apache.ibatis.annotations.Param;

/**
 * 商品相关的映射类
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/28 10:51
 */
public interface ShoppingMapper {
    /**
     * 根据商品的Id查询对应的商品
     * @param proId 商品Id
     * @return  对应的商品
     */
    public EasyBuyProduct getProduct(@Param("proId") Integer proId);

    /**
     * 根据商品Id增加对应商品的临时库存
     * @param epId 商品Id
     * @return 执行结果
     */
    public int addTempStock(@Param("epId") Integer epId);

    /**
     * 根据商品Id减少对应商品的临时库存
     * @param epId 商品Id
     * @return 执行结果
     */
    public int reduceTempStock(@Param("epId") Integer epId);
    /**
     * 根据商品Id减少对应商品的实际库存
     * @param epId 商品Id
     *@return 执行结果
     */
    public int reduceRealStock(@Param("epId") Integer epId);

}
