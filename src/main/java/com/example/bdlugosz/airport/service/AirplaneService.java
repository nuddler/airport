package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Airplane;

import java.util.List;

public interface AirplaneService {
    List<Airplane> getAllAirplanes();

    Airplane findAirplaneByName(String name);

    Airplane findAirplaneById(Long id);

    void removeAirplane(Long id);

    void createAirplane(Airplane p);

    void edit(Airplane airplane);
}