package com.cdweb.service;

import com.cdweb.entity.Cart;

public interface ICartService {
    int addCart(Cart cart);

    int updateCart(Cart cart);

    Cart getCart(int cartId);

}
