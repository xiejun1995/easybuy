package com.easybuy.pojo;

import cn.kgc.easybuy.pojo.EasyBuyOrderDetail;

import java.util.Date;
import java.util.List;

/**
 * 存放订单相关信息类
 * @author Allen
 * @date 2019/12/23 16:10
 */
public class EasyBuyOrder {
    private int eoId;//订单编号
    private String eoUserId;//用户ID
    private String eoUserName;//用户名
    private String eoUserAddress;//用户地址
    private Date eoCreateTime;//创建时间
    private float eoCost;//金额
    private int eoStatus;//状态 1待审核 2审核通过 3配货 4卖家已发货 5已收货
    private List<EasyBuyOrderDetail> orderDetailList; //订单具体信息类

    public EasyBuyOrder() {
    }
    public EasyBuyOrder(int eoId, String eoUserId, String eoUserName, String eoUserAddress, Date eoCreateTime, float eoCost, int eoStatus, List<EasyBuyOrderDetail> orderDetailList) {
        this.eoId = eoId;
        this.eoUserId = eoUserId;
        this.eoUserName = eoUserName;
        this.eoUserAddress = eoUserAddress;
        this.eoCreateTime = eoCreateTime;
        this.eoCost = eoCost;
        this.eoStatus = eoStatus;
        this.orderDetailList = orderDetailList;
    }

    public int getEoId() {
        return eoId;
    }

    public void setEoId(int eoId) {
        this.eoId = eoId;
    }

    public String getEoUserId() {
        return eoUserId;
    }

    public void setEoUserId(String eoUserId) {
        this.eoUserId = eoUserId;
    }

    public String getEoUserName() {
        return eoUserName;
    }

    public void setEoUserName(String eoUserName) {
        this.eoUserName = eoUserName;
    }

    public String getEoUserAddress() {
        return eoUserAddress;
    }

    public void setEoUserAddress(String eoUserAddress) {
        this.eoUserAddress = eoUserAddress;
    }

    public Date getEoCreateTime() {
        return eoCreateTime;
    }

    public void setEoCreateTime(Date eoCreateTime) {
        this.eoCreateTime = eoCreateTime;
    }

    public float getEoCost() {
        return eoCost;
    }

    public void setEoCost(float eoCost) {
        this.eoCost = eoCost;
    }

    public int getEoStatus() {
        return eoStatus;
    }

    public void setEoStatus(int eoStatus) {
        this.eoStatus = eoStatus;
    }

    public List<EasyBuyOrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<EasyBuyOrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }
}
