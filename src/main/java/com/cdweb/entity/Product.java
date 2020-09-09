package com.cdweb.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

@Entity(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int productId;
    String productCode;
    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "catalogId")
    Catalog catalog;
    String name;
    String settingInfo;
    String description;
    String promotionText;
    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "brand")
    Brand brand;
    BigDecimal price;
    BigDecimal promotionPrice;
    String imageList;
    @Transient
    String[] imageArr;
    Integer quantity;
    String video;
    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "waranty")
    Warranty waranty;
    Integer top;
    Integer viewCount;
    Date dateCreated;
    Date dateModified;
    Integer userCreated;
    Integer userModified;
    Integer status;
    @Transient
    List<MultipartFile> images;

    @OneToMany(mappedBy = "product_proDetail", fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<ProductDetail> productDetails;

    @OneToMany
    @JoinColumn(name = "productId")
    @JsonIgnore
    Set<CartItem> cartItems;



    @OneToMany(mappedBy="product_cmt",fetch= FetchType.EAGER)
    private Set<Comment> comments;

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Warranty getWaranty() {
        return waranty;
    }

    public void setWaranty(Warranty waranty) {
        this.waranty = waranty;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }



    public Set<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(Set<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }

    public Set<CartItem> getCartItems() {
        return cartItems;
    }


    public String[] getImageArr() {
        return imageArr;
    }

    public void setImageArr() {
        String[] arr = {};
        if (imageList != null) {
            arr = Pattern.compile("\\|").split(imageList);
//            for (String data : listImg) {
//                System.out.println(data);
//            }
        }
        imageArr = arr;
    }



    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public Catalog getCatalog() {
        return catalog;
    }

    public void setCatalog(Catalog catalog) {
        this.catalog = catalog;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSettingInfo() {
        return settingInfo;
    }

    public void setSettingInfo(String settingInfo) {
        this.settingInfo = settingInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPromotionText() {
        return promotionText;
    }

    public void setPromotionText(String promotionText) {
        this.promotionText = promotionText;
    }



    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(BigDecimal promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public void setImageArr(String[] imageArr) {
        this.imageArr = imageArr;
    }

    public String getImageList() {
        return imageList;
    }

    public void setImageList(String imageList) {
        this.imageList = imageList;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }



    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateModified() {
        return dateModified;
    }

    public void setDateModified(Date dateModified) {
        this.dateModified = dateModified;
    }

    public Integer getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Integer userCreated) {
        this.userCreated = userCreated;
    }

    public Integer getUserModified() {
        return userModified;
    }

    public void setUserModified(Integer userModified) {
        this.userModified = userModified;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public List<MultipartFile> getImages() {
        return images;
    }

    public void setImages(List<MultipartFile> images) {
        this.images = images;
    }
}
