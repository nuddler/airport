package com.example.bdlugosz.airport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bdlugosz.airport.model.Participant;
import com.example.bdlugosz.airport.repository.ParticipantRepository;

@Service
public class ParticipantServiceImpl implements ParticipantService {

	@Autowired
	private ParticipantRepository participantRepository;
	
	@Override
	public List<Participant> getAllUsers() {
		return participantRepository.findAll();
	}

	@Override
	public Participant findParticipantByName(String name) {
		return participantRepository.findOneByName(name);
	}

	@Override
	public Participant findParticipantBySurname(String surname) {
		return findParticipantBySurname(surname);
	}

	@Override
	public void createParticipant(Participant p) {
		participantRepository.save(p);
	}

	@Override
	public Participant findParticipantById(Long id) {
		return participantRepository.findOne(id);
	}

	@Override
	public void removeParticipant(Long id) {
		participantRepository.delete(id);
	}

	@Override
	public List<Participant> findParticipantByNameOrSurname(String name, String surname) {
		return participantRepository.findOneByNameContainingIgnoreCaseOrSurnameContainingIgnoreCase(name, surname);
	}

}