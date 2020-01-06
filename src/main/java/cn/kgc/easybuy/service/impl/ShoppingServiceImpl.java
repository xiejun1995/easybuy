package cn.kgc.easybuy.service.impl;

import cn.kgc.easybuy.mapper.ShoppingMapper;
import cn.kgc.easybuy.pojo.EasyBuyProduct;
import cn.kgc.easybuy.service.ShoppingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/2 12:01
 */
@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Resource
    private ShoppingMapper shoppingMapper;

    @Override
    public EasyBuyProduct getProduct(Integer proId) {
        return shoppingMapper.getProduct(proId);
    }
}
