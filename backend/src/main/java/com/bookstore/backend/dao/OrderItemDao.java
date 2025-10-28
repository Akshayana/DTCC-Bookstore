package com.bookstore.backend.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.backend.pojo.Order;
import com.bookstore.backend.pojo.OrderItem;

import java.util.List;

@Repository
public interface OrderItemDao extends JpaRepository<OrderItem, Long> {
    List<OrderItem> findByOrder(Order order);
}
