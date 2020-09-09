package com.cdweb.service;

import com.cdweb.entity.Comment;

import java.util.List;

public interface ICommentService {
    public Comment getCommentById(int id);
    public List<Comment> getAll();
    public int addComment(Comment comment);
    public void delete(Comment comment);
}
