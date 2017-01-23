package com.example.bdlugosz.airport.controller;

import com.example.bdlugosz.airport.ReCaptchaInvalidException;
import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.User;
import com.example.bdlugosz.airport.service.AirplaneService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/airplanes")
@PreAuthorize("hasAuthority('ADMIN')")
public class AirplaneController {

    @Autowired
    private AirplaneService airplaneService;

    //HOME
    @RequestMapping(value = "/managemnent", method = RequestMethod.GET)
    public String manageParticipants() {
        return "manageAirplanes";
    }

    //GET ALL
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String airplanesList(ModelMap model) {
        List<Airplane> airplanes = airplaneService.getAllAirplanes();
        model.addAttribute("airplanes", airplanes);
        return "airplanes";
    }

    //ADD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showForm(Model model) {
        model.addAttribute("airplane", new Airplane());
        return "addAirplane";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addAirplane(@ModelAttribute("airplane") Airplane airplane, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //airplaneValidator.validate(airplane, bindingResult);
        if (bindingResult.hasErrors()) {
            return "addAirplane";
        }
        airplaneService.createAirplane(airplane);

        log.info("Created airplane: " + airplane.toString());
        return "redirect:list";
    }


    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editAirplane(@PathVariable("id") String id) {
        log.info("Edited airplane with id: " + id);
        Airplane airplane = airplaneService.findAirplaneById(Long.valueOf(id));
        return new ModelAndView("editAirplane", "airplane", airplane);
    }

    //EDIT
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editAirplane(@PathVariable("id") String id, @ModelAttribute("airplane") Airplane airplane, BindingResult bindingResult, Model model, HttpServletRequest request) {
        //airplaneValidator.validate(airplane, bindingResult);
        if (bindingResult.hasErrors()) {
            return "editAirplane";
        }
        airplaneService.edit(airplane);
        log.info("Edited airplane with id: " + id);
        return "redirect:/airplanes/list";
    }

    //REMOVE
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeAirplane(@RequestParam("id") String id) {
        log.warn("Removed participant with id: " + id);
        airplaneService.removeAirplane(Long.valueOf(id));
        return "redirect:/airplanes/list";
    }
//
//    //SEARCH
//    @RequestMapping(value = "/participant/find")
//    public String findParticipants(@RequestParam(value="parameter", required=false) String parameter,
//    		ModelMap model) {
//    	List<Participant> participants = null;
//    	if(parameter != null){
//    		participants = airplaneService.findParticipantByNameOrSurname(parameter, parameter);
//    	}
//    	model.addAttribute("participants", participants == null ? new ArrayList<Participant>() : participants);
//    	model.addAttribute("needsShowListButton", true);
//    	model.addAttribute("wasFinding",true);
//    	return "participants";
//    }
}
