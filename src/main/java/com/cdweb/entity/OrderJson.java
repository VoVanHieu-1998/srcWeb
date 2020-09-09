package com.cdweb.entity;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

public class OrderJson {

    Integer orderId;

    Users users_order;
    String orderDate;
    Integer status;
    Double totalPrice;

    List<OrderItem> orderItemSet;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Users getUsers_order() {
        return users_order;
    }

    public void setUsers_order(Users users_order) {
        this.users_order = users_order;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<OrderItem> getOrderItemSet() {
        return orderItemSet;
    }

    public void setOrderItemSet(List<OrderItem> orderItemSet) {
        this.orderItemSet = orderItemSet;
    }
}
