package com.easybuy.pojo;

import java.util.Date;

/**
 * @author杨晓东
 * @Email 18045972801@163.com
 * @date 2020/1/6 11:24
 */
public class EasyBuyNews {
        private int enId;//新闻编号
        private String enTitle;//新闻标题
        private String enContent;//新闻内容
        private Date encreateTime;//新闻录入时间 默认为系统时间

    public EasyBuyNews(int enId, String enTitle, String enContent, Date encreateTime) {
        this.enId = enId;
        this.enTitle = enTitle;
        this.enContent = enContent;
        this.encreateTime = encreateTime;
    }

    public EasyBuyNews() {
    }

    public int getEnId() {
        return enId;
    }

    public void setEnId(int enId) {
        this.enId = enId;
    }

    public String getEnTitle() {
        return enTitle;
    }

    public void setEnTitle(String enTitle) {
        this.enTitle = enTitle;
    }

    public String getEnContent() {
        return enContent;
    }

    public void setEnContent(String enContent) {
        this.enContent = enContent;
    }

    public Date getEnCreateTime() {
        return encreateTime;
    }

    public void setEnCreateTime(Date encreateTime) {
        this.encreateTime = encreateTime;
    }
}
