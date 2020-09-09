package com.cdweb.repo;

import com.cdweb.entity.Users;

public interface IUserRepo {
    Users getUserById(int userId);

    Users login(String username, String password);
}
