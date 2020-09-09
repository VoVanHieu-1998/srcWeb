package com.cdweb.repo.impl;

import com.cdweb.entity.Comment;
import com.cdweb.repo.ICommentRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class Commentimpl implements ICommentRepo {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public Comment getCommentById(int id) {
        Session session=sessionFactory.getCurrentSession();
        Comment comment = (Comment) session.createQuery("from comment where id="+id).getSingleResult();
        return comment;
    }

    @Override
    public List<Comment> getAll() {
        Session session=sessionFactory.getCurrentSession();
        List<Comment> commentList=session.createQuery("from comment where activeFlag=1").getResultList();
        return commentList;
    }

    @Override
    public int addComment(Comment comment) {
        Session session=sessionFactory.getCurrentSession();
        int id=(int)session.save(comment);
        return id;
    }

    @Override
    public void delete(Comment comment) {
        Session session=sessionFactory.getCurrentSession();
        session.update(comment);
    }
}
