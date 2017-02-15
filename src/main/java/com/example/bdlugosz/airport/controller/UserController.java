package com.example.bdlugosz.airport.controller;

import com.example.bdlugosz.airport.config.CaptchaSettings;
import com.example.bdlugosz.airport.ReCaptchaInvalidException;
import com.example.bdlugosz.airport.model.Airplane;
import com.example.bdlugosz.airport.model.User;
import com.example.bdlugosz.airport.service.*;
import com.example.bdlugosz.airport.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private CaptchaSettings captchaSettings;

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private ConfirmationAccountService confirmationAccountService;

    @Autowired
    private ReportService reportService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        model.addAttribute("site", captchaSettings.getSite());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model,HttpServletRequest request) {
        userValidator.validate(userForm, bindingResult);

        String response = request.getParameter("g-recaptcha-response");
        try {
            captchaService.processResponse(response);
        } catch (ReCaptchaInvalidException e) {
            model.addAttribute("site", captchaSettings.getSite());
            //todo: zmienić kod ma message
            model.addAttribute("captchaError", "Uzupełnij kapcze");
            return "registration";
        }

        if (bindingResult.hasErrors()) {
            model.addAttribute("site", captchaSettings.getSite());
            return "registration";
        }

        userService.save(userForm);
        confirmationAccountService.sendEmail(userForm);

        return "tokenSent";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value={"", "/", "/welcome","hello"})
    public String welcome(Model model) {
        return "welcome";
    }

    //HOME
    @RequestMapping(value = "/users/managemnent", method = RequestMethod.GET)
    public String manageUsers() {
        return "manageUsers";
    }

    @RequestMapping(value = "/users/report", method = RequestMethod.GET)
    public String sendReport() {
        String username = ((org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.findByUsername(username);
        reportService.sendEmail(user);
        return "redirect:/users/managemnent";
    }

    //GET ALL
    @RequestMapping(value = "/users/list", method = RequestMethod.GET)
    public String usersList(ModelMap model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }
}
