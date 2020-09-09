package com.cdweb.repo.impl;

import com.cdweb.entity.Brand;
import com.cdweb.repo.IBrand;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
public class Brandimpl implements IBrand {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public Brand getBranId(int Id) {
        Brand brand = (Brand) sessionFactory.getCurrentSession().createQuery("from brand where brandId="+Id).getSingleResult();
        return brand;
    }

    @Override
    @Transactional
    public List<Brand> listAll() {
        List<Brand> brandList = sessionFactory.getCurrentSession().createQuery("from brand").getResultList();

        return brandList;
    }
}
