package com.shopnow.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.shopnow.model.CartItem;

@Service
public class CartService {

    private List<CartItem> cart = new ArrayList<>();

    // Add product to cart
    public void addToCart(CartItem item) {
        // Check if product already exists, then increase quantity
        boolean found = false;
        for (CartItem ci : cart) {
            if (ci.getProductid() == item.getProductid()) {
                ci.setQuantity(ci.getQuantity() + item.getQuantity());
                found = true;
                break;
            }
        }
        if (!found) {
            cart.add(item);
        }
    }

    // Get all cart items
    public List<CartItem> getCartItems() {
        return cart;
    }

    // Remove item from cart by product id
    public void removeFromCart(int productid) {
        cart.removeIf(item -> item.getProductid() == productid);
    }

    // Update quantity for a product
    public void updateQuantity(int productid, int quantity) {
        for (CartItem item : cart) {
            if (item.getProductid() == productid) {
                item.setQuantity(quantity);
                break;
            }
        }
    }

    // Clear the cart
    public void clearCart() {
        cart.clear();
    }

    // Calculate total
    public double calculateTotal() {
        double total = 0;
        for (CartItem item : cart) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
}
