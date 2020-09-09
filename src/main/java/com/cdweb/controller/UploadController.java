package com.cdweb.controller;

import com.cdweb.entity.MyFile;
import com.cdweb.entity.Pagging;
import com.cdweb.entity.Product;
import com.cdweb.service.IProductService;
import com.cdweb.validator.FileValidator;
import com.cdweb.validator.ProductValidator;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UploadController {
    @Autowired
    FileValidator fileValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        if (binder.getTarget() == null) {
            return;
        }
        if (binder.getTarget().getClass() == Product.class) {
            binder.setValidator(fileValidator);
        }
    }

    @RequestMapping("/upload")
    public String index(Model model) {
        model.addAttribute("myFile", new MyFile());


        return "admin/upload";
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFile(@ModelAttribute("myFile") @Validated MyFile myFile, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/upload";
        }
        return "view-user";
    }

}
