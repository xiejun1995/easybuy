package cn.kgc.easybuy.quartz;

import java.util.concurrent.DelayQueue;
import java.util.concurrent.Delayed;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/10 15:17
 */
public class DelayQueueTest implements Runnable{
    //创建一个延迟队列
    private	DelayQueue<Delayed> item = new DelayQueue<>();

    @Override
    public void run() {
        while(true) {
            try {
                //只有当到期了才会获取到此对象
                EmptyShoppingCart delayed = (EmptyShoppingCart) item.take();
                //获取到之后修改状态
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    //添加数据调用的方法
    public void orderTimer(EmptyShoppingCart EmptyShoppingCart) {
        //向队列汇总添加数据
        item.add(EmptyShoppingCart);
    }

    public static void main(String[] args) {
        //创建一个线程池
        ExecutorService executor = Executors.newCachedThreadPool();
        //多线程执行程序
        executor.execute(new DelayQueueTest());
    }
}