package com.cdweb.repo.impl;

import com.cdweb.entity.Cart;
import com.cdweb.repo.ICartRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Cartimpl implements ICartRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public int addCart(Cart cart) {
        Session session = sessionFactory.getCurrentSession();
        int cart1 = (int) session.save(cart);
        return cart1;
    }

    @Override
    @Transactional
    public Cart getCart(int cartId) {
        Session session = sessionFactory.getCurrentSession();
        Cart cart = (Cart) session.createQuery("from cart where cartId=" + cartId).getSingleResult();
        return cart;
    }

    @Override
    public int updateCart(Cart cart) {
        Session session = sessionFactory.getCurrentSession();
        session.update(cart);
        return 0;
    }
}
