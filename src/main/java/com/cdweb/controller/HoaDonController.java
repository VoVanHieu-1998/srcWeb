package com.cdweb.controller;

import com.cdweb.entity.*;
import com.cdweb.service.IMenuIteService;
import com.cdweb.service.IOrderItemService;
import com.cdweb.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/order")
@SessionAttributes("cart")
//@SessionAttributes("user")

public class HoaDonController {
    @Autowired
    IOrderService iOrderService;
    @Autowired
    IOrderItemService iOrderItemService;

    @Autowired
    IMenuIteService iMenuIteService;
    @GetMapping("/orderdetail")
    public  String order(HttpSession session, ModelMap modelMap){


        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
            modelMap.addAttribute("listgiohang", gioHangs);
        }
        return "proceed-to-checkout";
    }
    @PostMapping("/add")
    public String addOrder(HttpSession session){
        if(null!= session.getAttribute("cart")){
            List<CartSession> cartSessionList = (List<CartSession>) session.getAttribute("cart");
            Order order = new Order();
            order.setStatus(1);
            int id =iOrderService.addOrder(order);
            if(id>0){
                Set<OrderItem> orderItems= new HashSet<OrderItem>();
                for(CartSession cartSession :cartSessionList){
                    OrderItemId orderItemId = new OrderItemId();
                    orderItemId.setProductdetailId(cartSession.getProductdetailId());
                    orderItemId.setOrderId(order.getOrderId());

                    OrderItem orderItem = new OrderItem();
                    orderItem.setOrderItemId(orderItemId);
                    orderItem.setItemQuantity(cartSession.getQuantity());
                    //orderItem.setPrice(cartSession.getProductdetailId());

                    iOrderItemService.addOrderItem(orderItem);
                }
            }
        }
        return "proceed-to-checkout";
    }

}
