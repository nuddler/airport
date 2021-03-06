package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    @ManyToOne
    private Flight flight;

    @ManyToOne
    private User user;

    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", flight=" + flight +
                ", userID=" + (user != null ? user.getId() : user) +
                '}';
    }
}
