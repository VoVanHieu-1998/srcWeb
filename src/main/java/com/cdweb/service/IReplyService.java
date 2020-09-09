package com.cdweb.service;

import com.cdweb.entity.Reply;

import java.util.List;

public interface IReplyService {
    public Reply getReplyById(int id);
    public List<Reply> getAll();
    public int addReply(Reply reply);
}
