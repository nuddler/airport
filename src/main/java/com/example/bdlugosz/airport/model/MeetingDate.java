package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;
import java.time.DayOfWeek;

/**
 * Created by Maciej on 2016-12-13.
 */

@Entity
@Table(name = "metting_date")
@Data
public class MeetingDate {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private DayOfWeek dayOfWeek;
    private String startTime;
    private String endTime;

}
