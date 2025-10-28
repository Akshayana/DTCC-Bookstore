package com.bookstore.backend.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.backend.dao.BookDao;
import com.bookstore.backend.dao.OrderDao;
import com.bookstore.backend.dao.OrderItemDao;
import com.bookstore.backend.dao.UserDao;
import com.bookstore.backend.dto.OrderItemDto;
import com.bookstore.backend.dto.OrderStatusDto;
import com.bookstore.backend.pojo.Book;
import com.bookstore.backend.pojo.Order;
import com.bookstore.backend.pojo.OrderItem;
import com.bookstore.backend.pojo.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {

    @Autowired
    private final OrderDao orderRepository;
    private final OrderItemDao orderItemRepository;
    private final BookDao bookRepository;
    private final UserDao userRepository;

    @Transactional
    public Order placeOrder(Long userId, List<OrderItemDto> itemDTOs) {

        User customer = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        if (itemDTOs == null || itemDTOs.isEmpty()) {
            throw new RuntimeException("Order must contain at least one item!");
        }

        double totalAmount = 0.0;

        for (OrderItemDto dto : itemDTOs) {
            Book book = bookRepository.findById(dto.getBookId())
                    .orElseThrow(() -> new RuntimeException("Book not found: " + dto.getBookId()));

            if (book.getStockQuantity() < dto.getQuantity()) {
                throw new RuntimeException("Insufficient stock for: " + book.getTitle());
            }
        }

        Order order = new Order();
        order.setCustomer(customer);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("PENDING");
        orderRepository.save(order);

        for (OrderItemDto dto : itemDTOs) {

            Book book = bookRepository.findById(dto.getBookId()).get();

            double priceAtPurchase = book.getPrice();
            totalAmount += priceAtPurchase * dto.getQuantity();

            book.setStockQuantity(book.getStockQuantity() - dto.getQuantity());
            bookRepository.save(book);

            OrderItem item = new OrderItem();
            item.setOrder(order);
            item.setBook(book);
            item.setQuantity(dto.getQuantity());
            item.setPrice_at_purchase(priceAtPurchase);
            orderItemRepository.save(item);
        }

        order.setTotal_Amount(totalAmount);
        orderRepository.save(order);

        return order;
    }

    @Transactional
    public String updateOrderStatus(OrderStatusDto dto) {
        Order order = orderRepository.findById(dto.getOrderId())
                .orElseThrow(() -> new RuntimeException("Order not found with ID: " + dto.getOrderId()));

        String newStatus = dto.getStatus().toUpperCase();

        if (!newStatus.equals("PENDING") && !newStatus.equals("COMPLETED")) {
            throw new RuntimeException("Invalid status! Must be PENDING or COMPLETED.");
        }

        order.setStatus(newStatus);
        orderRepository.save(order);
        return "Order ID " + order.getId() + " status updated to " + newStatus;
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public List<OrderItem> getOrderItems(Long orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found!"));
        return orderItemRepository.findByOrder(order);
    }
}
