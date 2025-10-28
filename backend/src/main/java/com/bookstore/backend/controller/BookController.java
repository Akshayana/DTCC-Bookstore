package com.bookstore.backend.controller;

import com.bookstore.backend.dao.BookDao;
import com.bookstore.backend.dao.UserDao;
import com.bookstore.backend.dto.BookDTO;
import com.bookstore.backend.service.BookService;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import com.bookstore.backend.dto.BookStockDto;
import com.bookstore.backend.pojo.Book;
import java.util.Objects;

@RestController
@RequestMapping("/api/books")
@RequiredArgsConstructor
public class BookController {

    private final BookService bookService;
    private final BookDao bookDao;
    private final UserDao userDao;

    @PreAuthorize("hasAnyRole('ADMIN','CUSTOMER')")
    @GetMapping
    public ResponseEntity<List<BookDTO>> getAllBooks() {
        return ResponseEntity.ok(bookService.getAllBooks());
    }

    @PreAuthorize("hasAnyRole('ADMIN','CUSTOMER')")
    @GetMapping("/category/{category}")
    public ResponseEntity<List<BookDTO>> getBooksByCategory(@PathVariable String category) {
        return ResponseEntity.ok(bookService.getBooksByCategory(category));
    }

    @PreAuthorize("hasAnyRole('SELLER','CUSTOMER')")
    @GetMapping("/seller/{sellerId}")
    public ResponseEntity<List<BookDTO>> getBooksBySeller(@PathVariable Long sellerId) {
        return ResponseEntity.ok(bookService.getBooksBySeller(sellerId));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping
    public ResponseEntity<BookDTO> addBook(@RequestBody BookDTO bookDTO) {
        return ResponseEntity.ok(bookService.addBook(bookDTO));
    }

    @PreAuthorize("hasRole('SELLER')")
    @PutMapping("/{id}")
    public ResponseEntity<BookDTO> updateBook(@PathVariable Long id, @RequestBody BookDTO bookDTO) {
        return ResponseEntity.ok(bookService.updateBook(id, bookDTO));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteBook(@PathVariable Long id) {
        bookService.deleteBook(id);
        return ResponseEntity.ok("Book deleted successfully!");
    }

    @PreAuthorize("hasRole('SELLER')")
    @PutMapping("/bookstock")
    public ResponseEntity<String> updateBookStock(@RequestBody BookStockDto dto) {
        String result = bookService.updateBookStock(dto);
        return ResponseEntity.ok(result);
    }

    @PreAuthorize("hasAnyRole('ADMIN','SELLER','CUSTOMER')")
    @GetMapping("/categories")
    public List<String> getCategories() {
        return bookDao.findAll()
                .stream()
                .map(Book::getCategory)
                .filter(Objects::nonNull)
                .distinct()
                .toList();
    }

    public record SellerDTO(Long id, String username) {}

    @PreAuthorize("hasAnyRole('ADMIN','CUSTOMER')")
    @GetMapping("/sellers")
    public List<SellerDTO> getSellers() {
        return userDao.findByRole_Name("SELLER")
                .stream()
                .map(u -> new SellerDTO(u.getId(), u.getUsername()))
                .toList();
    }

}
