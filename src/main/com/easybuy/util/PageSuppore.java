package com.easybuy.util;

/*分页的工具类*/
public class PageSuppore {
	//当前页码
	private int currentPageNo = 1;
	//信息的总数量
	private int totalCount;
	//每页的数据容量
	private int pageSize;
	//总页数
	private int totalPageCount;


	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		if(currentPageNo>0){
			this.currentPageNo = currentPageNo;
		}
	}
	public int getTotalCount() {
		return totalCount;
	}
	//计算总页数
	public void setTotalPageCountByRs(){
		if(this.totalCount%this.pageSize==0){
			this.totalPageCount = this.totalCount/this.pageSize;
		}else{
			this.totalPageCount = this.totalCount/this.pageSize+1;
		}
	}
	//设置信息的总数量时，同时计算总页数
	public void setTotalCount(int totalCount) {
		if(totalCount>=0){
			this.totalCount = totalCount;
			//设置总页数
			this.setTotalPageCountByRs();
		}
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
}
