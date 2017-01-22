package com.example.bdlugosz.airport.controller;

import com.example.bdlugosz.airport.ReCaptchaInvalidException;
import com.example.bdlugosz.airport.config.CaptchaSettings;
import com.example.bdlugosz.airport.model.User;
import com.example.bdlugosz.airport.service.CaptchaService;
import com.example.bdlugosz.airport.service.ConfirmationAccountService;
import com.example.bdlugosz.airport.service.SecurityService;
import com.example.bdlugosz.airport.service.UserService;
import com.example.bdlugosz.airport.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

@Controller
public class ConfirmationAccountController {
    @Autowired
    private UserService userService;

    @Autowired
    private ConfirmationAccountService confirmationAccountService;

    @RequestMapping(value = "/confirmation")
    public String registration(@PathParam("token") String token) {
        boolean verifiedPositive = confirmationAccountService.checkToken(token);

        if(verifiedPositive) {
            return "tokenPositive";
        } else {
            return "tokenNegative";
        }
    }
}
