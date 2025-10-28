package com.bookstore.backend.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.backend.dao.OrderItemDao;
import com.bookstore.backend.dto.OrderItemDto;
import com.bookstore.backend.dto.OrderStatusDto;
import com.bookstore.backend.pojo.Order;
import com.bookstore.backend.pojo.OrderItem;
import com.bookstore.backend.service.OrderService;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderItemDao orderItemdao;

    @PreAuthorize("hasRole('CUSTOMER')")
    @PostMapping("/place")
    public ResponseEntity<Order> placeOrder(@RequestParam Long userId, @RequestBody List<OrderItemDto> items) {
        Order order = orderService.placeOrder(userId, items);
        return ResponseEntity.ok(order);
    }

    @PreAuthorize("hasRole('SELLER')")
    @PutMapping("/orderstatus")
    public ResponseEntity<String> updateOrderStatus(@RequestBody OrderStatusDto dto) {
        String result = orderService.updateOrderStatus(dto);
        return ResponseEntity.ok(result);
    }

    @PreAuthorize("hasRole('SELLER')")
    @GetMapping("/{orderId}/items")
    public ResponseEntity<List<OrderItem>> getOrderItems(@PathVariable Long orderId) {
        return ResponseEntity.ok(orderService.getOrderItems(orderId));
    }

    @GetMapping("/seller/{sellerId}")
    @PreAuthorize("hasRole('SELLER')")
    public ResponseEntity<List<Order>> getOrdersBySeller(@PathVariable Long sellerId) {
        List<Order> allOrders = orderService.getAllOrders();
        List<Order> sellerOrders = allOrders.stream()
                .filter(order -> orderItemdao.findByOrder(order).stream()
                .anyMatch(item -> item.getBook().getSeller().getId().equals(sellerId)))
                .collect(Collectors.toList());
        return ResponseEntity.ok(sellerOrders);
    }

}
