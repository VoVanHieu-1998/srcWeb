package com.cdweb.controller.client.api;


import com.cdweb.entity.Product;
import com.cdweb.exception.searchProduct.SearchProductException;
import com.cdweb.model.response.ApiSuccessResponse;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/search")
public class APISearchProductController {

    @Autowired
    IProductService productService;

    @GetMapping("/{keys}")
    public ResponseEntity<ApiSuccessResponse> getUserById(@PathVariable String keys) {
        List<Product> products = productService.searchProductbyKey(keys);
        if (!products.isEmpty()) {
            ApiSuccessResponse response = new ApiSuccessResponse();
            response.setData(products);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            throw new SearchProductException("Product was not found for the key {" + keys + "}");
        }
    }


}
