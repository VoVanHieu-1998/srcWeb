package com.cdweb.service;

import com.cdweb.entity.ProductDetail;
import com.cdweb.model.ProductDetailModel;

public interface IProductDetailService {
    ProductDetail getPDById(int productDetailId);

    ProductDetail getPDByDetailId(int productDetailId);

    ProductDetailModel getPDMByDetailId(int productDetailId);
}
