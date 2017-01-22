package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    @OneToOne
    private Airplane airplane;

    @OneToMany
    private List<Reservation> reservationList;
}
