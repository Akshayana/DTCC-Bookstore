package com.bookstore.backend.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

import com.bookstore.backend.pojo.User;

@Repository
public interface UserDao extends JpaRepository<User, Long> {
    List<User> findByRole_Name(String roleName);
    Optional<User> findByEmail(String email);
    Optional<User> findByUsername(String username);
    boolean existsByEmail(String email);
}
