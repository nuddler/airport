package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Reservation;

import java.util.List;

public interface ReservationService {
    List<Reservation> getAllReservations();

    Reservation findReservationByName(String name);

    Reservation findReservationById(Long id);

    void removeReservation(Long id);

    void createReservation(Reservation p);

    void edit(Reservation reservation);
}