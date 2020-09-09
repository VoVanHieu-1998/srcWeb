package com.cdweb.repo.impl;

import com.cdweb.entity.Product;
import com.cdweb.entity.ProductDetail;
import com.cdweb.repo.IProductDetailRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public class ProductDetailimpl implements IProductDetailRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public ProductDetail getPDById(int productdetailId) {
        Session session = sessionFactory.getCurrentSession();
        ProductDetail productDetail = (ProductDetail) session.createQuery("from product_detail where itemStatus =1 and productdetailId=" + productdetailId).getSingleResult();

        return productDetail;
    }

}
