package com.cdweb.service.impl;

import com.cdweb.entity.Comment;
import com.cdweb.repo.ICommentRepo;
import com.cdweb.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceimpl implements ICommentService {
    @Autowired
    ICommentRepo iCommentRepo;
    @Override
    public Comment getCommentById(int id) {
        return iCommentRepo.getCommentById(id);
    }

    @Override
    public List<Comment> getAll() {
        return iCommentRepo.getAll();
    }

    @Override
    public int addComment(Comment comment) {
        return iCommentRepo.addComment(comment);
    }

    @Override
    public void delete(Comment comment) {
        iCommentRepo.delete(comment);
    }
}
