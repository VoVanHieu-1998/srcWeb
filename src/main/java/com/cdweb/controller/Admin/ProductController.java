package com.cdweb.controller.Admin;


import com.cdweb.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class ProductController {

//    @Autowired
//    private ProductService product;
//
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public String listProduct(ModelMap mm) {
//        mm.put("listProduct", product.getListNav(0, 5));
//        mm.put("totalItem", product.totalItem() / 5);
//        return "product11_list";
//    }
//
//    @RequestMapping(value = "/list/{page}", method = RequestMethod.GET)
//    public String listProductByNav(ModelMap mm, @PathVariable("page") int page) {
//        mm.put("listProduct", product.getListNav((page - 1) * 5, 5));
//        mm.put("totalItem", product.totalItem() / 5);
//        return "product11_list";
//    }
//
//    @RequestMapping(value = "/create", method = RequestMethod.GET)
//    public String createProduct(ModelMap mm) {
//
//        return "product_form";
//    }
//
//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
//    public String editProduct(ModelMap mm, @PathVariable("id") int id) {
//        Product profile = product.findById(id);
//        return "product_form";
//    }
//
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
//    public String deleteProduct(ModelMap mm, @PathVariable("id") int id) {
//        Product profile = product.findById(id);
//        if (profile != null) {
//            product.delete(profile);
//        }
//        mm.put("listProduct", product.getListNav(0, 5));
//        mm.put("totalItem", product.totalItem() / 5);
//        return "product11_list";
//    }
//
//    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    public String saveProduct(ModelMap mm, @ModelAttribute("productAmin") Product productd) {
//        if (productd.getProductId() == 0) {
//            product.create(productd);
//        } else {
//            product.update(productd);
//        }
//        mm.put("listProduct", product.getListNav(0, 5));
//        mm.put("totalItem", product.totalItem() / 5);
//        return "product11_list";
//    }

}
