package com.cdweb.validator;

import com.cdweb.entity.Product;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


//int productId;
//        String productCode;
//    Catalog catalog;
//            String name;
//            String settingInfo;
//            String description;
//            String promotionText;
//    Brand brand;
//            double price;
//            double promotionPrice;
//            String imageList;
//    String[] imageArr;
//            Integer quantity;
//            String video;
@Component
public class ProductValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product p = (Product) o;
        ValidationUtils.rejectIfEmpty(errors,"name","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"productCode","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"settingInfo","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"description","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"price","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"promotionPrice","msg.required");
        ValidationUtils.rejectIfEmpty(errors,"quantity","msg.required");

//        if (p.getQuantity()<0) errors.rejectValue("quantity","quantity not nagative");

    }
}
