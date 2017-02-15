package com.example.bdlugosz.airport.service;


import com.example.bdlugosz.airport.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    void update(User user);

    User findByUsername(String username);

    User findByToken(String token);

    List<User> getAllUsers();
}
