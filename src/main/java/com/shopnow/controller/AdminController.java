package com.shopnow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopnow.model.Products;
import com.shopnow.model.User;
import com.shopnow.service.ProductsService;
import com.shopnow.service.SignupService;

import jakarta.annotation.PostConstruct;

@Controller
public class AdminController {

	@Autowired
	public ProductsService service;
@Autowired 
public SignupService userservice;


	@GetMapping("/adminlogin")
	public String loginForm() {
		return "AdminForm";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String username,@RequestParam("password") String password, Model model ) {
		if (username.equals("7893559356") && password.equals("shivi@22")) {
			List<Products> products = service.getAllProducts();
			List<User> users = userservice.getAllUsers();
			model.addAttribute("products", products);
			model.addAttribute("user", users);
			return "AdminDashboard";

		}
		else {
			return "AdminForm";
		}
	}
	@GetMapping("/logout")
	public String logout() {
		return "AdminForm";
	}

}


