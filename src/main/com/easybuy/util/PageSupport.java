package com.easybuy.util;

/**
 * @author 曹译
 * 日期：2019-12-27
 * desc：分页基类
 */
public class PageSupport {
    //当前页码
    private int pageNo=1;
    //总数量
    private int totalCount=0;
    //页面容量
    private int pageSize=0;
    //总页数
    private int totalPageCount=1;


    public int getPageNo() {
        return pageNo;
    }


    public void setPageNo(int pageNo) {
        if (pageNo>0){
            this.pageNo = pageNo;
        }
    }


    public int getTotalCount() {
        return totalCount;
    }


    //计算总页数
    public void setTotalPageCountByRS(){
        if (this.totalCount%pageSize==0){
            //总页面=总数量/页面容量
            //通过getTotalPageCount调用即可
            this.totalPageCount=this.totalCount/pageSize;
        }else if (this.totalCount%pageSize!=0){
            this.totalPageCount=this.totalCount/pageSize+1;
        }else{//出现问题
            this.totalPageCount=0;
        }
    }

    //总数量：设置总数量时,计算出总页数
    public void setTotalCount(int totalCount) {
        if (totalCount>=0){//数据库查询到的总条数是0到n
            this.totalCount = totalCount;
            //设置总页数
            this.setTotalPageCountByRS();
        }

    }


    public int getPageSize() {
        return pageSize;
    }


    public void setPageSize(int pageSize) {
        if (pageSize>0){
            this.pageSize = pageSize;
        }
    }


    public int getTotalPageCount() {
        return totalPageCount;
    }


    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }
}
