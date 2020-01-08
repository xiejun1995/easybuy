package com.easybuy.pojo;

import java.util.Date;

/**
 * @author 谢军军
 * @Email 18045972801@163.com
 * @date 2020/1/6 11:21
 */
public class EasyBuyComment {

        private int ecId;//留言编号
        private String ecContent;//发表的留言内容
        private Date ecCreateTime;//创建时间
        private String ecReply;//针对留言的回复
        private Date ecReplyTime;//回复时间
        private String ecNickName;//留言用户昵称


    public int getEcId() {
        return ecId;
    }

    public void setEcId(int ecId) {
        this.ecId = ecId;
    }

    public String getEcContent() {
        return ecContent;
    }

    public void setEcContent(String ecContent) {
        this.ecContent = ecContent;
    }

    public Date getEcCreateTime() {
        return ecCreateTime;
    }

    public void setEcCreateTime(Date ecCreateTime) {
        this.ecCreateTime = ecCreateTime;
    }

    public String getEcReply() {
        return ecReply;
    }

    public void setEcReply(String ecReply) {
        this.ecReply = ecReply;
    }

    public Date getEcReplyTime() {
        return ecReplyTime;
    }

    public void setEcReplyTime(Date ecReplyTime) {
        this.ecReplyTime = ecReplyTime;
    }

    public String getEcNickName() {
        return ecNickName;
    }

    public void setEcNickName(String ecNickName) {
        this.ecNickName = ecNickName;
    }

    public EasyBuyComment(int ecId, String ecContent, Date ecCreateTime, String ecReply, Date ecReplyTime, String ecNickName) {
        this.ecId = ecId;
        this.ecContent = ecContent;
        this.ecCreateTime = ecCreateTime;
        this.ecReply = ecReply;
        this.ecReplyTime = ecReplyTime;
        this.ecNickName = ecNickName;
    }
    public EasyBuyComment() {
    }
}
