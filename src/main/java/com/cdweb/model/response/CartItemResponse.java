package com.cdweb.model.response;

import com.cdweb.entity.ProductJson;

public class CartItemResponse {
    private ProductJson product;
    private int quantity;

    public ProductJson getProduct() {
        return product;
    }

    public void setProduct(ProductJson product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
