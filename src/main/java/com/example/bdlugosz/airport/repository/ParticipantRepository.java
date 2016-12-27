package com.example.bdlugosz.airport.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.example.bdlugosz.airport.model.*;

@Component
public interface ParticipantRepository extends JpaRepository<Participant, Long> {
	Participant findOneByName(String name);
	Participant findOneBySurname(String name);
	List<Participant> findOneByNameContainingIgnoreCaseOrSurnameContainingIgnoreCase(String name, String surname);
}