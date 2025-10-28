package com.bookstore.backend.service;

import com.bookstore.backend.dao.UserDao;
import com.bookstore.backend.dao.RoleDao;
import com.bookstore.backend.dto.JwtResponse;
import com.bookstore.backend.dto.LoginRequest;
import com.bookstore.backend.dto.RegisterRequest;
import com.bookstore.backend.pojo.Role;
import com.bookstore.backend.pojo.User;
import com.bookstore.backend.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserDao userDao;
    private final RoleDao roleDao;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final AuthenticationManager authenticationManager;

    public User registerUser(RegisterRequest request) {

        userDao.findByUsername(request.getUsername()).ifPresent(u -> {
            throw new RuntimeException("Username already in use!");
        });

        userDao.findByEmail(request.getEmail()).ifPresent(u -> {
            throw new RuntimeException("Email already in use!");
        });

        Role role = roleDao.findByName(request.getRole().toUpperCase())
                .orElseThrow(() -> new RuntimeException("Invalid role!"));

        User user = new User();
        user.setUsername(request.getUsername());
        user.setEmail(request.getEmail());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(role);

        return userDao.save(user);
    }

    public JwtResponse loginUser(LoginRequest request) {

        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );

        User user = userDao.findByUsername(request.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found!"));

        String token = jwtUtil.generateToken(user.getUsername(), user.getRole().getName());

        return new JwtResponse(token, user.getUsername(), user.getRole().getName());
    }
}
