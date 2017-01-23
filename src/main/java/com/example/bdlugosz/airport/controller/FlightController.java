package com.example.bdlugosz.airport.controller;

import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.Flight;
import com.example.bdlugosz.airport.service.AirplaneService;
import com.example.bdlugosz.airport.service.FlightService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/flights")
@PreAuthorize("hasAuthority('ADMIN')")
public class FlightController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private AirplaneService airplaneService;

    //HOME
    @RequestMapping(value = "/managemnent", method = RequestMethod.GET)
    public String manageParticipants() {
        return "manageFlights";
    }

    //GET ALL
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String flightsList(ModelMap model) {
        List<Flight> flights = flightService.getAllFlights();
        model.addAttribute("flights", flights);
        return "flights";
    }

    //ADD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showForm(Model model) {
        List<Airplane> allAirplanes = airplaneService.getAllAirplanes();
        model.addAttribute("flight", new Flight());
        model.addAttribute("airplanes", allAirplanes);
        return "addFlight";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addFlight(@ModelAttribute("flight") Flight flight, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //flightValidator.validate(flight, bindingResult);
        if (bindingResult.hasErrors()) {
            return "addFlight";
        }
        flightService.createFlight(flight);

        log.info("Created flight: " + flight.toString());
        return "redirect:list";
    }


    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editFlight(@PathVariable("id") String id,Model model) {
        log.info("Edited flight with id: " + id);
        Flight flight = flightService.findFlightById(Long.valueOf(id));
        List<Airplane> allAirplanes = airplaneService.getAllAirplanes();
        model.addAttribute("airplanes", allAirplanes);
        model.addAttribute("flight", flight);
        return "editFlight";
    }

    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editFlight(@PathVariable("id") String id, @ModelAttribute("flight") Flight flight, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //flightValidator.validate(flight, bindingResult);
        if (bindingResult.hasErrors()) {
            return "editFlight";
        }
        flightService.edit(flight);
        log.info("Edited flight with id: " + id);
        return "redirect:/flights/list";
    }

    //REMOVE
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeFlight(@RequestParam("id") String id) {
        log.warn("Removed participant with id: " + id);
        flightService.removeFlight(Long.valueOf(id));
        return "redirect:/flights/list";
    }
//
//    //SEARCH
//    @RequestMapping(value = "/participant/find")
//    public String findParticipants(@RequestParam(value="parameter", required=false) String parameter,
//    		ModelMap model) {
//    	List<Participant> participants = null;
//    	if(parameter != null){
//    		participants = flightService.findParticipantByNameOrSurname(parameter, parameter);
//    	}
//    	model.addAttribute("participants", participants == null ? new ArrayList<Participant>() : participants);
//    	model.addAttribute("needsShowListButton", true);
//    	model.addAttribute("wasFinding",true);
//    	return "participants";
//    }
}
