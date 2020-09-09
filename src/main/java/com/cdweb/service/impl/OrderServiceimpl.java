package com.cdweb.service.impl;

import com.cdweb.entity.Order;
import com.cdweb.repo.IOrderRepo;
import com.cdweb.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceimpl implements IOrderService {
    @Autowired
    IOrderRepo iOrderRepo;
    @Override
    public int addOrder(Order order) {
        return iOrderRepo.addOrder(order);
    }
}
