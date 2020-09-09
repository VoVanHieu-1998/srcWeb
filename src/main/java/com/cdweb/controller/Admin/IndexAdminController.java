package com.cdweb.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class IndexAdminController {

    @RequestMapping("/home")
    public String index(ModelAndView modelAndView) {

        return "admin/index";
    }
    @RequestMapping(name = "test")
    @ResponseBody
    public List<String> readProduct(){
        List<String> List = new ArrayList<>();
        List.add("a");
        List.add("b");
        List.add("c");

        return List;
    }

}
