package com.shopnow.model;

public class CartItem {
    private int productid;
    private String productname;
    private double price;
    private int quantity;
    
    
    
	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CartItem(int productid, String productname, double price, int quantity) {
		super();
		this.productid = productid;
		this.productname = productname;
		this.price = price;
		this.quantity = quantity;
	}



	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "Cart [productid=" + productid + ", productname=" + productname + ", price=" + price + ", quantity="
				+ quantity + "]";
	}

 
}

