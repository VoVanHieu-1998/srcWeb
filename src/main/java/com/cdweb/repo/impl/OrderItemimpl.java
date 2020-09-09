package com.cdweb.repo.impl;

import com.cdweb.entity.OrderItem;
import com.cdweb.entity.OrderItemId;
import com.cdweb.repo.IOrderItemRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class OrderItemimpl implements IOrderItemRepo {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public boolean addOrderItem(OrderItem orderItem) {
        Session session = sessionFactory.getCurrentSession();
        OrderItemId id =(OrderItemId) session.save(orderItem);
        if (id!=null){
            return true;
        }else {
            return false;
        }
    }
}
