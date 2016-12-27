package com.example.bdlugosz.airport.model;

import javax.persistence.*;

import lombok.Data;

@Entity
@Table
@Data
public class Participant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, updatable = false)
    private Long id;
    @OneToOne
    private PayForm payForm;
    
    @Column
    private String name;
    
    @Column
    private String surname;

    @Column(name = "email", nullable = false, unique = true)
    private String email;
    
    @Column
    private String pesel;

    @Column
    private String phone;

	
}
