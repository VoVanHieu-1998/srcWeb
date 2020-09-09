package com.cdweb.model;

import com.cdweb.entity.ProductDetail;

import javax.persistence.Transient;
import java.util.List;
import java.util.regex.Pattern;

public class ProductModel {
    int productId;
    String code;
    String name;
    String image;
    String[] imageArr;

    public String[] getImageArr() {
        return imageArr;
    }

    public void setImageArr() {
        String[] arr = {};
        if (image != null) {
            arr = Pattern.compile("\\|").split(image);
//            for (String data : listImg) {
//                System.out.println(data);
//            }
        }
        imageArr = arr;
    }

    public void setImageArr(String[] imageArr) {
        this.imageArr = imageArr;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
