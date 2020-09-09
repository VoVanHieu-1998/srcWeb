package com.cdweb.controller.client.api;

import com.cdweb.entity.CartItem;
import com.cdweb.entity.CartSession;
import com.cdweb.entity.ProductDetail;
import com.cdweb.service.IProductDetailService;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/")
@SessionAttributes({"cart"})
public class APICartController {
    @Autowired
    IProductDetailService iProductDetailService;
    @Autowired
    IProductService iProductService;
    List<CartSession> cartSessions = new ArrayList<>();
    List<CartItem> giohang = new ArrayList<>();
    @GetMapping("addcart")
    public String addCart(@RequestParam int productId,@RequestParam String nameProduct,@RequestParam BigDecimal price,@RequestParam BigDecimal promotionPrice, HttpSession session){
        CartSession cartSession = new CartSession();
        cartSession.setProductId(productId);
        cartSession.setNameProduct(nameProduct);
        cartSession.setPromotionPrice(promotionPrice);
        cartSession.setPrice(price);
        cartSession.setQuantity(1);
        cartSessions.add(cartSession);
        session.setAttribute("cart",cartSessions);
        List<CartSession> cartSessions1= (List<CartSession>)session.getAttribute("cart");
        for (CartSession c:cartSessions1) {
            System.out.println("Tên sản phẩm"+c.getNameProduct()+"-"+"Giá tiền"+c.getNameProduct());
        }
        System.out.println(cartSessions.size()+"---"+cartSessions.size());
        return "ok";

    }

    @GetMapping("product/addToCart")
    @ResponseBody
    public void addCartPd(HttpSession session, @RequestParam int productId, @RequestParam String nameProduct, @RequestParam BigDecimal price, @RequestParam BigDecimal promotionPrice, @RequestParam int productdetailId, @RequestParam String code){

            if (null==session.getAttribute("cart")) {

                List<CartSession> cartSessions = new ArrayList<CartSession>();
                CartSession cartSession = new CartSession();
                cartSession.setProductId(productId);
                cartSession.setNameProduct(nameProduct);
                cartSession.setPrice(price);
                cartSession.setPromotionPrice(promotionPrice);
                cartSession.setQuantity(1);
                cartSession.setProductdetailId(productdetailId);
                cartSession.setCode(code);

                cartSessions.add(cartSession);

                session.setAttribute("cart", cartSessions);
            } else {
                ProductDetail productDetail =iProductDetailService.getPDById(productdetailId);
                List<CartSession> cartSessions = (List<CartSession>) session.getAttribute("cart");
                int index= ktraSanPhamTrung(productDetail.getProductdetailId(),session,cartSessions);
                if(index==-1) {
                    CartSession cartSession = new CartSession();
                    cartSession.setProductId(productId);
                    cartSession.setNameProduct(nameProduct);
                    cartSession.setPrice(price);
                    cartSession.setPromotionPrice(promotionPrice);
                    cartSession.setQuantity(1);
                    cartSession.setProductdetailId(productdetailId);
                    cartSession.setCode(code);

                    cartSessions.add(cartSession);
                    //add database;
                }else {
                    int soluongmoi= cartSessions.get(index).getQuantity() +1;
                    cartSessions.get(index).setQuantity(soluongmoi);

                }
            }

    }

    /*@GetMapping("productdetai/add")
    @ResponseBody
    public void addCartItem(HttpSession session,@RequestParam int cartId,@RequestParam int productdetailId){
        if (null==session.getAttribute("giohang")){
            CartItemId cartItemId = new CartItemId();
            cartItemId.setCartId(cartId);
            cartItemId.setProductdetailId(productdetailId);

            CartItem cartItem = new CartItem();
            cartItem.setItemId(cartItemId);
            cartItem.setItemQuantity(1);
            giohang.add(cartItem);
            session.setAttribute("giohang",giohang);
        }else{
            ProductDetail productDetail =iProductDetailService.getPDById(productdetailId);
            List<CartItem> giohang = (List<CartItem>) session.getAttribute("giohang");
            int index= ktraSanPhamTrung(productDetail.getProductdetailId(),session,giohang);
            if(index==-1) {
                CartItemId cartItemId = new CartItemId();
                cartItemId.setCartId(cartId);
                cartItemId.setProductdetailId(productdetailId);

                CartItem cartItem = new CartItem();
                cartItem.setItemId(cartItemId);
                cartItem.setItemQuantity(1);
                giohang.add(cartItem);

            }else {
                int soluongmoi= giohang.get(index).getItemQuantity() +1;
                giohang.get(index).setItemQuantity(soluongmoi);

            }
        }
    }
*/
    @GetMapping("deleteProductInCart/{productdetail}")
    @ResponseBody
    private void deleteProductInCart(HttpSession httpSession,@PathVariable int productdetail) {
        if (null != httpSession.getAttribute("cart") ) {
            List<CartSession> listGioHangs = (List<CartSession>) httpSession.getAttribute("cart");
           /* Product product = iProductService.getProductId(productId);*/
            ProductDetail productDetail = iProductDetailService.getPDById(productdetail);
            int vitri = ktraSanPhamTrung(productDetail.getProductdetailId(), httpSession, listGioHangs);
            listGioHangs.remove(vitri);
        }
    }
    @GetMapping("getquantitycart")
    @ResponseBody
    private String getQuantityCar(HttpSession session) {
        if (null != session.getAttribute("cart")) {
            List<CartSession> gioHangs = (List<CartSession>) session.getAttribute("cart");
            return  gioHangs.size()+"";
        }
        return "Ok";
    }
    private int ktSanPhamTrung(int productId, HttpSession httpSession,List<CartSession> lists) {
        for (int i = 0; i < lists.size(); i++) {
            if (lists.get(i).getProductId() == productId) {
                return i;
            }
        }

        return -1;
    }
    private int ktraSanPhamTrung(int productdetailId, HttpSession httpSession,List<CartSession> lists) {
        for (int i = 0; i < lists.size(); i++) {
            if (lists.get(i).getProductdetailId() == productdetailId) {
                return i;
            }
        }

        return -1;
    }
}

