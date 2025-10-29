package com.bookstore.backend.dto;

import lombok.Data;

@Data
public class BookStockDto {
    private Integer bookId;
    private Integer stockQuantity;
}
