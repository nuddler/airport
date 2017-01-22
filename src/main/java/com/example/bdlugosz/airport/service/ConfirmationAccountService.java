package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.User;
import com.google.common.collect.Lists;
import it.ozimov.springboot.templating.mail.model.Email;
import it.ozimov.springboot.templating.mail.model.impl.EmailImpl;
import it.ozimov.springboot.templating.mail.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.nio.charset.Charset;
import java.util.UUID;

/**
 * Created by bdlugosz on 14.01.17.
 */
public interface ConfirmationAccountService {

    String generateToken(User user);

    void sendEmail(User userForm);

    public boolean checkToken(String token);
}
