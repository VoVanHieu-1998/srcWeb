package com.cdweb.service;

import com.cdweb.entity.Users;
import com.cdweb.exception.auth.LoginException;
import com.cdweb.model.request.UserModelRequest;

public interface IUserService {
    Users getUserById(int userId);

    Users login(UserModelRequest user) ;
}
