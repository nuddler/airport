package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.User;
import com.google.common.collect.Lists;
import it.ozimov.springboot.templating.mail.model.Email;
import it.ozimov.springboot.templating.mail.model.impl.EmailImpl;
import it.ozimov.springboot.templating.mail.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.nio.charset.Charset;
import java.util.UUID;

/**
 * Created by bdlugosz on 14.01.17.
 */
@Slf4j
@Service
public class ConfirmationAccountServiceImpl implements ConfirmationAccountService {

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    public String generateToken(User user) {
        return UUID.randomUUID().toString();
    }

    public void sendEmail(User userForm) {
        final Email email;
        try {
            email = EmailImpl.builder()
                    .from(new InternetAddress("mymail@mail.co.uk"))
                    .to(Lists.newArrayList(new InternetAddress(userForm.getEmail())))
                    //todo zmienić na message
                    .subject("Link aktywacyjny")
                    .body("http://airport.pl:8080/confirmation?token=" + userForm.getToken() + "\n" +
                            "Username: " + userForm.getUsername() + "\n" +
                            "Password: " + userForm.getPasswordConfirm())
                    .encoding(Charset.forName("UTF-8")).build();
            emailService.send(email);
        } catch (AddressException e) {
            log.error("Msg  ", e);
        }
    }

    public boolean checkToken(String token) {
        if (StringUtils.isEmpty(token)) {
            log.warn("Token is null or empty!!!");
            return false;
        }

        User user = userService.findByToken(token);
        if (user == null || !token.equals(user.getToken())) {
            return false;
        }
        user.setActivated(true);
        userService.update(user);
        return true;
    }
}
