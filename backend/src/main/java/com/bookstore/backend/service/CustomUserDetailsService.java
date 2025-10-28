package com.bookstore.backend.service;

import com.bookstore.backend.dao.UserDao;
import com.bookstore.backend.pojo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userDao.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));

        SimpleGrantedAuthority authority =
                new SimpleGrantedAuthority("ROLE_" + user.getRole().getName().toUpperCase());

        return new org.springframework.security.core.userdetails.User(
                user.getUsername(), 
                user.getPassword(),
                Collections.singleton(authority)
        );
    }
}
