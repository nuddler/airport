package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.User;
import com.itextpdf.text.DocumentException;

import java.io.IOException;
import java.io.OutputStream;

public interface ReportService {
    OutputStream generateRaport() throws IOException, DocumentException;
    void sendEmail(User user);
}