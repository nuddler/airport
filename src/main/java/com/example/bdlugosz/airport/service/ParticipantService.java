package com.example.bdlugosz.airport.service;

import java.util.List;

import com.example.bdlugosz.airport.model.Participant;

public interface ParticipantService {
	List<Participant> getAllUsers();
	Participant findParticipantByName(String name);
	Participant findParticipantBySurname(String name);
	Participant findParticipantById(Long id);
	List<Participant> findParticipantByNameOrSurname(String name, String surname);
	void removeParticipant(Long id);
	void createParticipant(Participant p);
}