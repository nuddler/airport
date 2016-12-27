package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
