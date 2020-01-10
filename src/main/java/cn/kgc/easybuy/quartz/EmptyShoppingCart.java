package cn.kgc.easybuy.quartz;
import org.springframework.scheduling.annotation.Scheduled;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

/**
 * 定义一个任务调度类用于购物车超时清空
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/8 19:30
 */
public class EmptyShoppingCart implements Delayed {
     public static Map<Integer,Integer> minuteMap=new HashMap<>(); //用于存放购物车定时时间的分钟数
     public static Map<Integer,Integer> secondMap=new HashMap<>();//用于存放购物车定时时间的秒数
    //过期时间(单位：分钟)
    private long expTime;
    private String orderCode;

    public EmptyShoppingCart(String orderCode,long expTime,Date createTime) {
        super();
        this.orderCode=orderCode;
        this.expTime=TimeUnit.MILLISECONDS.convert(expTime, TimeUnit.MINUTES)+createTime.getTime();
    }

    public EmptyShoppingCart() {

    }

    /**
     * 将购物车中对应的商品清空
     */
    @Scheduled(cron = "0/1 * *  * * ?")
   public void emptyShoppingCart(){
        System.out.println("##############################");
//        if(secondMap.get(epId)>0){
//            secondMap.put(epId,secondMap.get(epId)-1);
//        }else if(secondMap.get(epId)==0&&minuteMap.get(epId)>0){
//            minuteMap.put(epId,minuteMap.get(epId)-1);
//            secondMap.put(epId,59);
//        }else{
//            return;
//        }
    }
    /**
     * 用于延迟队列内部比较排序，当前时间的延迟时间  -  比较对象的延迟时间
     */
    @Override
    public long getDelay(TimeUnit unit) {
        return this.expTime-System.currentTimeMillis();
    }
    /**
     * 获得延迟时间，过期时间-当前时间（单位ms）
     */
    @Override
    public int compareTo(Delayed o) {
        return Long.valueOf(this.expTime).compareTo(Long.valueOf(((EmptyShoppingCart)o).expTime));
    }
}
