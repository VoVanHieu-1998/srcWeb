package com.cdweb.controller.client.api;


import com.cdweb.entity.*;
import com.cdweb.exception.auth.LoginException;
import com.cdweb.model.ProductDetailModel;
import com.cdweb.model.ProductModel;
import com.cdweb.model.request.UserModelRequest;
import com.cdweb.service.ICartService;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RestController
@RequestMapping("/api/sign")
public class APISignController {

    @Autowired
    IUserService userService;

    @Autowired
    HttpSession session;

    @Autowired
    ICartService iCartService;


    @PostMapping(value = "/login", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> login(@Valid @ModelAttribute UserModelRequest user,
                                        BindingResult theBindingResult) throws MethodArgumentNotValidException {
        if (theBindingResult.hasErrors()) {
            throw new MethodArgumentNotValidException(null, theBindingResult);
        } else {
            Users users = userService.login(user);
            users.setCart(iCartService.getCart(users.getCart().getCartId()));

            session.setAttribute("user", users);
            String sb = "{\"id\":" + users.getUserId() + "}";
            return new ResponseEntity<>(sb, HttpStatus.OK);
        }
    }

    @GetMapping(value = "/logout", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> logout(HttpSession session) {
        session.invalidate();
        String sb = "{\"logout\": \"success\"}";
        return new ResponseEntity<>(sb, HttpStatus.OK);
    }
}
