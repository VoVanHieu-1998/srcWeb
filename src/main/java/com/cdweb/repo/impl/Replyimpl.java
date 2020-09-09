package com.cdweb.repo.impl;

import com.cdweb.entity.Reply;
import com.cdweb.repo.IReplyRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class Replyimpl implements IReplyRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public Reply getReplyById(int id) {
        Session session=sessionFactory.getCurrentSession();
        Reply reply= (Reply) session.createQuery("from reply where id="+id).getSingleResult();
        return reply;
    }

    @Override
    public List<Reply> getAll() {
        Session session=sessionFactory.getCurrentSession();
        List<Reply> list=session.createQuery("from reply ").getResultList();
        return list;
    }

    @Override
    public int addReply(Reply reply) {
        Session session=sessionFactory.getCurrentSession();
        int id=(int) session.save(reply);
        return id;
    }
}
