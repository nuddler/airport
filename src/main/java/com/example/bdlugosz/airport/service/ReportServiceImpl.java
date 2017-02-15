package com.example.bdlugosz.airport.service;

import com.example.bdlugosz.airport.model.User;
import com.google.common.collect.Lists;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import it.ozimov.springboot.templating.mail.model.Email;
import it.ozimov.springboot.templating.mail.model.impl.EmailAttachmentImpl;
import it.ozimov.springboot.templating.mail.model.impl.EmailImpl;
import it.ozimov.springboot.templating.mail.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.io.ByteArrayOutputStream;
import java.nio.charset.Charset;
import java.util.*;
import java.util.List;

@Service
@Slf4j
public class ReportServiceImpl implements ReportService {

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    public void sendEmail(User userForm) {
        final Email email;
        try {
            byte[] bytes = generateRaport().toByteArray();

            final EmailAttachmentImpl.EmailAttachmentImplBuilder attachment = EmailAttachmentImpl.builder().attachmentName("report.pdf")
                    .attachmentData(bytes).mediaType(MediaType.APPLICATION_PDF);

            email = EmailImpl.builder()
                    .from(new InternetAddress("mymail@mail.co.uk"))
                    .to(Lists.newArrayList(new InternetAddress(userForm.getEmail())))
                    //todo zmienić na message
                    .subject("Report")
                    .body("Report")
                    .attachments(Lists.newArrayList(attachment.build()))
                    .encoding(Charset.forName("UTF-8")).build();
            emailService.send(email);
        } catch (AddressException e) {
            log.error("Msg  ", e);
        }
    }

    public ByteArrayOutputStream generateRaport() {
        try {
            ByteArrayOutputStream file = new ByteArrayOutputStream();

            Document document = new Document();
            PdfWriter.getInstance(document, file);

            document.open();
            document.add(new Paragraph("Users Report"));
            document.add(new Paragraph("Generated on: "+new Date().toString()));
            document.add(new Paragraph(" "));

            document.addAuthor("Airport Applications");
            document.addCreationDate();
            document.addCreator("Airport Applications");
            document.addTitle("Users Report");

            List<User> allUsers = userService.getAllUsers();

            PdfPTable pdfTable = new PdfPTable(5);

            PdfPCell cell1 = new PdfPCell(new Phrase("id"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            PdfPCell cell2 = new PdfPCell(new Phrase("Username"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell2);
            PdfPCell cell3 = new PdfPCell(new Phrase("Email"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell3);
            PdfPCell cell4 = new PdfPCell(new Phrase("Roles"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell4);
            PdfPCell cell5 = new PdfPCell(new Phrase("Reservations"));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell5);
            pdfTable.setHeaderRows(1);

            for (int i = 0; i < allUsers.size(); i++) {
                pdfTable.addCell(String.valueOf(allUsers.get(i).getId()));
                pdfTable.addCell(allUsers.get(i).getUsername());
                pdfTable.addCell(allUsers.get(i).getEmail());
                pdfTable.addCell(String.valueOf(allUsers.get(i).getRoles()));
                pdfTable.addCell(String.valueOf(allUsers.get(i).getReservationList()));
            }

            document.add(pdfTable);

            document.close();
            file.close();
            return file;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}