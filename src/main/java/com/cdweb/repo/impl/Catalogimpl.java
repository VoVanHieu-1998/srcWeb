package com.cdweb.repo.impl;

import com.cdweb.entity.Catalog;
import com.cdweb.repo.ICatalog;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
public class Catalogimpl implements ICatalog {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public List<Catalog> listCatalogParent() {
        List<Catalog> list = sessionFactory.getCurrentSession().createQuery("from catalog").getResultList();
        return list;
    }

    @Override
    @Transactional
    public List<Catalog> listCatalog(int Id) {
        List<Catalog> list = sessionFactory.getCurrentSession().createQuery("from catalog where catalog.ParentId="+Id).getResultList();
        return list;
    }

    @Override
    @Transactional
    public Catalog getCatalogId(int Id) {
        Catalog c = (Catalog) sessionFactory.getCurrentSession().createQuery("from catalog where catalogId="+Id).getSingleResult();
        return  c;
    }
}
