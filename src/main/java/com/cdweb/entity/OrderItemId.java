package com.cdweb.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class OrderItemId implements Serializable {
    int orderId;
    int productdetailId;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderItemId) {
        this.orderId = orderItemId;
    }

    public int getProductdetailId() {
        return productdetailId;
    }

    public void setProductdetailId(int productdetailId) {
        this.productdetailId = productdetailId;
    }
}
