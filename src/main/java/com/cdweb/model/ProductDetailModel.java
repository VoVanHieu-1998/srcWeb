package com.cdweb.model;

import com.cdweb.entity.Color;
import com.cdweb.entity.Spec;

import java.math.BigDecimal;
import java.util.Date;

public class ProductDetailModel {

    private Integer productdetailId;

    private ProductModel product;

    private Spec spec_proDetail;

    private Color color_proDetail;


    private BigDecimal price;
    private BigDecimal promotion_price;
    private String img_url;
    private int itemStatus;
    private Date createDate;
    private Date updateDate;

    private BigDecimal gotPriceMin;
    private int quantity;
    private int status;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Integer getProductdetailId() {
        return productdetailId;
    }

    public void setProductdetailId(Integer productdetailId) {
        this.productdetailId = productdetailId;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public Spec getSpec_proDetail() {
        return spec_proDetail;
    }

    public void setSpec_proDetail(Spec spec_proDetail) {
        this.spec_proDetail = spec_proDetail;
    }

    public Color getColor_proDetail() {
        return color_proDetail;
    }

    public void setColor_proDetail(Color color_proDetail) {
        this.color_proDetail = color_proDetail;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(BigDecimal promotion_price) {
        this.promotion_price = promotion_price;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(int itemStatus) {
        this.itemStatus = itemStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public BigDecimal getGotPriceMin() {
        return gotPriceMin;
    }

    public void setGotPriceMin(BigDecimal gotPriceMin) {
        this.gotPriceMin = gotPriceMin;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
