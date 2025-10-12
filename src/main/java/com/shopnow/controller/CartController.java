package com.shopnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopnow.model.CartItem;
import com.shopnow.service.CartService;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/addtocart")
    public String addToCart(@RequestParam int productid,
                            @RequestParam String productname,
                            @RequestParam double price,
                            @RequestParam int quantity,
                            Model model) {

        CartItem item = new CartItem();
        item.setProductid(productid);
        item.setProductname(productname);
        item.setPrice(price);
        item.setQuantity(quantity);

        cartService.addToCart(item);

        model.addAttribute("cart", cartService.getCartItems());
        model.addAttribute("grandTotal", cartService.calculateTotal());

        return "Cart"; // JSP page to show cart
    }
}
