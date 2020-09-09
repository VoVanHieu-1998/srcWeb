package com.cdweb.controller.Admin;

import com.cdweb.entity.*;
import com.cdweb.exception.searchProduct.SearchProductException;
import com.cdweb.service.*;
import com.cdweb.utils.Constant;
import com.cdweb.validator.ProductValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class AdminProductController {

    @Autowired
    IProductService iProductService;
    @Autowired
    ICatalogService catalogService;
    @Autowired
    IBrandService brandService;
    @Autowired
    IWarrantyService warrantyService;
    @Autowired
    ProductValidator productValidator;
    @Autowired
    SessionFactory sessionFactory;

    Pagging page= new Pagging(10);


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        if (binder.getTarget() == null) {
            return;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        if (binder.getTarget().getClass() == Product.class) {
            binder.setValidator(productValidator);
        }
    }
    @GetMapping("/admin/product/list")
    public String getProduct(ModelMap modelMap){
//        List<Product> productList = iProductService.listStatus();
//        pape.setTotalRecords(productList.size());
//        System.out.println(iProductService.totalItem());
//        modelMap.addAttribute("productList",productList);
        page.setTotalRecords(iProductService.totalItem());
        page.setOffset(1);
        page.setIndexPage(1);
        List<Product> productList = iProductService.listProductPerPape(page);
        modelMap.addAttribute("productList",productList);
        modelMap.addAttribute("page",page);


//        System.out.println("admin list product");
        return "admin/list-product";
    }
    @GetMapping("/admin/product/list/{Id}")
    public String getProduct(@PathVariable("Id") int Id,ModelMap modelMap){
//        List<Product> productList = iProductService.listStatus();
//        pape.setTotalRecords(productList.size());
//        System.out.println(iProductService.totalItem());
//        modelMap.addAttribute("productList",productList);
        page.setTotalRecords(iProductService.totalItem());
        page.setOffset(Id);
        page.setIndexPage(Id);
        List<Product> productList = iProductService.listProductPerPape(page);
        modelMap.addAttribute("productList",productList);
        modelMap.addAttribute("page",page);
        System.out.println("admin list product pape");
        return "admin/list-product";
    }
    @GetMapping("/admin/product/delete/{code}")
    public String deleteProduct(@PathVariable("code") String code, HttpSession session,ModelMap modelMap){
        System.out.println("del del del");
        Product productD = iProductService.getProductByCode(code);
        productD.setStatus(-1);
        productD.setDateModified(new Date());
        try{
            iProductService.delete(productD);
            session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
        }
        catch (Exception e){
            session.setAttribute(Constant.MSG_ERROR, "Delete fail !!!");
        }
                




        return "redirect:/admin/product/list";
    }
    @GetMapping("/admin/product/edit/{code}")
    public String editProduct(@PathVariable("code") String code,ModelMap modelMap){
        List<Catalog> catalogs = catalogService.listCatalogParent();
        Product product = iProductService.getProductByCode(code);
        product.setImageArr();
        List<Brand> brands = brandService.listAll();
        List<Warranty> warranties = warrantyService.listAll();
//        String[] listimage = product.setImageArr();

        modelMap.addAttribute("listCatalog",catalogs);
        modelMap.addAttribute("listBrand",brands);
        modelMap.addAttribute("listWarranty",warranties);
        modelMap.addAttribute("product",product);
        modelMap.addAttribute("listimage",product.getImageArr());
        modelMap.addAttribute("viewOnly", true);


        System.out.println("edit p");
        return "admin/new-edit-product";
    }
    @GetMapping("/admin/product/add")
    public String addProduct(ModelMap modelMap){
        List<Catalog> catalogs = catalogService.listCatalogParent();
        List<Brand> brands = brandService.listAll();
        List<Warranty> warranties = warrantyService.listAll();

        modelMap.addAttribute("listCatalog",catalogs);
        modelMap.addAttribute("listBrand",brands);
        modelMap.addAttribute("listWarranty",warranties);
        modelMap.addAttribute("product",new Product());
        modelMap.addAttribute("viewOnly", false);
        System.out.println("add p");
        return "admin/new-edit-product";
    }
    @ResponseBody
    @GetMapping("/admin/product/changeStatusProduct/{code}")
    public void changeStatusProduct(@PathVariable("code") String code){
        System.out.println("status @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        Product productD = iProductService.getProductByCode(code);

        if (productD!=null){
            if (productD.getStatus()==1){
                productD.setStatus(0);
                productD.setDateModified(new Date());
                iProductService.update(productD);
            }
            else {
                productD.setStatus(1);
                productD.setDateModified(new Date());
                iProductService.update(productD);
            }
        }

    }
    @PostMapping(path = "/admin/product/add")
    public String addUpdateProduct(@ModelAttribute("product") @Validated Product product, BindingResult result, Model model, HttpSession session ) {

        if (result.hasErrors()) {
            System.out.println("99999999999999999999999999999999999999999999999999999999999999999999999"+result.hasErrors());

            List<Catalog> catalogs = catalogService.listCatalogParent();
            List<Brand> brands = brandService.listAll();
            List<Warranty> warranties = warrantyService.listAll();

            model.addAttribute("listCatalog",catalogs);
            model.addAttribute("listBrand",brands);
            model.addAttribute("listWarranty",warranties);
            model.addAttribute("product",new Product());
            model.addAttribute("product", product);

            return "admin/new-edit-product";
        }
        System.out.println("post add update");
        System.out.println(product.getProductCode()+product.getProductId()+"haha");

        Catalog catalog = this.catalogService.getCatalogId(product.getCatalog().getCatalogId());
        Brand brand = this.brandService.getBranId(product.getBrand().getBrandId());
        Warranty warranty = this.warrantyService.getWarrantyId(product.getWaranty().getWarrantyId());
        product.setCatalog(catalog);
        product.setBrand(brand);
        product.setWaranty(warranty);

        String path="D:/projectweb/mobilespringmvc/src/main/webapp/resources/Image/"+product.getProductCode();
        List<MultipartFile> multipartFiles = product.getImages();

        if (product.getProductId()!=0){

            try{

                String s="";
                for (MultipartFile file:multipartFiles) {
                    String fileName = file.getOriginalFilename();
                    File filesave = new File(path, fileName);
                    if (!filesave.exists()) {
                        filesave.mkdirs();
                    }
                    file.transferTo(filesave);
                    s+=fileName+"|";
                }
                product.setImageList(s);
            }
            catch (Exception e){

            }
            iProductService.update(product);
            System.out.println("update sussces");
        }
        else{
            try{

                String s="";
                for (MultipartFile file:multipartFiles) {
                    String fileName = file.getOriginalFilename();
                    File filesave = new File(path, fileName);
                    if (!filesave.exists()) {
                        filesave.mkdirs();
                    }
                    file.transferTo(filesave);
                    s+=fileName+"|";
                }
                product.setImageList(s);
            }
            catch (Exception e){

            }

            if (iProductService.create(product)==true)System.out.println("create sussces");
            else System.out.println("create error");


        }
        return "redirect:/admin/product/list";
    }
    @ResponseBody
    @GetMapping("/admin/product/checkcode/{keys}")
    public String checkProductCode(@PathVariable String keys) {
        Product p = iProductService.getProductByCode(keys);
        if (p!=null) {
            return "SKU invalid";
        }
        else {
            return "SKU valid";
        }

    }


}
