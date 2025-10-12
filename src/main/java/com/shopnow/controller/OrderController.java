package com.shopnow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopnow.model.Order;
import com.shopnow.service.OrderService;

public class OrderController {

    @Autowired
    private OrderService orderService;

    // Show all orders
    @GetMapping("/orders")
    public String allOrders(@RequestParam(value = "status", required = false) String status, Model model) {
        List<Order> orders;
        if (status == null || status.equalsIgnoreCase("ALL")) {
            orders = orderService.getAllOrders();
        } else {
            orders = orderService.getOrdersByStatus(status);
        }
        model.addAttribute("orders", orders);
        model.addAttribute("selectedStatus", status == null ? "ALL" : status);
        return "Orders";  // JSP page
    }
   

}
