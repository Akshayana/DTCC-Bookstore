package com.bookstore.backend.service;

import com.bookstore.backend.dao.BookDao;
import com.bookstore.backend.dao.UserDao;
import com.bookstore.backend.dto.BookDTO;
import com.bookstore.backend.pojo.Book;
import com.bookstore.backend.pojo.User;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import com.bookstore.backend.dto.BookStockDto;

@Service
@RequiredArgsConstructor
public class BookService {

    @Autowired
    private final BookDao bookRepository;
    private final UserDao userRepository;

    private BookDTO convertToDTO(Book book) {
        return new BookDTO(
                book.getId(),
                book.getTitle(),
                book.getAuthor(),
                book.getPrice() != null ? java.math.BigDecimal.valueOf(book.getPrice()) : null,
                book.getCategory(),
                book.getStockQuantity(),
                book.getImageUrl(),
                book.getSeller() != null ? book.getSeller().getId() : null
        );
    }

    private Book convertToEntity(BookDTO dto) {
        Book book = new Book();
        book.setId(dto.getId());
        book.setTitle(dto.getTitle());
        book.setAuthor(dto.getAuthor());
        book.setCategory(dto.getCategory());
        book.setStockQuantity(dto.getStockQuantity());
        book.setImageUrl(dto.getImageUrl());
        book.setPrice(dto.getPrice() != null ? dto.getPrice().doubleValue() : null);

        if (dto.getSellerId() != null) {
            User seller = userRepository.findById(dto.getSellerId())
                    .orElseThrow(() -> new RuntimeException("Seller not found!"));
            book.setSeller(seller);
        }

        return book;
    }

    public List<BookDTO> getAllBooks() {
        return bookRepository.findAll()
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<BookDTO> getBooksByCategory(String category) {
        return bookRepository.findByCategory(category)
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<BookDTO> getBooksBySeller(Long sellerId) {
        User seller = userRepository.findById(sellerId)
                .orElseThrow(() -> new RuntimeException("Seller not found!"));
        return bookRepository.findBySeller(seller)
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public BookDTO addBook(BookDTO dto) {
        Book book = convertToEntity(dto);
        Book savedBook = bookRepository.save(book);
        return convertToDTO(savedBook);
    }

    public BookDTO updateBook(Long id, BookDTO dto) {
        Book existingBook = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found!"));

        existingBook.setTitle(dto.getTitle());
        existingBook.setAuthor(dto.getAuthor());
        existingBook.setCategory(dto.getCategory());
        existingBook.setImageUrl(dto.getImageUrl());
        existingBook.setPrice(dto.getPrice() != null ? dto.getPrice().doubleValue() : null);

        if (dto.getSellerId() != null) {
            User seller = userRepository.findById(dto.getSellerId())
                    .orElseThrow(() -> new RuntimeException("Seller not found!"));
            existingBook.setSeller(seller);
        }

        Book updated = bookRepository.save(existingBook);
        return convertToDTO(updated);
    }

    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }

    @Transactional
    public String updateBookStock(BookStockDto dto) {
        Book book = bookRepository.findById(dto.getBookId())
                .orElseThrow(() -> new RuntimeException("Book not found with ID: " + dto.getBookId()));

        if (dto.getStockQuantity() < 0) {
            throw new RuntimeException("Stock quantity cannot be negative!");
        }

        book.setStockQuantity(dto.getStockQuantity());
        bookRepository.save(book);

        if (dto.getStockQuantity() == 0) {
            return "Book '" + book.getTitle() + "' marked as currently unavailable (stock = 0)";
        } else {
            return "Book '" + book.getTitle() + "' stock updated to " + dto.getStockQuantity();
        }
    }

    
}
