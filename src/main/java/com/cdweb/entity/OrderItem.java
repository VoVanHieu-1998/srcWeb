package com.cdweb.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity(name = "order_item")
public class OrderItem {

    @EmbeddedId OrderItemId orderItemId;
    Integer itemQuantity;
    BigDecimal price;

    public OrderItemId getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(OrderItemId orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Integer getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(Integer itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
