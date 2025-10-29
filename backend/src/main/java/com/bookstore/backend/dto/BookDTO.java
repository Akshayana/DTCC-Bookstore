package com.bookstore.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookDTO {
    private Integer id;
    private String title;
    private String author;
    private BigDecimal price;
    private String category;
    private Integer stockQuantity;
    private String imageUrl;
    private Integer sellerId;
}
