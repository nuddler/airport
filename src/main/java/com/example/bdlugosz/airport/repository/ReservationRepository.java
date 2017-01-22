package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.Reservation;
import com.example.bdlugosz.airport.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    Reservation findReservationById(Long id);

    Reservation findReservationByName(String name);

}
