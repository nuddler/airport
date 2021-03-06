package com.example.bdlugosz.airport.controller;

import com.example.bdlugosz.airport.model.Flight;
import com.example.bdlugosz.airport.model.Reservation;
import com.example.bdlugosz.airport.model.User;
import com.example.bdlugosz.airport.service.FlightService;
import com.example.bdlugosz.airport.service.ReservationService;
import com.example.bdlugosz.airport.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UserService userService;

    @Autowired
    private FlightService flightService;

    //HOME
    @RequestMapping(value = "/managemnent", method = RequestMethod.GET)
    public String manageParticipants() {
        return "manageReservations";
    }

    //GET ALL
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String reservationsList(ModelMap model) {
        List<Reservation> reservations = reservationService.getAllReservations();
        model.addAttribute("reservations", reservations);
        return "reservations";
    }

    //ADD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showForm(Model model) {
        List<Flight> allFlights = flightService.getAllFlights();
        model.addAttribute("reservation", new Reservation());
        model.addAttribute("flights", allFlights);
        return "addReservation";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addReservation(@ModelAttribute("reservation") Reservation reservation, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //reservationValidator.validate(reservation, bindingResult);
        if (bindingResult.hasErrors()) {
            return "addReservation";
        }
        String username = ((org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.findByUsername(username);
        reservation.setUser(user);
        user.getReservationList().add(reservation);
        reservationService.createReservation(reservation);
        userService.update(user);

        log.info("Created reservation: " + reservation.toString());
        return "redirect:list";
    }


    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editReservation(@PathVariable("id") String id, Model model) {
        Reservation reservation = reservationService.findReservationById(Long.valueOf(id));
        List<Flight> allFlights = flightService.getAllFlights();
        model.addAttribute("reservation", reservation);
        model.addAttribute("flights", allFlights);
        return "editReservation";
    }

    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editReservation(@PathVariable("id") String id, @ModelAttribute("reservation") Reservation reservation, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //reservationValidator.validate(reservation, bindingResult);
        if (bindingResult.hasErrors()) {
            return "editReservation";
        }
        reservationService.edit(reservation);
        log.info("Edited reservation with id: " + id);
        return "redirect:/reservations/list";
    }

    //REMOVE
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeReservation(@RequestParam("id") String id) {
        log.warn("Removed participant with id: " + id);
        reservationService.removeReservation(Long.valueOf(id));
        return "redirect:/reservations/list";
    }
}
