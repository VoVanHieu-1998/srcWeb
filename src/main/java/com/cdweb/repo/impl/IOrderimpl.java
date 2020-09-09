package com.cdweb.repo.impl;

import com.cdweb.entity.Order;
import com.cdweb.repo.IOrderRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class IOrderimpl implements IOrderRepo {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public int addOrder(Order order) {
        Session session =sessionFactory.getCurrentSession();
        int id =(int) session.save(order);
        return id;
    }
}
