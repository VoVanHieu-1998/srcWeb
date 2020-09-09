package com.cdweb.controller.client;

import com.cdweb.entity.*;
import com.cdweb.model.ProductDetailModel;
import com.cdweb.model.ProductModel;
import com.cdweb.service.IMenuIteService;
import com.cdweb.service.IProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    IMenuIteService iMenuIteService;
    @Autowired
    IProductDetailService iProductDetailService;
    @Autowired
    IProductDetailService productDetailService;

    @GetMapping()
    public String cart(HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
//            user.updateCart();
        }
        return "cart";
    }


}
