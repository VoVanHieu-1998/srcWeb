package com.cdweb.service.impl;

import com.cdweb.entity.Reply;
import com.cdweb.repo.IReplyRepo;
import com.cdweb.service.IReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceimpl implements IReplyService {
    @Autowired
    IReplyRepo iReplyRepo;
    @Override
    public Reply getReplyById(int id) {
        return iReplyRepo.getReplyById(id);
    }

    @Override
    public List<Reply> getAll() {
        return iReplyRepo.getAll();
    }

    @Override
    public int addReply(Reply reply) {
        return iReplyRepo.addReply(reply);
    }
}
