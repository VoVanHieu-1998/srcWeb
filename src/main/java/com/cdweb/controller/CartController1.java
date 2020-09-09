package com.cdweb.controller;

import com.cdweb.entity.CartSession;
import com.cdweb.entity.GioHang;
import com.cdweb.entity.MenuItem;
import com.cdweb.service.IMenuIteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/*@Controller
@RequestMapping("/cart")
@SessionAttributes("cart")*/
public class CartController1 {
/*
    @Autowired
    IMenuIteService iMenuIteService;
    @GetMapping
    public String cart(HttpSession session, ModelMap modelMap){

        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
            modelMap.addAttribute("listgiohang", gioHangs);

        }
        return "cart";
    }
*/


}
