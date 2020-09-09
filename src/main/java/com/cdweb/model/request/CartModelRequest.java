package com.cdweb.model.request;

import com.cdweb.entity.Product;
import com.cdweb.entity.ProductDetail;

public class CartModelRequest {
    Product product;
    ProductDetail productDetail;
    int quantity;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
