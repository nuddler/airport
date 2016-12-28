package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.ReCaptchaInvalidException;

/**
 * Created by bdlugosz on 28.12.16.
 */
public interface CaptchaService {
    void processResponse(String response) throws ReCaptchaInvalidException;
}
