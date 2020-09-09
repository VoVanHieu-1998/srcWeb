package com.cdweb.service.impl;

import com.cdweb.entity.OrderItem;
import com.cdweb.repo.IOrderItemRepo;
import com.cdweb.service.IOrderItemService;
import com.cdweb.service.IOrderService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemServiceimpl implements IOrderItemService {
    @Autowired
    IOrderItemRepo iOrderItemRepo;
    @Override
    public boolean addOrderItem(OrderItem orderItem) {
        return iOrderItemRepo.addOrderItem(orderItem);
    }
}
