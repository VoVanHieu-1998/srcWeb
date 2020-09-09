package com.cdweb.controller;

import com.cdweb.entity.Product;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/search/Product")
public class SearchProductController {
    @Autowired
    IProductService iProductService;

    @GetMapping
    public String getSeacrhProdcut(@RequestParam String keys, ModelMap modelMap){
        List<Product> productList= iProductService.searchProduct(keys);

        List<Product> productListbysearch= iProductService.searchProductbyKey(keys);




        modelMap.addAttribute("listSearch",productList);
        modelMap.addAttribute("keys",keys);

        return "list-search";
    }



}
