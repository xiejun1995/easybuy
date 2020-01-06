package com.easybuy.pojo;

/**
 * @author 曹译
 * 日期：2019-12-29
 * desc：商品分类封装类
 */
public class Classify {
    //分类编号
    private int epcId;
    //分类名称
    private String epcName;
    //父分类
    private int epcParentId;

    public Classify(){}

    public Classify(int epcId) {
        this.epcId = epcId;
    }

    public Classify(String epcName, int epcParentId) {
        this.epcName = epcName;
        this.epcParentId = epcParentId;
    }

    public Classify(int epc_id, String epc_name, int epc_parent_id) {
        this.epcId = epcId;
        this.epcName = epcName;
        this.epcParentId = epcParentId;
    }

    public int getEpcId() {
        return epcId;
    }

    public void setEpcId(int epcId) {
        this.epcId = epcId;
    }

    public String getEpcName() {
        return epcName;
    }

    public void setEpcName(String epcName) {
        this.epcName = epcName;
    }

    public int getEpcParentId() {
        return epcParentId;
    }

    public void setEpcParentId(int epcParentId) {
        this.epcParentId = epcParentId;
    }
}
