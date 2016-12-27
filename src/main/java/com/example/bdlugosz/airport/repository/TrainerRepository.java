package com.example.bdlugosz.airport.repository;

import com.example.bdlugosz.airport.model.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 * Created by Maciej on 2016-12-16.
 */
@Component
public interface TrainerRepository extends JpaRepository<Trainer, Long> {

}
