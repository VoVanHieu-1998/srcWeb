package com.cdweb.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity(name = "product_detail")
public class ProductDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productdetailId;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "productId", nullable = false)
    @JsonIgnore
    private Product product_proDetail;

    @OneToOne(cascade = CascadeType.ALL)
    @JsonIgnore
    @JoinColumn(name = "specsId")
    private Spec spec_proDetail;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "colorId")
    private Color color_proDetail;


    private BigDecimal price;
    private BigDecimal promotion_price;
    private String img_url;
    private int itemStatus;
    private Date createDate;
    private Date updateDate;

    @Transient
    private BigDecimal gotPriceMin;
    private Integer quantity;

    private Integer status;

    public BigDecimal getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(BigDecimal promotion_price) {
        this.promotion_price = promotion_price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BigDecimal getGotPriceMin() {
        return gotPriceMin;
    }

    public void setGotPriceMin(BigDecimal gotPriceMin) {
        this.gotPriceMin = gotPriceMin;
    }

    public Integer getProductdetailId() {
        return productdetailId;
    }

    public void setProductdetailId(Integer productdetailId) {
        this.productdetailId = productdetailId;
    }

    public Spec getSpec_proDetail() {
        return spec_proDetail;
    }

    public void setSpec_proDetail(Spec spec_proDetail) {
        this.spec_proDetail = spec_proDetail;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Product getProduct_proDetail() {
        return product_proDetail;
    }

    public void setProduct_proDetail(Product product_proDetail) {
        this.product_proDetail = product_proDetail;
    }

    public Color getColor_proDetail() {
        return color_proDetail;
    }

    public void setColor_proDetail(Color color_proDetail) {
        this.color_proDetail = color_proDetail;
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

}
