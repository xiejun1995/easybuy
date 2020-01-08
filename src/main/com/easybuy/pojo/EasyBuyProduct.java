package com.easybuy.pojo;

/**
 * 存放商品基本信息类
 * @author Allen
 * @date 2019/12/23 16:01
 */
public class EasyBuyProduct {
    private int epId;//商品编号
    private String epName;//商品名字
    private String epDescription;//商品描述
    private float epPrice;//商品价格
    private int epStock;//商品临时
    private int epcId;//商品分类ID
    private int epcChildId;//商品二级分类
    private String epFileName;//上传的文件名
    private int realStock; //商品的实际库存

    public int getRealStock() {
        return realStock;
    }

    public void setRealStock(int realStock) {
        this.realStock = realStock;
    }

    public int getEpId() {
        return epId;
    }

    public void setEpId(int epId) {
        this.epId = epId;
    }

    public String getEpName() {
        return epName;
    }

    public void setEpName(String epName) {
        this.epName = epName;
    }

    public String getEpDescription() {
        return epDescription;
    }

    public void setEpDescription(String epDescription) {
        this.epDescription = epDescription;
    }

    public float getEpPrice() {
        return epPrice;
    }

    public void setEpPrice(float epPrice) {
        this.epPrice = epPrice;
    }

    public int getEpStock() {
        return epStock;
    }

    public void setEpStock(int epStock) {
        this.epStock = epStock;
    }

    public int getEpcId() {
        return epcId;
    }

    public void setEpcId(int epcId) {
        this.epcId = epcId;
    }

    public int getEpcChildId() {
        return epcChildId;
    }

    public void setEpcChildId(int epcChildId) {
        this.epcChildId = epcChildId;
    }

    public String getEpFileName() {
        return epFileName;
    }

    public void setEpFileName(String epFileName) {
        this.epFileName = epFileName;
    }

    public EasyBuyProduct() {
    }


    public EasyBuyProduct(int epId, String epName, String epDescription, float epPrice, int epStock, int epcId, int epcChildId, String epFileName, int realStock) {
        this.epId = epId;
        this.epName = epName;
        this.epDescription = epDescription;
        this.epPrice = epPrice;
        this.epStock = epStock;
        this.epcId = epcId;
        this.epcChildId = epcChildId;
        this.epFileName = epFileName;
        this.realStock = realStock;
    }
}
