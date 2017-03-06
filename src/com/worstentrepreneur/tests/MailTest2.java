package com.worstentrepreneur.tests;

import java.util.Enumeration;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailTest2 {
    public static void main(String[] args) {

        //for(int port = 1 ;port<500;port++) {
        try {
            //FAIL:465 - Could not convert socket to TLS
            final String username = "javamailtest@worstentrepreneur.com";
            final String password = "Javamail1";
            final int port = 465;
            final String host = "smtp.yandex.com";
            final String recipient = "test@gmail.com";

            Properties props = new Properties();


            //props.put("mail.smtp.host", host);
            //props.put("mail.smtp.auth", "true");
            //props.put("mail.smtp.port", port);
            props.put("mail.smtp.socketFactory.port", port);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            //props.put("mail.smtp.starttls.enable", "true");
            //props.put("mail.smtp.ssl.trust", host);


            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });


            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("SU21B");
            message.setText("JE21KT VENCO21O", "utf-8", "html");










            message.setContent("Václave prosíme vás o test", "text/html; charset=utf-8");

            Transport.send(message);

            //System.out.println("Email sent!");

            System.out.println("SUCCESS:");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //}
    }
}
