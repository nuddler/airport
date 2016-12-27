package com.example.bdlugosz.airport.service;


import com.example.bdlugosz.airport.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
