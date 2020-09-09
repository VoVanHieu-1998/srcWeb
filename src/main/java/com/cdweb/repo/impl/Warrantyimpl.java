package com.cdweb.repo.impl;

import com.cdweb.entity.Catalog;
import com.cdweb.entity.Warranty;
import com.cdweb.repo.IWarranty;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
public class Warrantyimpl implements IWarranty {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public List<Warranty> listAll() {
        List<Warranty> warrantyList = sessionFactory.getCurrentSession().createQuery("from warranty").getResultList();
        return warrantyList;
    }

    @Override
    @Transactional
    public Warranty getWarrantyId(int Id) {
        Warranty w = (Warranty) sessionFactory.getCurrentSession().createQuery("from warranty where warrantyId="+Id).getSingleResult();
        return w;
    }
}
