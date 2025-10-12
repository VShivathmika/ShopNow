package com.shopnow.model;

public class OrderForm {
	
    private String fullname;
    private String address;
    private String mobile;
    private String email;
    private String payment;
	public OrderForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderForm(String fullname, String address, String mobile, String email, String payment) {
		super();
		this.fullname = fullname;
		this.address = address;
		this.mobile = mobile;
		this.email = email;
		this.payment = payment;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "OrderForm [fullname=" + fullname + ", address=" + address + ", mobile=" + mobile + ", email=" + email
				+ ", payment=" + payment + "]";
	}


}
