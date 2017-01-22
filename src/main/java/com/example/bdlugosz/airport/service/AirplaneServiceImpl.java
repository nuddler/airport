package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.repository.AirplaneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AirplaneServiceImpl implements AirplaneService {

	@Autowired
	private AirplaneRepository airplaneRepository;
	
	@Override
	public List<Airplane> getAllAirplanes() {
		return airplaneRepository.findAll();
	}

	@Override
	public Airplane findAirplaneByName(String name) {
		return airplaneRepository.findAirplaneByName(name);
	}

	@Override
	public Airplane findAirplaneById(Long id) {
		return airplaneRepository.findAirplaneById(id);
	}

	@Override
	public void removeAirplane(Long id) {
		airplaneRepository.delete(id);
	}

	@Override
	public void createAirplane(Airplane p) {
		airplaneRepository.save(p);
	}

	@Override
	public void edit(Airplane airplane) {
		airplaneRepository.save(airplane);
	}
}