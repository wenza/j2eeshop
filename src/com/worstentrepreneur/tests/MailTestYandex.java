package com.worstentrepreneur.tests;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailTestYandex {
    public static void main(String[] args){
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.yandex.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("javamailtest@worstentrepreneur.com", "Javamail1");
                        }
                    });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("javamailtest@worstentrepreneur.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("test@gmail.com"));
            message.setSubject("Subject");
            message.setText("Text");

            Transport.send(message);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
