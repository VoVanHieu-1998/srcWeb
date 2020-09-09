package com.cdweb.service.impl;

import com.cdweb.entity.Product;
import com.cdweb.entity.ProductDetail;
import com.cdweb.model.ProductDetailModel;
import com.cdweb.model.ProductModel;
import com.cdweb.repo.IProductDetailRepo;
import com.cdweb.repo.IProductRepo;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;

@Service
public class ProductDetailService implements IProductDetailService {
    @Autowired
    IProductDetailRepo iProductDetailRepo;

    @Autowired
    IProductService iProductService;

    @Override
    public ProductDetail getPDById(int productDetailId) {
        ProductDetail productDetail = iProductDetailRepo.getPDById(productDetailId);
        return productDetail;

    }

    @Override
    public ProductDetail getPDByDetailId(int productDetailId) {
        ProductDetail productDetail = null;
        try {
            productDetail = iProductDetailRepo.getPDById(productDetailId);
            productDetail.getColor_proDetail().setName_eng();

            Product product = iProductService.getProductId(productDetail.getProduct_proDetail().getProductId());

        } catch (NoResultException e) {
            System.out.println("Không thấy nha m");
        }


        return productDetail;

    }

    @Override
    public ProductDetailModel getPDMByDetailId(int productDetailId) {
        ProductDetailModel detailModel = null;
        try {
            ProductDetail productDetail = iProductDetailRepo.getPDById(productDetailId);
            productDetail.getColor_proDetail().setName_eng();

            Product product = iProductService.getProductId(productDetail.getProduct_proDetail().getProductId());

            ProductModel productModel = new ProductModel();
            productModel.setProductId(product.getProductId());
            productModel.setCode(product.getProductCode());
            productModel.setName(product.getName());
            productModel.setImage(product.getImageList());
            productModel.setImageArr(product.getImageArr());

            detailModel = new ProductDetailModel();
            detailModel.setProduct(productModel);
            detailModel.setQuantity(productDetail.getQuantity());
            detailModel.setProductdetailId(productDetail.getProductdetailId());
            detailModel.setColor_proDetail(productDetail.getColor_proDetail());
            detailModel.setPrice(productDetail.getPrice());
            detailModel.setPromotion_price(productDetail.getPromotion_price());
            detailModel.setImg_url(productDetail.getImg_url());
        } catch (NoResultException e) {
            System.out.println("Không thấy nha m");
        }


        return detailModel;
    }
}
