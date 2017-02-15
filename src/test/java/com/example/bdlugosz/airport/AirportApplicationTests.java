package com.example.bdlugosz.airport;

import com.example.bdlugosz.airport.model.User;
import com.example.bdlugosz.airport.repository.UserRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AirportApplicationTests {

    @Autowired
    private UserRepository repository;


    @Test
    public void admin() throws Exception {
        User userFound = this.repository.findByUsername("admin");

        Assert.assertEquals("admin",userFound.getUsername());
    }

    @Test
    public void equlas() throws Exception {
        User user = new User();
        user.setActivated(true);
        user.setUsername("Janush");

        //this.entityManager.persist(user);

        this.repository.save(user);
        User userFound = this.repository.findByUsername("Janush");

        Assert.assertEquals("Janush",userFound.getUsername());
    }

    @Test
    public void diff() throws Exception {
        User user = new User();
        user.setActivated(true);
        user.setUsername("Janush1");

        //this.entityManager.persist(user);

        this.repository.save(user);
        User userFound = this.repository.findByUsername("Janush1");

        Assert.assertNotEquals("sdsds",userFound.getUsername());
    }
}

