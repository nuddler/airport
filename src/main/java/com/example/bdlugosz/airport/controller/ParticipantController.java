package com.example.bdlugosz.airport.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.bdlugosz.airport.model.Participant;
import com.example.bdlugosz.airport.service.ParticipantService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ParticipantController {
	
	@Autowired
	private ParticipantService participantService;
	
	//HOME
    @RequestMapping(value = "/participant/managemnent", method = RequestMethod.GET)
    public String manageParticipants() {
        return "manageParticipants";
    }
    
    //GET ALL
    @RequestMapping(value = "/participant/list", method = RequestMethod.GET)
    public String participantList(ModelMap model){
		List<Participant> participants = participantService.getAllUsers();
		model.addAttribute("participants",participants);
    	return "participants";
    }
    
    //ADD
    @RequestMapping(value = "/participant/add", method = RequestMethod.GET)
    public ModelAndView showForm() {
        return new ModelAndView("addParticipant", "participant", new Participant());
    }
    
    @RequestMapping(value = "/participant/add", method = RequestMethod.POST)
    public String addParticipant(ModelMap model,
    		@ModelAttribute("participant") Participant participant){
    	participantService.createParticipant(participant);
    	log.warn("Created participant: "+participant.toString());
    	return "redirect:list";
    }
    
    //EDIT
    @RequestMapping(value = "/participant/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editParticipant(@PathVariable("id") String id) {
    	log.info("Edited participant with id: "+id);
    	Participant participant = participantService.findParticipantById(Long.valueOf(id));
    	log.info("New participant values: "+participant.toString());
        return new ModelAndView("addParticipant", "participant", participant);
    }
    
    //REMOVE
    @RequestMapping(value = "/participant/remove", method = RequestMethod.POST)
    public String removeParticipant(@RequestParam("id") String id) {
    	log.warn("Removed participant with id: "+id);
    	participantService.removeParticipant(Long.valueOf(id));
    	return "redirect:list";
    }
    
    //SEARCH
    @RequestMapping(value = "/participant/find")
    public String findParticipants(@RequestParam(value="parameter", required=false) String parameter,
    		ModelMap model) {
    	List<Participant> participants = null;
    	if(parameter != null){
    		participants = participantService.findParticipantByNameOrSurname(parameter, parameter);
    	}
    	model.addAttribute("participants", participants == null ? new ArrayList<Participant>() : participants);
    	model.addAttribute("needsShowListButton", true);
    	model.addAttribute("wasFinding",true);
    	return "participants";
    }
}
