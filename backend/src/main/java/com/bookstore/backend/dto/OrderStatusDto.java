package com.bookstore.backend.dto;

import lombok.Data;

@Data
public class OrderStatusDto {
    private Long orderId;
    private String status;
}
