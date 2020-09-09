package com.cdweb.repo;

import com.cdweb.entity.Comment;
import com.cdweb.entity.Reply;

import java.util.List;

public interface IReplyRepo {
    public Reply getReplyById(int id);
    public List<Reply> getAll();
    public int addReply(Reply reply);
}
