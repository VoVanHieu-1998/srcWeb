package com.cdweb.repo.impl;

import com.cdweb.entity.Users;
import com.cdweb.repo.IUserRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

@Repository
public class Userimpl implements IUserRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public Users getUserById(int userId) {
        Session session = sessionFactory.getCurrentSession();
        return (Users) session.createQuery("from user where userId=" + userId).getSingleResult();
    }

    @Override
    @Transactional
    public Users login(String username, String password) throws NoResultException {
        Session session = sessionFactory.getCurrentSession();
        return (Users) session.createQuery("from user where  username= '" + username + "' and password= '" + password + "'").getSingleResult();
    }
}
