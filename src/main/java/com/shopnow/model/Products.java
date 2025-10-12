package com.shopnow.model;

public class Products {
	
	private int productid;
	private String productimage;
	private String productname;
	private String category;
	private double  discountprice;
	private double price;
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Products(int productid, String productimage, String productname, String category, double price, double discountprice) {
		super();
		this.productid = productid;
		this.productimage = productimage;
		this.productname = productname;
		this.category = category;
		this.price = price;
		this.discountprice= discountprice;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public double getDiscountprice() {
		return discountprice;
	}
	public void setDiscountprice(double discountprice) {
		this.discountprice = discountprice;
	}

	
	@Override
	public String toString() {
		return "Products productid=" + productid + ", image=" + productimage + ", productname=" + productname + ", category="
				+ category + ",discountprice=" + discountprice+" price=" + price +  "";
	}
	
	
	

}
