package com.cdweb.controller.client;

import com.cdweb.entity.CartSession;
import com.cdweb.entity.MenuItem;
import com.cdweb.service.IMenuIteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/header")
@SessionAttributes({"cart","menu"})
public class HeaderController {
    @Autowired
    IMenuIteService iMenuIteService;
    @GetMapping
    public String cart(HttpSession session, ModelMap modelMap){
        /*Start Load menu*/
        List<MenuItem> mobileMenu1=iMenuIteService.getMenu(2,0,4);
        List<MenuItem> mobileMenu2=iMenuIteService.getMenu(2,4,4);
        List<MenuItem> mobileMenu3=iMenuIteService.getMenu(2,8,4);
        modelMap.addAttribute("mobileMenu1",mobileMenu1);
        modelMap.addAttribute("mobileMenu2",mobileMenu2);
        modelMap.addAttribute("mobileMenu3",mobileMenu3);



        List<MenuItem> tablet1=iMenuIteService.getMenu(18,0,4);
        List<MenuItem> tablet2=iMenuIteService.getMenu(18,4,4);
        List<MenuItem> tablet3=iMenuIteService.getMenu(18,8,1);
        modelMap.addAttribute("tablet1",tablet1);
        modelMap.addAttribute("tablet2",tablet2);
        modelMap.addAttribute("tablet3",tablet3);


        List<MenuItem> laptop1=iMenuIteService.getMenu(28,0,4);
        List<MenuItem> laptop2=iMenuIteService.getMenu(28,4,1);
        modelMap.addAttribute("laptop1",laptop1);
        modelMap.addAttribute("laptop2",laptop2);

        List<MenuItem> phukien1=iMenuIteService.getMenu(34,0,4);
        List<MenuItem> phukien2=iMenuIteService.getMenu(34,4,4);
        modelMap.addAttribute("phukien1",phukien1);
        modelMap.addAttribute("phukien2",phukien2);
        /*End menu*/

        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
            modelMap.addAttribute("listgiohang", gioHangs);
        }


        return "layout/client/header";
    }
}
