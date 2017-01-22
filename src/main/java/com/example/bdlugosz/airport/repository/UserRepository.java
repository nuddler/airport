package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByToken(String token);

    User findByUsernameAndActivated(String username,boolean activated);
}
