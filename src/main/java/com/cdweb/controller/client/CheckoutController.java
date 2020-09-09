package com.cdweb.controller.client;

import com.cdweb.entity.*;
import com.cdweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
    @Autowired
    IMenuIteService iMenuIteService;

    @Autowired
    IProductDetailService productDetailService;

    @Autowired
    ICartItemService cartItemService;

    @Autowired
    IOrderService iOrderService;

    @Autowired
    IOrderItemService iOrderItemService;

    @Autowired
    IProductDetailService iProductDetailService;

    @GetMapping
    public String cart(HttpSession session, ModelMap modelMap) {
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho

            Cart cart = user.getCart();
            CartItemId cartItemId = new CartItemId();
            cartItemId.setCartId(cart.getCartId());
            Set<CartItem> cartItem = (Set<CartItem>) cart.getCartItems();
            for (CartItem c : cartItem) {
                System.out.println(c.getItemQuantity() + "aaaaaaaaaaaaa");
            }

            modelMap.addAttribute("cartItem", cartItem);
//            user.updateCart();

        }
        return "checkout";

    }

    @RequestMapping("/add/order")
    public String addOrder(HttpSession session, ModelMap modelMap) {

        Order order = new Order();
        if (session.getAttribute("user") != null) {
            Users users = (Users) session.getAttribute("user");
            Cart cart = users.getCart();
            order.setUsers_order(users);
            order.setStatus(0);
            order.setOrderDate(new Date());
            order.setTotalPrice(cart.totalPriceItemsCheckout());
            int id = iOrderService.addOrder(order);

            if (id > 0) {

                Set<CartItem> cartItems = cart.getCartItems();
                for (CartItem c : cartItems) {
                    if (c.getStatus() == 1) {
                        CartItemId cartItemId = c.getItemId();

                        ProductDetail productDetail = iProductDetailService.getPDById(cartItemId.getProductdetailId());

                        OrderItemId orderItemId = new OrderItemId();
                        orderItemId.setProductdetailId(cartItemId.getProductdetailId());
                        orderItemId.setOrderId(order.getOrderId());

                        OrderItem orderItem = new OrderItem();

                        orderItem.setOrderItemId(orderItemId);
                        orderItem.setItemQuantity(c.getItemQuantity());
                        orderItem.setPrice(productDetail.getPromotion_price());
                        iOrderItemService.addOrderItem(orderItem);

                        c.setStatus(-1);


                        cartItemService.update(c);

                    }

                }
            }
            modelMap.addAttribute("order", order);

        }
        return "redirect:/checkout";
    }

    @RequestMapping("/delete/{productdetailId}")
    public String delete(@PathVariable int productdetailId) {
        CartItemId cartItemId = new CartItemId();
        cartItemId.setProductdetailId(productdetailId);

        CartItem cartItem = cartItemService.getCartitem1(productdetailId);
        cartItem.setProductDetail(cartItem.getProductDetail());
        cartItem.setStatus(-1);

        cartItemService.update(cartItem);
        return "redirect:/checkout";
    }
}
