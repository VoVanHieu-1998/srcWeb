package com.cdweb.service.impl;

import com.cdweb.entity.CartItem;
import com.cdweb.entity.CartItemId;
import com.cdweb.repo.ICartItemRepo;
import com.cdweb.service.ICartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class CartItemServiceimpl implements ICartItemService {
    @Autowired
    ICartItemRepo iCartItemRepo;
    @Override
    public CartItemId addCartItem(CartItem cartItem) {
        return iCartItemRepo.addCartItem(cartItem);
    }

    @Override
    public CartItem getCartItem(int cartId) {
        return iCartItemRepo.getCartItem(cartId);
    }

    @Override
    public List<CartItem> getCartId(int cartId) {
        return iCartItemRepo.getCartId(cartId);
    }

    @Override
    public void update(CartItem cartItem) {
        iCartItemRepo.update(cartItem);
    }

    @Override
    public CartItem getCartitem1(int pdid) {
        return iCartItemRepo.getCartitem1(pdid);
    }

    @Override
    public void updateCart(CartItem cartItem) {
          iCartItemRepo.updateCart(cartItem);
    }
}
