package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Maciej on 2016-12-13.
 */
@Entity
@Table(name = "pay_form")
@Data
public class PayForm {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    //pierwszy okres rozliczeniowy
    private Date expDate;
    //płatnośc co ile dni
    private int payPeriod;
    private double amount;

}
