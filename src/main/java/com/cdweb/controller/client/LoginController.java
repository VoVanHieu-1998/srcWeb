package com.cdweb.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logine324")
public class LoginController {

    @GetMapping
    public String index(ModelMap modelMap) {
        return "login";
    }
}
