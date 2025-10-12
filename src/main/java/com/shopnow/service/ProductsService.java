package com.shopnow.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.shopnow.model.Products;

@Service
public class ProductsService {

	@Autowired
	public JdbcTemplate jdbctemp;

	@Autowired
	public NamedParameterJdbcTemplate namedtemp;


	public void addproduct(Products products) {
		String query = "insert into products values(?,?,?,?,?,?)";
		int i =jdbctemp.update(query,products.getProductid(),products.getProductimage(), products.getProductname(), products.getCategory(),products.getDiscountprice(),products.getPrice());
		if(i!=0) {
			System.out.println(products.getProductname()+" insertion sucessfully");
		}else {
			System.out.println("insertion is failed");
		}	



	}


	public void updateProduct(Products products) {

		String query = "update products set productimage =? , productname=?,category=?, price =?, discountprice =? where productid =?";
		int i =jdbctemp.update(query,products.getProductimage(), products.getProductname(), products.getCategory(),products.getDiscountprice(), products.getPrice(),products.getProductid());

		if(i!=0) {
			System.out.println(products.getProductname()+"updation sucessfully");
		}else {
			System.out.println("updation is failed");
		}	


	}

	public void deleteProduct(int productid) {

		String query = "delete from products where productid=?";
		int i = jdbctemp.update(query, productid);
		if ( i !=0) {
			System.out.println(productid+" deleted succesfully");
		}
		else {
			System.out.println("deletion is failed");
		}

	}

	public Products getProductById(int productid) {
	
		String query ="select * from products where productid =?";

 return jdbctemp.query(query, new ProductDetails(),productid).get(0);
	}
	
	

	public List<Products> getAllProducts(){
		String query ="select * from products";
//		List<Products> products=	jdbctemp.query(query, new ProductDetails());
//		for (Products p: products) {
//			System.out.println(
//					"productid"+ p.getProductid()+
//					"productimage"+p.getProductimage()+
//					"productname"+p.getProductname()+
//					"Category"+p.getCategory()+
//					"price"+p.getPrice()+
//					"status"+ p.getStatus()
//					);
//		}
			return jdbctemp.query(query, new ProductDetails());

		
	}


	class ProductDetails implements RowMapper<Products>{


		@Override
		public Products mapRow(ResultSet rs, int rowNum) throws SQLException {
			Products pro = new Products();
			pro.setProductid(rs.getInt("productid"));
			pro.setProductimage(rs.getString("productimage"));
			pro.setProductname(rs.getString("productname"));
			pro.setCategory(rs.getString("category"));
			pro.setDiscountprice(rs.getDouble("discountprice"));
			pro.setPrice(rs.getDouble("price"));

			return pro;
		}
	}
	}

