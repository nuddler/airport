package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.Flight;
import com.example.bdlugosz.airport.repository.AirplaneRepository;
import com.example.bdlugosz.airport.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightRepository flightRepository;

    @Override
    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    @Override
    public Flight findFlightByName(String name) {
        return flightRepository.findFlightByName(name);
    }

    @Override
    public Flight findFlightById(Long id) {
        return flightRepository.findFlightById(id);
    }

    @Override
    public void removeFlight(Long id) {
        flightRepository.delete(id);
    }

    @Override
    public void createFlight(Flight p) {
        flightRepository.save(p);
    }

    @Override
    public void edit(Flight flight) {
        flightRepository.save(flight);
    }
}