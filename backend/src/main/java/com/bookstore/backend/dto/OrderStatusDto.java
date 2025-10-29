package com.bookstore.backend.dto;

import lombok.Data;

@Data
public class OrderStatusDto {
    private Integer orderId;
    private String status;
}
