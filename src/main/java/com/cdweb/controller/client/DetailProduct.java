package com.cdweb.controller.client;

import com.cdweb.entity.*;
import com.cdweb.service.IMenuIteService;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/DetailProduct")
public class DetailProduct {
    @Autowired
    IProductService iProductService;

    @Autowired
    IMenuIteService iMenuIteService;

    @Autowired
    IProductDetailService iProductDetailService;
    @GetMapping("/{code}")
    public String getProductByCode(@PathVariable String code, ModelMap modelMap) {

        Product product = iProductService.getProductByCode(code);
        List<Product> list = iProductService.listproduct(1, 1,0);
        Set<ProductDetail> productDetails = product.getProductDetails();

        List<ProductDetail> productDetailList = new ArrayList<>();


        Spec spec = null;
        for (ProductDetail pd : productDetails) {
            productDetailList.add(pd);
            spec = pd.getSpec_proDetail();

        }
        Set<Comment>comments=product.getComments();

        modelMap.addAttribute("list", list);
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("comments", comments);
        modelMap.addAttribute("productDetailList", productDetailList);
        modelMap.addAttribute("spec", spec);

        return "single-product";
    }



}
