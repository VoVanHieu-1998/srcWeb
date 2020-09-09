package com.cdweb.repo.impl;

import com.cdweb.entity.CartItem;
import com.cdweb.entity.CartItemId;
import com.cdweb.repo.ICartItemRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CartItemimpl implements ICartItemRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public CartItemId addCartItem(CartItem cartItem) {
        Session session = sessionFactory.getCurrentSession();
        CartItemId itemId = (CartItemId) session.save(cartItem);
        return itemId;
    }

    @Override
    @Transactional
    public CartItem getCartItem(int cartId) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from cart_item where  itemId.cartId =" + cartId;
        CartItem cartItem = (CartItem) session.createQuery(sql).getSingleResult();
        return cartItem;
    }

    @Override
    @Transactional
    public List<CartItem> getCartId(int cartId) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from cart_item where  itemId.cartId =" + cartId;
        List<CartItem> cartItem =(List<CartItem>) session.createQuery(sql).getResultList();
        return cartItem;
    }

    @Override
    @Transactional
    public void update(CartItem cartItem) {
        Session session=sessionFactory.getCurrentSession();
        session.update(cartItem);
    }

    @Override
    @Transactional
    public CartItem getCartitem1(int pdid) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from cart_item where  itemId.productdetailId =" + pdid;
        CartItem cartItem = (CartItem) session.createQuery(sql).getSingleResult();
        return cartItem;
    }

    @Override
    public void updateCart(CartItem cartItem) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("update cart_item set itemQuantity = " + cartItem.getItemQuantity() + " where cart_item.id=" + cartItem.getItemId() + " and product_detail.id=" + cartItem.getProductDetail().getProductdetailId());
    }
}
