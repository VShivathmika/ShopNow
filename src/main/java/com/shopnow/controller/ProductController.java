package com.shopnow.controller;

import java.net.http.HttpResponse.ResponseInfo;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopnow.model.Products;
import com.shopnow.model.User;
import com.shopnow.service.ProductsService;
import com.shopnow.service.SignupService;

@Controller
public class ProductController {

	@Autowired
	public SignupService userservice;
	@Autowired
	public ProductsService service;





	//	1.show the PRODUCTSFORM to the add the product  


	@GetMapping("/productsform")
	public String sendForm() {
		return  "ProductForm";	
	}

	//	2. after getting the form  add the product

	@PostMapping("/addproduct")
	public String addproduct(@ModelAttribute Products items, Model model) {
	    service.addproduct(items);

	    // Redirect to admin dashboard (GET)
	    return "redirect:/admindashboard";
	}


	@GetMapping("/admindashboard")
	public String adminDashboard(Model model) {
	    List<Products> products = service.getAllProducts();
	    model.addAttribute("products", products);

	    List<User> users = userservice.getAllUsers();
	    model.addAttribute("user", users);

	    return "AdminDashboard";
	}


	//	3.when click the edit it gives the EditProductForm

	@GetMapping("/editproduct")
	public String editproduct(@RequestParam("productid")int productid, Model model) {

		Products product = service.getProductById(productid);
		model.addAttribute("product", product);
		return "EditProductForm";
	}

	//4 .After Getting the EditProductForm it Update the EditedDetails

	@PostMapping("/updateproduct")
	public String updateproduct(@ModelAttribute Products pro, Model model) {
		service.updateProduct(pro);
		List<Products> products = service.getAllProducts();
		model.addAttribute("products", products);
		return "AdminDashboard";
	}



	// 5.	when click the Delete it goes to the delete


	@GetMapping("/deleteproduct")
	public String deleteEmployee(@RequestParam("productid") int productid ,Model model ) {
		service.deleteProduct(productid);
		List<Products> products = service.getAllProducts();
		model.addAttribute("products", products);
		return "AdminDashboard";		
	}

	//	6.search the Product by using the id
	@GetMapping("/productbyid")
	public String getProduct(@RequestParam("productid") int productid ,Model model) {
		Products product=	service.getProductById(productid);
		model.addAttribute("product", product);
		return "SearchProduct";		
	}




	//	8. get all products info

	@GetMapping("getallproducts")
	public void getAllproducts(Model model) {

		List<Products> products = service.getAllProducts();
		model.addAttribute("products", products);

	}




}
