package cn.kgc.easybuy.quartz;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Component;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/**
 * 定义一个任务调度类用于购物车定时
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/8 19:30
 */
@Component
public class ShoppingCartTiming implements Job {
     public static Map<Integer,Integer> minuteMap=new HashMap<>(); //用于存放购物车定时时间的分钟数
     public static Map<Integer,Integer> secondMap=new HashMap<>();//用于存放购物车定时时间的秒数
    /**
     * 任务启动方法
     */
   public void shoppingCartTimingStart() throws SchedulerException {

//        if(secondMap.get(epId)>0){
//            secondMap.put(epId,secondMap.get(epId)-1);
//        }else if(secondMap.get(epId)==0&&minuteMap.get(epId)>0){
//            minuteMap.put(epId,minuteMap.get(epId)-1);
//            secondMap.put(epId,59);
//        }else{
//            return;
//        }
       //创建一个JobDetail
       JobDetail jobDetail = JobBuilder.newJob(ShoppingCartTiming.class)
               .withDescription("调用JobDemo")
               .withIdentity(""+new Date().getTime(), ""+new Date().getTime()+minuteMap.size())
               .build();
       System.out.println("###############描述任务：{}" + jobDetail.getDescription());
       //创建一个trigger触发规则
       Trigger trigger = TriggerBuilder.newTrigger()
               .withDescription("创建一个Trigger触发规则")
               .startAt(new Date())
               .withIdentity(""+new Date().getTime(), ""+new Date().getTime()+minuteMap.size())
               .withSchedule(SimpleScheduleBuilder.repeatSecondlyForTotalCount(1200,1))
               .build();
       //创建一个调度器，也就是一个Quartz容器
       //声明一个scheduler的工厂schedulerFactory
       SchedulerFactory schedulerFactory = new StdSchedulerFactory();
       //通过schedulerFactory来实例化一个Scheduler
       Scheduler scheduler = schedulerFactory.getScheduler();
       //将Job和Trigger注册到scheduler容器中
       scheduler.scheduleJob(jobDetail,trigger);
       //启动容器
       System.out.println("JOB开始启动！");
       scheduler.start();
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        for(Integer epId:minuteMap.keySet()){
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
}
