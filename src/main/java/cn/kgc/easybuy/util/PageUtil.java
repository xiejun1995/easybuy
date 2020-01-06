package cn.kgc.easybuy.util;

/**
 * 定义一个根据数据总条数和页面显示尺寸计算总页数
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2019/12/31 11:26
 */
public class PageUtil {
    /**
     * 根据数据总条数和页面显示尺寸计算总页数
     * @param count 总记录条数
     * @param pageSize 页码大小
     * @return
     */
    public static Integer getPageTotal(Integer count,Integer pageSize){
        return (int)Math.ceil(1.0*count/pageSize);
    }
}
