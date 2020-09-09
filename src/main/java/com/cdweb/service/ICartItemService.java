package com.cdweb.service;

import com.cdweb.entity.CartItem;
import com.cdweb.entity.CartItemId;

import java.util.List;
import java.util.Set;

public interface ICartItemService {
    void update(CartItem cartItem);

    CartItem getCartitem1(int pdid);

    CartItemId addCartItem(CartItem cartItem);

    CartItem getCartItem(int cartId);

    List<CartItem> getCartId(int cartId);

    void updateCart(CartItem cartItem);
}
