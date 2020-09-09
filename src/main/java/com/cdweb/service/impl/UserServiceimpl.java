package com.cdweb.service.impl;

import com.cdweb.entity.Users;
import com.cdweb.exception.auth.LoginException;
import com.cdweb.model.request.UserModelRequest;
import com.cdweb.repo.IUserRepo;
import com.cdweb.service.IUserService;
import com.cdweb.utils.MD5;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;

@Service
public class UserServiceimpl implements IUserService {

    private final IUserRepo userRepo;

    public UserServiceimpl(IUserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public Users getUserById(int userId) {
        return userRepo.getUserById(userId);
    }

    @Override
    public Users login(UserModelRequest user) {
        user.setPassword(MD5.encryption(user.getPassword()));
        try {
            return userRepo.login(user.getUsername(), user.getPassword());
        } catch (NoResultException e) {
            throw new LoginException("Username or password was invalid!");
        }
    }
}
