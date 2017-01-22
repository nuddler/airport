package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.Flight;

import java.util.List;

public interface FlightService {
	List<Flight> getAllFlights();
	Flight findFlightByName(String name);
	Flight findFlightById(Long id);
	void removeFlight(Long id);
	void createFlight(Flight p);
	void edit(Flight flight);
}