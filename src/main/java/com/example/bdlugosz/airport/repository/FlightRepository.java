package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.Flight;
import com.example.bdlugosz.airport.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightRepository extends JpaRepository<Flight, Long> {
    Flight findFlightById(Long id);

    Flight findFlightByName(String name);

}
