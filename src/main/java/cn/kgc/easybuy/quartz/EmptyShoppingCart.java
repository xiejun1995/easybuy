package cn.kgc.easybuy.quartz;

import cn.kgc.easybuy.service.ShoppingService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * 定义一个任务调度类用于购物车超时清空
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/8 19:30
 */
@Component
public class EmptyShoppingCart {
    @Resource
    private ShoppingService shoppingService;
    /**
     * 将购物车中对应的商品清空
     */
    @Scheduled(cron = "0 1-2 * * * ? ")
    public void emptyShoppingCart(){

    }

}
