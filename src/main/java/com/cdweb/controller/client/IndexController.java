package com.cdweb.controller.client;

import com.cdweb.entity.CartSession;
import com.cdweb.entity.MenuItem;
import com.cdweb.entity.Product;
import com.cdweb.service.IMenuIteService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes("cart")
public class IndexController {

    @Autowired
    IProductService iProductServiceLimit;
    @Autowired
    IMenuIteService iMenuIteService;
    @GetMapping
    public String index(ModelMap modelMap, HttpSession session){

        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
            modelMap.addAttribute("listgiohang", gioHangs);
        }


        List<Product> listmobile = iProductServiceLimit.listproduct(1,1,0);
        List<Product> listtablet = iProductServiceLimit.listproduct(3,1,-1);
        List<Product> listlaptop = iProductServiceLimit.listproduct(2,1,-1);
        List<Product> listphukien = iProductServiceLimit.listproduct(10,1,-1);
        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
            modelMap.addAttribute("listgiohang", gioHangs);
        }
        List<Product> allListmobile = iProductServiceLimit.listproduct(1,1,-1);
        double tongsopage=Math.ceil((double)allListmobile.size()/5);
        modelMap.addAttribute("listmobile",listmobile);
        modelMap.addAttribute("tongsopage",tongsopage);
        modelMap.addAttribute("listtablet",listtablet);
        modelMap.addAttribute("listlaptop",listlaptop);
        modelMap.addAttribute("listphukien",listphukien);

        return "index";
    }
}
