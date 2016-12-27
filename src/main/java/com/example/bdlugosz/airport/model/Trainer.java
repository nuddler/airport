package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by Maciej on 2016-12-13.
 */
@Entity
@Table(name = "trainer")
@Data
public class Trainer {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String firstName;
    private String lastName;
    private String address;
    private String address2;

}
