package cn.kgc.easybuy.quartz;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import java.util.HashMap;
import java.util.Map;

/**
 * 定义一个任务调度类用于购物车超时清空
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/8 19:30
 */
@Component
public class EmptyShoppingCart {
     public static Map<Integer,Integer> minuteMap=new HashMap<>(); //用于存放购物车定时时间的分钟数
     public static Map<Integer,Integer> secondMap=new HashMap<>();//用于存放购物车定时时间的秒数

    /**
     * 将购物车中对应的商品清空
     */
    @Scheduled(cron = "1 * * * * ? ")
   public void emptyShoppingCart(Integer epId){
        if(secondMap.get(epId)>0){
            secondMap.put(epId,secondMap.get(epId)-1);
        }else if(secondMap.get(epId)==0&&minuteMap.get(epId)>0){
            minuteMap.put(epId,minuteMap.get(epId)-1);
            secondMap.put(epId,59);
        }else{
            return;
        }
    }
}
