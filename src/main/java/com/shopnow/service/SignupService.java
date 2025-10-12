package com.shopnow.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.shopnow.model.User;

@Service
public class SignupService {
	
	@Autowired
	public JdbcTemplate jdbctemplate;
	
	public void addUser(User users) {
		
	String query = "insert into signup values(?,?,?,?)";
int i=	jdbctemplate.update(query,users.getName(), users.getEmail(), users.getNumber(), users.getPassword());

if(i !=0) {
	System.out.println(users.getName()+"inserted successfully");
}
else {
	System.out.println("insertion failed");
}
	
		
	}
	public List<User> getAllUsers(){
	
		String query = "select * from signup";
		List<User> user = jdbctemplate.query(query,new UserDetails());
		return user;
		
		
	}
public User validateUser(long number , String password) {
	String query = "select * from signup where number =? and password =?";
	List<User> users=jdbctemplate.query(query , new Object[]{number, password},new UserDetails());
	if (users.isEmpty()) {
        return null; // No user found
    }
    return users.get(0); 
	
}
	
}



class UserDetails implements RowMapper<User>{
	
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setName(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		u.setNumber(rs.getLong("number"));
		u.setPassword(rs.getString("password"));
		return u;
		
	}

	
}
