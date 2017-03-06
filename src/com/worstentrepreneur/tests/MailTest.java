package com.worstentrepreneur.tests;



import java.io.UnsupportedEncodingException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class MailTest {
    public static void sendMail(String to, String emailText, String freeString, int idOfRegistered) throws AddressException, MessagingException, UnsupportedEncodingException {
        String host = "smtp.yandex.com";
        String from = "javamailtest@worstentrepreneur.com";




        boolean sessionDebug = false;
        Properties props = System.getProperties();
        /*props.put("mail.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");*/
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.yandex.com");
        props.put("mail.smtp.port", "465");

        Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("javamailtest@worstentrepreneur.com", "Javamail1");
            }
        });
        mailSession.setDebug(sessionDebug);



        MimeMessage msg = new MimeMessage(mailSession);
        String subject = "";
        msg.setSubject(subject, "UTF-8");
        msg.setFrom(new InternetAddress(from, "Informבtor La cava.cz"));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setSentDate(new Date());


        BodyPart messageBodyPart = new MimeBodyPart();
        String htmlText = "";
        if ("okRegistration".equals(emailText)){
            subject = "<center><h1>Registrace na vzv-nd.cz.</h1>";
            htmlText = "<p>Dobr‎ den, <br/>dלkujeme vבm za registraci na www.lacava.cz,<br/> vב תטet je automaticky aktivnם.<br/>Hned jakmile bude"+
                    " schvבlena obdrםte od nבs e-mail.<br/>Dלkujeme,<br/>lacava.cz</p></center>";
        }

        if("askForAccept".equals(emailText)){
            subject = "Novב uivatele registrace na lacava.cz.";
            htmlText = "Novב registrace uivatele s Registraטnםmi תdaji:" +
                    freeString;
        }



        messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");

        // Create a related multi-part to combine the parts
        MimeMultipart multipart = new MimeMultipart("related");
        multipart.addBodyPart(messageBodyPart);

        // Associate multi-part with message
        msg.setContent(multipart);

        //msg.setText(messageText);



        Transport.send(msg);
    }
    public static void main(String[] args) throws Exception{
        try {
            sendMail("test@gmail.com", "txt", "", 2);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
