package com.cdweb.controller.client.api;

import com.cdweb.controller.client.DetailProduct;
import com.cdweb.entity.*;
import com.cdweb.model.ProductDetailModel;
import com.cdweb.service.ICartItemService;
import com.cdweb.service.ICartService;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/cart")
public class APICartController2 {
    @Autowired
    IProductDetailService iProductDetailService;
    @Autowired
    IProductService iProductService;
    @Autowired
    ICartItemService iCartItemService;

    List<CartSession> cartSessions = new ArrayList<>();
    List<CartItem> giohang = new ArrayList<>();

    @GetMapping("/add")
    public ResponseEntity<Void> addItem(HttpSession session,
                                        @RequestParam(name = "productDetailId") int productDetailId,
                                        @RequestParam(name = "quantity", required = false, defaultValue = "1") int quantity) {

        System.out.println("enter this function");
        Users user = (Users) session.getAttribute("user");
        ProductDetailModel detailModel = iProductDetailService.getPDMByDetailId(productDetailId);
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
//            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
            Cart cart = user.getCart();
            if (detailModel != null) {
                // process
                cart.addCartItem(detailModel);
                System.out.println("quantity");
                System.out.println(cart.getData().get(productDetailId).getItemQuantity());
            }
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/delete")
    public ResponseEntity<Void> delete(HttpSession session,
                                       @RequestParam(name = "productDetailId") int productDetailId,
                                       @RequestParam(name = "quantity", required = false, defaultValue = "1") int quantity) {

        System.out.println("enter this function");
        Users user = (Users) session.getAttribute("user");
        ProductDetailModel detailModel = iProductDetailService.getPDMByDetailId(productDetailId);
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
//            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
            Cart cart = user.getCart();
            if (detailModel != null) {
//                // process
//                cart.addCartItem(detailModel);
//                System.out.println("quantity");
//                System.out.println(cart.getData().get(productDetailId).getItemQuantity());
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/changeStatus")
    public ResponseEntity<Void> changeStatus(HttpSession session,
                                             @RequestParam(name = "productDetailId") int productDetailId,
                                             @RequestParam(name = "status", required = false) boolean status) {

        System.out.println("enter this function change status " + productDetailId);
        Users user = (Users) session.getAttribute("user");
        ProductDetailModel detailModel = iProductDetailService.getPDMByDetailId(productDetailId);
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
//            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
            Cart cart = user.getCart();
            int statusInt;
            if (status) {
                statusInt = 1;
            } else {
                statusInt = 0;
            }

            if (detailModel != null) {
//                // process
                cart.changeStatusOCartItem(productDetailId, statusInt);
//                System.out.println("quantity");
//                System.out.println(cart.getData().get(productDetailId).getItemQuantity());
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/quantity")
    public ResponseEntity<Void> quantity(HttpSession session,
                                         @RequestParam(name = "productDetailId") int productDetailId,
                                         @RequestParam(name = "quantity", required = false, defaultValue = "1") int quantity) {
        Users user = (Users) session.getAttribute("user");
        ProductDetail p = iProductDetailService.getPDByDetailId(productDetailId);
        int quantityRes = 0;
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
//            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
            Cart cart = user.getCart();
            if (p != null) {
                // process.......
                cart.inputQuantity(productDetailId, quantity);
//                CartItem cartItem = cart.getData().get(productDetailId);
//                iCartItemService.updateCart(cartItem);
//                user.setCart(cart);
//                session.setAttribute("user", user);

            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

}

