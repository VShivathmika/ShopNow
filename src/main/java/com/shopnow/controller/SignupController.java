package com.shopnow.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopnow.model.CartItem;
import com.shopnow.model.OrderForm;
import com.shopnow.model.Products;
import com.shopnow.model.User;
import com.shopnow.service.CartService;
import com.shopnow.service.ProductsService;
import com.shopnow.service.SignupService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SignupController {

    @Autowired
    private SignupService service;

    @Autowired
    private ProductsService productservice;

    @Autowired
    private CartService cartservice;

    // ---------------- Signup -----------------
    @GetMapping("/signup")
    public String sendForm() {
        return "SignupForm";
    }

    @PostMapping("/adduser")
    public String register(@ModelAttribute User sign, Model model) {
        service.addUser(sign);
        model.addAttribute("user", sign);
        return "UserLogin";
    }

    // ---------------- Login -----------------
    @GetMapping("/userlogin")
    public String userLoginForm() {
        return "UserLogin";
    }

    @PostMapping("/validate")
    public String UserDashboard(@ModelAttribute User user, HttpSession session, Model model) {
        User valid = service.validateUser(user.getNumber(), user.getPassword());

        if (valid != null) {
            session.setAttribute("username", valid.getName());
            List<Products> products = productservice.getAllProducts();
            model.addAttribute("products", products);
            return "UserDashboard";
        } else {
            model.addAttribute("error", "Invalid mobile number or password!");
            return "UserLogin";
        }
    }

    @GetMapping("/userdashboard")
    public String showUserDashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/userlogin";
        }

        List<Products> products = productservice.getAllProducts();
        model.addAttribute("products", products);

        return "UserDashboard";
    }

    // ---------------- Cart -----------------
    @GetMapping("/addtocart")
    public String showAddToCartForm(@RequestParam("productid") int productid, Model model) {
        Products product = productservice.getProductById(productid);
        if (product == null) {
            return "redirect:/userdashboard";
        }
        model.addAttribute("product", product);
        return "AddToCart";
    }

    @PostMapping("/addtocartaction")
    public String addToCart(@ModelAttribute CartItem cartItem, HttpSession session, Model model) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        cart.add(cartItem);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String cart(HttpSession session, Model model) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            model.addAttribute("cart", new ArrayList<CartItem>());
        } else {
            model.addAttribute("cart", cart);
        }
        return "Cart";
    }

    @GetMapping("/cartremove")
    public String removeFromCart(@RequestParam("productid") int productid, HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.getProductid() == productid);
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    // ---------------- Checkout -----------------
    @GetMapping("/checkout")
    public String checkoutPage(HttpSession session, Model model) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            model.addAttribute("error", "Your cart is empty!");
            return "Cart";
        }
        model.addAttribute("cart", cart);
        return "Checkout";
    }



    
    @PostMapping("/placeorder")
    public String placeOrder(@ModelAttribute OrderForm form, HttpSession session, Model model) {

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            model.addAttribute("error", "Your cart is empty!");
            return "OrderFail";   // go to failure JSP
        }

        // ✅ Here you would normally save order into DB
        boolean orderSaved = true; // simulate success/failure

        if (orderSaved) {
            session.removeAttribute("cart"); // clear cart after success
            model.addAttribute("message", "Order placed successfully! Thank you, " );
            return "OrderSuccess";
        } else {
            model.addAttribute("error", "Order failed! Please try again.");
            return "OrderFail";
        }
    }

    // ---------------- Logout -----------------
    @GetMapping("/userlogout")
    public String logout(HttpSession session) {
        session.invalidate(); // ✅ clear session
        return "UserLogin";
    }
}
