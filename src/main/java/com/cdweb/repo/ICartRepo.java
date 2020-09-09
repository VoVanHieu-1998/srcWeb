package com.cdweb.repo;

import com.cdweb.entity.Cart;

import java.util.List;

public interface ICartRepo {
    int addCart(Cart cart);
    Cart getCart(int cartId);
    int updateCart(Cart cart);
}
