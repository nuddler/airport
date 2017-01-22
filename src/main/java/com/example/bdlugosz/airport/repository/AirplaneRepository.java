package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AirplaneRepository extends JpaRepository<Airplane, Long> {
    Airplane findAirplaneById(Long id);

    Airplane findAirplaneByName(String name);
}
