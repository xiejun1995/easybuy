package cn.kgc.easybuy.pojo;

/**
 * @author Allen
 * @date 2019/12/24 19:51
 */
public class PageSupport {
    //当前页码
    private int currentPageNo = 1;
    //总数量
    private int totalCount;
    //页面容量
    private int pageSize;
    //总页数
    private int totalPageCount;

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        if (currentPageNo>0){
            this.currentPageNo = currentPageNo;
        }
    }

    public int getTotalCount() {
        return totalCount;
    }

    //计算总页数
    public void setTotalPageCountByRS() {
        if (this.totalCount%this.pageSize==0) {
            this.totalPageCount = this.totalCount/this.pageSize;
        } else if (this.totalCount%this.pageSize!=0) {
            this.totalPageCount = this.totalCount/this.pageSize+1;
        } else {
            this.totalPageCount = 0;
        }
    }

    public void setTotalCount(int totalCount) {
        if (totalCount>=0) {
            this.totalCount = totalCount;
            this.setTotalPageCountByRS();
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        if (pageSize>0) {
            this.pageSize = pageSize;
        }
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public PageSupport() {
    }

    public PageSupport(int currentPageNo, int totalCount, int pageSize, int totalPageCount) {
        this.currentPageNo = currentPageNo;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.totalPageCount = totalPageCount;
    }
}
