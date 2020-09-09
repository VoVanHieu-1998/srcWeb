package com.cdweb.repo;

import com.cdweb.entity.Comment;

import java.util.List;

public interface ICommentRepo {
    public Comment getCommentById(int id);
    public List<Comment> getAll();
    public int addComment(Comment comment);
    public void delete(Comment comment);
}
