package com.cdweb.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class CartItemId implements Serializable {
    int cartId;
    int productdetailId;

    public int getCartId() {
        return cartId;
    }

    public CartItemId(int productdetailId) {
        this.productdetailId = productdetailId;
    }

    public CartItemId() {
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductdetailId() {
        return productdetailId;
    }

    public void setProductdetailId(int productdetailId) {
        this.productdetailId = productdetailId;
    }
}
