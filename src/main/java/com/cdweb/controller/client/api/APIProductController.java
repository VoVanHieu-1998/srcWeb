package com.cdweb.controller.client.api;

import com.cdweb.entity.Product;
import com.cdweb.service.IProductService;
import com.cdweb.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
@RestController
@RequestMapping("api/")
public class APIProductController {
    @Autowired
    IProductService productService;

    @GetMapping("/listPd")
    public List<Product> getUserById( @RequestParam int begin) {

        List<Product> list= new ArrayList<>();
        List<Product> products = productService.listproduct(1,1,begin);
        for (Product p:products) {
            list.add(p);
            System.out.println(p.getName()+"1111111111111111111111111111111111");
        }

        return list;
    }
}
