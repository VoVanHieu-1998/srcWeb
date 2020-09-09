package com.cdweb.service.impl;

import com.cdweb.entity.*;
import com.cdweb.model.ProductDetailModel;
import com.cdweb.model.ProductModel;
import com.cdweb.repo.ICartRepo;
import com.cdweb.service.ICartService;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Service
public class CartServiceimpl implements ICartService {
    @Autowired
    ICartRepo iCartRepo;

    @Autowired
    IProductDetailService iProductDetailService;
    @Autowired
    IProductService iProductService;

    @Override
    public int addCart(Cart cart) {
        return iCartRepo.addCart(cart);
    }

    @Override
    public int updateCart(Cart cart) {
        return iCartRepo.updateCart(cart);
    }

    @Override
    public Cart getCart(int cartId) {
        Cart cart = iCartRepo.getCart(cartId);
        return getUserCart(cart);
    }

    private Cart getUserCart(Cart cart) {
        Map<Integer, CartItem> map = new HashMap<>();

        Set<CartItem> cartItem = cart.getCartItems();
        for (CartItem item : cartItem) {
            ProductDetail productDetail = iProductDetailService.getPDById(item.getItemId().getProductdetailId());
            productDetail.getColor_proDetail().setName_eng();

            Product product = iProductService.getProductId(productDetail.getProduct_proDetail().getProductId());

            ProductModel productModel = new ProductModel();
            productModel.setProductId(product.getProductId());
            productModel.setCode(product.getProductCode());
            productModel.setName(product.getName());
            productModel.setImage(product.getImageList());
            productModel.setImageArr(product.getImageArr());

            ProductDetailModel detailModel = new ProductDetailModel();
            detailModel.setProduct(productModel);
            detailModel.setQuantity(productDetail.getQuantity());
            detailModel.setProductdetailId(productDetail.getProductdetailId());
            detailModel.setColor_proDetail(productDetail.getColor_proDetail());
            detailModel.setPrice(productDetail.getPrice());
            detailModel.setPromotion_price(productDetail.getPromotion_price());
            detailModel.setImg_url(productDetail.getImg_url());

            item.setProductDetail(detailModel);
            if (item.getStatus() != -1) {
                map.put(item.getItemId().getProductdetailId(), item);
            }
            System.out.println("items2: " + item.getItemQuantity());
        }
        cart.setData(map);
        cart.setTotalItems();

        return cart;
    }
}
