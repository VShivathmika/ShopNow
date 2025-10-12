package com.shopnow.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.shopnow.model.Order;

@Service
public class OrderService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all orders
    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM orders ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapRowToOrder(rs));
    }

    // Get orders by status
    public List<Order> getOrdersByStatus(String status) {
        String sql = "SELECT * FROM orders WHERE status = ? ORDER BY created_at DESC";
        return jdbcTemplate.query(sql, new Object[]{status}, (rs, rowNum) -> mapRowToOrder(rs));
    }

    // Map ResultSet row to Order object
    private Order mapRowToOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setFullname(rs.getString("fullname"));
        order.setAddress(rs.getString("address"));
        order.setMobile(rs.getString("mobile"));
        order.setEmail(rs.getString("email"));
        order.setPayment(rs.getString("payment"));
        order.setTotalAmount(rs.getDouble("total_amount"));
        order.setStatus(rs.getString("status"));
        order.setCreatedAt(rs.getTimestamp("created_at"));
        return order;
    }
}
