package cn.kgc.easybuy.pojo;

/**
 * 存放订单具体信息类
 * @author Allen
 * @date 2019/12/23 16:13
 */
public class EasyBuyOrderDetail {
    private int eodId;//编号
    private int eoId;//订单ID
    private int epId;//商品ID
    private int eoQuantity;//数量
    private float eodCost;//金额
    private EasyBuyProduct product;//商品基本信息类

    public int getEodId() {
        return eodId;
    }

    public void setEodId(int eodId) {
        this.eodId = eodId;
    }

    public int getEoId() {
        return eoId;
    }

    public void setEoId(int eoId) {
        this.eoId = eoId;
    }

    public int getEpId() {
        return epId;
    }

    public void setEpId(int epId) {
        this.epId = epId;
    }

    public int getEoQuantity() {
        return eoQuantity;
    }

    public void setEoQuantity(int eoQuantity) {
        this.eoQuantity = eoQuantity;
    }

    public float getEodCost() {
        return eodCost;
    }

    public void setEodCost(float eodCost) {
        this.eodCost = eodCost;
    }

    public EasyBuyProduct getProduct() {
        return product;
    }

    public void setProduct(EasyBuyProduct product) {
        this.product = product;
    }

    public EasyBuyOrderDetail() {
    }

    public EasyBuyOrderDetail(int eodId, int eoId, int epId, int eoQuantity, float eodCost, EasyBuyProduct product) {
        this.eodId = eodId;
        this.eoId = eoId;
        this.epId = epId;
        this.eoQuantity = eoQuantity;
        this.eodCost = eodCost;
        this.product = product;
    }
}
