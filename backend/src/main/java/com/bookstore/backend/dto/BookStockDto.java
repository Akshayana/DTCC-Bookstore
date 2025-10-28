package com.bookstore.backend.dto;

import lombok.Data;

@Data
public class BookStockDto {
    private Long bookId;
    private Integer stockQuantity;
}
