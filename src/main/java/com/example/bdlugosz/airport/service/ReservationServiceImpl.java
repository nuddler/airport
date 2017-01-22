package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.Reservation;
import com.example.bdlugosz.airport.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;
	
	@Override
	public List<Reservation> getAllReservations() {
		return reservationRepository.findAll();
	}

	@Override
	public Reservation findReservationByName(String name) {
		return reservationRepository.findReservationByName(name);
	}

	@Override
	public Reservation findReservationById(Long id) {
		return reservationRepository.findReservationById(id);
	}

	@Override
	public void removeReservation(Long id) {
		reservationRepository.delete(id);
	}

	@Override
	public void createReservation(Reservation p) {
		reservationRepository.save(p);
	}

	@Override
	public void edit(Reservation reservation) {
		reservationRepository.save(reservation);
	}
}