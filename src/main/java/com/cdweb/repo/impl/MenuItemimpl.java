package com.cdweb.repo.impl;

import com.cdweb.entity.MenuItem;
import com.cdweb.repo.IMenuitemRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class MenuItemimpl implements IMenuitemRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<MenuItem> getMenu(int parent_menu, int x, int y) {
        Session session= sessionFactory.getCurrentSession();
        List<MenuItem> listmenuItem =  session.createQuery("from menuitems where parent_menu="+parent_menu).setFirstResult(x).setMaxResults(y).getResultList();
        return listmenuItem;
    }
}
