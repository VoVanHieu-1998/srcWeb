package com.cdweb.model.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.validation.constraints.NotBlank;

public class UserModelRequest {
    @NotBlank(message = "username is not null")
    private String username;
    @NotBlank(message = "password is not null")
    private String password;

    public UserModelRequest() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
