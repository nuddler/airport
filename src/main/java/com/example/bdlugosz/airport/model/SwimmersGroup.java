package com.example.bdlugosz.airport.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Maciej on 2016-12-13.
 */

@Entity
@Table(name = "swimmers_group")
@Data
public class SwimmersGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String groupName;
    private Experience groupExperience;
    @ManyToOne
    private Trainer trainer;
    @OneToMany
    private List<Participant> swimmersList;
    @OneToMany
    private List<MeetingDate> meetingDates;

}

enum Experience {
    AMATURE, EXPERIENCED, PROFFESIONAL;
}