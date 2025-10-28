package com.bookstore.backend.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.backend.pojo.Book;
import com.bookstore.backend.pojo.User;

@Repository
public interface BookDao extends JpaRepository<Book, Long> {
    List<Book> findByCategory(String category);
    List<Book> findBySeller(User seller);
}
